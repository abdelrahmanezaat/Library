using Library.Models;

namespace Library.DTOs.BookDTOs
{
    public class GetBookDTO:BaseDTO
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;

        public string ISBN { get; set; } = string.Empty;

        public int PublicationYear { get; set; }

        public string Language { get; set; } = string.Empty;

        public string? Summary { get; set; }

        public string? CoverImageUrl  {get; set; }
        public bool IsAvailable { get; set; } = true;

        public int PublisherId { get; set; }
    
        public int CategoryId { get; set; }
        public List<int> AuthorIds { get; set; } = new List<int>();
    }
}
