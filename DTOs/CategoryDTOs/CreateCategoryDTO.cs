namespace Library.DTOs.CategoryDTOs
{
    public class CreateCategoryDTO
    {
        public int? ParentId { get; set; }
        public string Name { get; set; } = string.Empty;
    }
}
