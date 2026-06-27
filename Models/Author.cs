namespace Library.Models
{
    public class Author : BaseEntity
    {

        public string Name { get; set; } = string.Empty;
        public string Summary { get; set; } = string.Empty;

        public ICollection<BookAuthor> BookAuthors { get; set; } = new List<BookAuthor>();
    }
}

