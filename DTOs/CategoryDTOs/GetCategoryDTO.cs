namespace Library.DTOs.CategoryDTOs
{
    public class GetCategoryDTO:BaseDTO
    {
        public int Id { get; set; }
        public int? ParentId { get; set; }
        public string Name { get; set; } = string.Empty;
    }
}
