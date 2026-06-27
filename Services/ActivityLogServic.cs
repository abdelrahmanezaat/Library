using Library.Contract;
using Library.Models;

namespace Library.Services
{
    public class ActivityLogService : IActivityLogService
    {
        private readonly LibraryContext _dbcontext;

        public ActivityLogService(LibraryContext context)
        {
            _dbcontext = context;
        }

        public async Task LogAsync(string userId, string action, string entityName, int? entityId = null)
        {
            var log = new ActivityLog
            {
                UserId = userId,
                Action = action,
                EntityName = entityName,
                EntityId = entityId,
                CreatedAt = DateTimeOffset.UtcNow
            };

            _dbcontext.ActivityLogs.Add(log);
            await _dbcontext.SaveChangesAsync();
        }
    }
}
