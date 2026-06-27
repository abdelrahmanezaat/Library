namespace Library.Models
{
    public class ActivityLog
    {
        public int Id { get; set; }

        public string UserId { get; set; } = string.Empty;

        public string Action { get; set; } = string.Empty;

        public string EntityName { get; set; } = string.Empty;

        public int? EntityId { get; set; }

        public DateTimeOffset CreatedAt { get; set; }
    }
}
