namespace Library.Models
{
    public class BorrowTransaction : BaseEntity
    {

        public int BookId { get; set; }
        public bool IsReturned { get; set; }
        public Book Book { get; set; } = null!;

        public int MemberId { get; set; }

        public Member Member { get; set; } = null!;

        public DateTimeOffset BorrowDate { get; set; }

        public DateTimeOffset DueDate { get; set; }

        public DateTimeOffset? ReturnDate { get; set; }
    }
}
