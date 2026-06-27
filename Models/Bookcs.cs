namespace Library.Models
{
    public class Book : BaseEntity
    {

        public string Title { get; set; } = string.Empty;

        public string ISBN { get; set; } = string.Empty;

        public int PublicationYear { get; set; }

        public string Language { get; set; } = string.Empty;

        public string? Summary { get; set; }

        public string? CoverImageUrl { get; set; }

        public bool IsAvailable { get; set; } = true;

        public int PublisherId { get; set; }
        public Publisher Publisher { get; set; } = null!;
        public int CategoryId { get; set; }
        public Category Category { get; set; } = null!;

        public ICollection<BookAuthor> BookAuthors { get; set; } = new List<BookAuthor>();
    }
}
