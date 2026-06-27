namespace Library.DTOs.BorrowTransactionDTOs
{
    public class BorrowDTO
    {
        public int BookId { get; set; }

        public int MemberId { get; set; }

        public DateTimeOffset DueDate { get; set; }

    }
}
