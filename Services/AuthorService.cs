using Library.Contract;
using Library.DTOs;
using Library.DTOs.AuthorDtos;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class AuthorService:IAuthorService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;

        public AuthorService(LibraryContext context, IActivityLogService activityLogService)
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
        }
        public async Task<GetAuthorDTO> CreateAsync(CreateAuthorDTO dto, string userId)
        {
           

            var author = new Author
            {
                Name = dto.Name,
                Summary=dto.Summary,
                CreatedAt = DateTime.UtcNow,

            };

            _dbcontext.Authors.Add(author);

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Create", nameof(Author), author.Id);

            return new GetAuthorDTO
            {
                Id = author.Id,
                Name = author.Name,
                Summary = author.Summary,
                CreatedAt = author.CreatedAt,
            };

        }

        public async Task<bool> DeleteAsync(int id, string userId)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid author ID.");
            var author = await _dbcontext.Authors.FirstOrDefaultAsync(c => c.Id == id && !c.IsDeleted);
            if (author == null)
                throw new Exception("Author not found.");
            author.IsDeleted = true;
            author.DeleteAt = DateTime.UtcNow;
            author.UpdateAt = DateTime.UtcNow;
            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Delete", nameof(Author), author.Id);

            return true;

        }

        public async Task<IEnumerable<GetAuthorDTO>> GetAllAsync()
        {
            return await _dbcontext.Authors
                .AsNoTracking()
                .Where(c => !c.IsDeleted)
                .Select(c => new GetAuthorDTO
                {
                    Id = c.Id,
                    Name = c.Name,
                    Summary = c.Summary,
                    CreatedAt = c.CreatedAt,
                    UpdateAt = c.UpdateAt
                })
                .ToListAsync();


        }

        public async Task<GetAuthorDTO?> GetByIdAsync(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid Author ID.");
            var author = await _dbcontext.Authors
                .AsNoTracking()
                .Where(c => c.Id == id && !c.IsDeleted)
                 .Select(c => new GetAuthorDTO
                 {
                     Id = c.Id,
                     Name = c.Name,
                     Summary = c.Summary,
                     CreatedAt = c.CreatedAt,
                     UpdateAt = c.UpdateAt

                 })
                 .FirstOrDefaultAsync();

            return author;
        }

        public async Task<bool> UpdateAsync(UpdateAuthorDTO dto, string userId)
        {
            if (dto.Id <= 0)
                throw new ArgumentException("Invalid author ID.");
            
            var publisher = await _dbcontext.Authors.FirstOrDefaultAsync(c => c.Id == dto.Id && !c.IsDeleted);
            if (publisher == null)
                return false;
            publisher.Name = dto.Name;
            publisher.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Update", nameof(Author), publisher.Id);

            return true;
        }
    }
}
