namespace Library.DTOs
{
    public class GetAuthorDTO: BaseDTO
    {
        public int Id { get; set; }

        public string Name { get; set; } = string.Empty;
        public string Summary { get; set; } = string.Empty;
    }
}
