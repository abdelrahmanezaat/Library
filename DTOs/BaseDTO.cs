namespace Library.DTOs
{
    public class BaseDTO
    {
        //public int Id { get; set; }
        public DateTimeOffset CreatedAt { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset? UpdateAt { get; set; }

    }
}
