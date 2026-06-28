using AutoMapper;
using Library.Contract;
using Library.Contract.Helper;
using Library.DTOs;
using Library.DTOs.AuthorDtos;
using Library.DTOs.BookDTOs;
using Library.Migrations;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class BookService : IBookService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;
        private readonly IMapper _mapper;
        private readonly IImageHelper _imageHelper;

        public BookService(LibraryContext context, IActivityLogService activityLogService, IMapper mapper,IImageHelper imageHelper)
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
            _mapper = mapper;
            _imageHelper = imageHelper;

        }
        public async Task<GetBookDTO> CreateAsync(CreateBookDTO dto, string userId)
        {

            var authorsCount = await _dbcontext.Authors.CountAsync(a => dto.AuthorIds.Contains(a.Id));

            if (authorsCount != dto.AuthorIds.Count)
            {
                throw new ArgumentException("One or more specified authors do not exist.");
            }
            if (!await _dbcontext.Publishers.AnyAsync(p => p.Id == dto.PublisherId))
            {
                throw new ArgumentException("Specified publisher does not exist.");
            }
            if(!await _dbcontext.Categories.AnyAsync(c => c.Id == dto.CategoryId))
            {
                throw new ArgumentException("Specified category does not exist.");
            }

            var book = _mapper.Map<Book>(dto);

            book.CoverImageUrl = await _imageHelper.UploadImageAsync(dto.CoverImage, "Uploads");
            book.CreatedAt = DateTimeOffset.UtcNow;
            book.UpdateAt = DateTimeOffset.UtcNow;

            _dbcontext.Books.Add(book);

            await _dbcontext.SaveChangesAsync();

            var bookAuthors = dto.AuthorIds.Select(x => new BookAuthor
            {
                BookId = book.Id,
                AuthorId = x
            });

            _dbcontext.BookAuthors.AddRange(bookAuthors);

            await _dbcontext.SaveChangesAsync();

            await _activityLogService.LogAsync(userId, "Create", nameof(Book), book.Id);

            return await _dbcontext.Books
                .Include(x => x.BookAuthors)
                .Where(x => x.Id == book.Id)
                .Select(x => _mapper.Map<GetBookDTO>(x))
                .FirstAsync();
        }
        public async Task<bool> DeleteAsync(int id, string userId)
        {
            var book = await _dbcontext.Books
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted);

            if (book == null)
                return false;

            book.IsDeleted = true;
            book.DeleteAt = DateTimeOffset.UtcNow;
            book.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();

            await _activityLogService.LogAsync(userId, "Delete", nameof(Book), book.Id);

            return true;
        }
        public async Task<GetBookDTO?> GetByIdAsync(int id)
        {
            var book = await _dbcontext.Books
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted);

            if (book == null)
                return null;

            return _mapper.Map<GetBookDTO>(book);
        }
        public async Task<IEnumerable<GetBookDTO>> GetAllAsync()
        {
            var books = await _dbcontext.Books
                .AsNoTracking()
                .Where(x => !x.IsDeleted)
                .Include(x => x.BookAuthors)
                .ToListAsync();

            return _mapper.Map<List<GetBookDTO>>(books);
        }
        public async Task<IEnumerable<GetBookDTO>> GetByStatusAsync(bool IsAvailable)
        {
            var books = await _dbcontext.Books
                .AsNoTracking()
                .Where(x => !x.IsDeleted&&x.IsAvailable==IsAvailable)
                .Include(x => x.BookAuthors)
                .ToListAsync();

            return _mapper.Map<List<GetBookDTO>>(books);
        }

       
        public async Task<IEnumerable<GetBookDTO>> GetByCategoryAsync(int CategoryId)
        {
            var books = await _dbcontext.Books
               .AsNoTracking()
               .Where(x => !x.IsDeleted && x.CategoryId==CategoryId)
               .ToListAsync();

            return _mapper.Map<List<GetBookDTO>>(books);
        }
       
        public async Task<IEnumerable<GetBookDTO>> GetByAuthorAsync(int authorId)
        {
            var books = await _dbcontext.Books
                .AsNoTracking()
                .Include(x => x.BookAuthors)
                .Where(x => !x.IsDeleted &&
                            x.BookAuthors.Any(a => a.AuthorId == authorId))
                .ToListAsync();

            return _mapper.Map<List<GetBookDTO>>(books);
        }
        public async Task<GetBookDTO?> GetByNameAsync(string Name)
        {
            var book = await _dbcontext.Books
                .AsNoTracking()
                .Include(x => x.BookAuthors)
                .FirstOrDefaultAsync(x => x.Title == Name  && !x.IsDeleted);

            if (book == null)
                return null;

            return _mapper.Map<GetBookDTO>(book);
        }

        public async Task<bool> UpdateAsync(UpdateBookDTO dto, string userId)
        {
            var authorsCount = await _dbcontext.Authors.CountAsync(a => dto.AuthorIds.Contains(a.Id));

            if (authorsCount != dto.AuthorIds.Count)
            {
                throw new ArgumentException("One or more specified authors do not exist.");
            }
            if (!await _dbcontext.Publishers.AnyAsync(p => p.Id == dto.PublisherId))
            {
                throw new ArgumentException("Specified publisher does not exist.");
            }
            if (!await _dbcontext.Categories.AnyAsync(c => c.Id == dto.CategoryId))
            {
                throw new ArgumentException("Specified category does not exist.");
            }

            var book = await _dbcontext.Books
                .Include(x => x.BookAuthors)
                .FirstOrDefaultAsync(x => x.Id == dto.Id && !x.IsDeleted);

            if (book == null)
                return false;

            _mapper.Map(dto, book);
            

            if (dto.CoverImage != null)
            {
                book.CoverImageUrl =
                    await _imageHelper.UploadImageAsync(dto.CoverImage, "Uploads");
            }

            book.UpdateAt = DateTimeOffset.UtcNow;

            _dbcontext.BookAuthors.RemoveRange(book.BookAuthors);

            book.BookAuthors = dto.AuthorIds.Select(x => new BookAuthor
            {
                BookId = book.Id,
                AuthorId = x
            }).ToList();

            await _dbcontext.SaveChangesAsync();

            await _activityLogService.LogAsync(userId, "Update", nameof(Book), book.Id);

            return true;
        }
    }
}
