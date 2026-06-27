namespace Library.Models
{
    public class BaseEntity
    {
        public int Id { get; set; }
        public DateTimeOffset CreatedAt { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset? UpdateAt { get; set; } 
        public DateTimeOffset? DeleteAt { get; set; } 
        
        public bool IsDeleted { get; set; } = false;
    }
}
