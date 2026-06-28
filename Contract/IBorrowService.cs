using Library.DTOs.BookDTOs;
using Library.DTOs.BorrowTransactionDTOs;
using Library.DTOs.CategoryDTOs;

namespace Library.Contract
{
    public interface IBorrowService
    {
        Task<IEnumerable<GetBorrowDTO>> GetAllAsync();
        Task<GetBorrowDTO?> GetByIdAsync(int id);
        Task<IEnumerable<GetBorrowDTO>> GetByMemberIdAsync(int memberId);
        Task<IEnumerable<GetBorrowDTO>> GetByStatusAsync(bool IsReturned);


        Task BorrowBookAsync(BorrowDTO dto, string userId);

        Task ReturnBookAsync(int transactionId, string userId);

        Task<bool> DeleteAsync(int id, string userId);
    }
}
