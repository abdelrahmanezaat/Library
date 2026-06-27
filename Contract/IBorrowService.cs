using Library.DTOs.BorrowTransactionDTOs;

namespace Library.Contract
{
    public interface IBorrowService
    {
        Task BorrowBookAsync(BorrowDTO dto, string userId);

        Task ReturnBookAsync(int transactionId, string userId);
    }
}
