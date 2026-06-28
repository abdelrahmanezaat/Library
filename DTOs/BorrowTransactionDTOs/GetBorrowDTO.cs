using Library.Models;

namespace Library.DTOs.BorrowTransactionDTOs
{
    public class GetBorrowDTO
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public bool IsReturned { get; set; }

        public int MemberId { get; set; }


        public DateTimeOffset BorrowDate { get; set; }

        public DateTimeOffset DueDate { get; set; }

        public DateTimeOffset? ReturnDate { get; set; }
    }
}
