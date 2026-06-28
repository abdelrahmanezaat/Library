using AutoMapper;
using Library.Contract;
using Library.DTOs.BookDTOs;
using Library.DTOs.BorrowTransactionDTOs;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class BorrowService : IBorrowService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;
        private readonly IMapper _mapper;


        public BorrowService( LibraryContext context,IActivityLogService activityLogService, IMapper mapper)
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
            _mapper = mapper;
        }
        public async Task BorrowBookAsync(BorrowDTO dto, string userId)
        {
            var book = await _dbcontext.Books
                .FirstOrDefaultAsync(x => x.Id == dto.BookId && !x.IsDeleted);

            if (book == null)
                throw new Exception("Book not found");

            if (!book.IsAvailable)
                throw new Exception("Book is already borrowed");

            var member = await _dbcontext.Members
                .FirstOrDefaultAsync(x => x.Id == dto.MemberId && !x.IsDeleted);

            if (member == null)
                throw new Exception("Member not found");

            var transaction = new BorrowTransaction
            {
                BookId = dto.BookId,
                MemberId = dto.MemberId,
                BorrowDate = DateTimeOffset.UtcNow,
                CreatedAt=DateTimeOffset.UtcNow,
                DueDate = dto.DueDate
            };

            book.IsAvailable = false;

            _dbcontext.BorrowTransactions.Add(transaction);

            await _dbcontext.SaveChangesAsync();

            await _activityLogService.LogAsync(
                userId,
                "Borrow",
                nameof(BorrowTransaction),
                transaction.Id);
        }
        public async Task ReturnBookAsync(int transactionId, string userId)
        {
            var transaction = await _dbcontext.BorrowTransactions
                .Include(x => x.Book)
                .FirstOrDefaultAsync(x => x.Id == transactionId);

            if (transaction == null)
                throw new Exception("Transaction not found");

            if (transaction.ReturnDate != null)
                throw new Exception("Book already returned");

            transaction.ReturnDate = DateTimeOffset.UtcNow;
            transaction.IsReturned = true;
            

            transaction.Book.IsAvailable = true;

            await _dbcontext.SaveChangesAsync();

            await _activityLogService.LogAsync(
                userId,
                "Return",
                nameof(BorrowTransaction),
                transaction.Id);
        }
        public async Task<GetBorrowDTO?> GetByIdAsync(int id)
        {
            var borrow = await _dbcontext.BorrowTransactions
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted);

            if (borrow == null)
                return null;

            return _mapper.Map<GetBorrowDTO>(borrow);
        }
        public async Task<IEnumerable<GetBorrowDTO>> GetAllAsync()
        {
            var borrows = await _dbcontext.BorrowTransactions
                .AsNoTracking()
                .Where(x => !x.IsDeleted)
                .ToListAsync();

            return _mapper.Map<List<GetBorrowDTO>>(borrows);
        }
        public async Task<IEnumerable<GetBorrowDTO>> GetByStatusAsync(bool IsReturned)
        {
            var borrows = await _dbcontext.BorrowTransactions
                .AsNoTracking()
                .Where(x => !x.IsDeleted && x.IsReturned == IsReturned)
                .ToListAsync();

            return _mapper.Map<List<GetBorrowDTO>>(borrows);
        }
        public async Task<IEnumerable<GetBorrowDTO>> GetByMemberIdAsync(int MemberId)
        {
            var borrows = await _dbcontext.BorrowTransactions
                .AsNoTracking()
                .Where(x => !x.IsDeleted && x.MemberId == MemberId)
                .ToListAsync();

            return _mapper.Map<List<GetBorrowDTO>>(borrows);
        }

        public async Task<bool> DeleteAsync(int id, string userId)
        {
            var borrow = await _dbcontext.BorrowTransactions
                .FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted);

            if (borrow == null)
                return false;

            borrow.IsDeleted = true;
            borrow.DeleteAt = DateTimeOffset.UtcNow;
            borrow.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();

               
            await _activityLogService.LogAsync(userId, "Delete", nameof(BorrowTransaction), borrow.Id);

            return true;
        }
    }
}
