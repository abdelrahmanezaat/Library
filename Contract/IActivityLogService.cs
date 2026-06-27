namespace Library.Contract
{
    public interface IActivityLogService
    {
        Task LogAsync(string userId, string action, string entityName, int? entityId = null);
    }
}
