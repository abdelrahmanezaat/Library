using Library.Contract;
using Library.DTOs;
using Library.DTOs.CategoryDTOs;
using Library.DTOs.PublisherDTOs;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class PublisherService:IPublisherService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;

        public PublisherService(LibraryContext context, IActivityLogService activityLogService)
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
        }
        public async Task<GetPublisherDTO> CreateAsync(CreatePublisherDTO dto, string userId)
        {
           

            var publisher = new Publisher
            {
                Name = dto.Name,
                CreatedAt = DateTime.UtcNow,

            };

            _dbcontext.Publishers.Add(publisher);

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Create", nameof(Publisher), publisher.Id);

            return new GetPublisherDTO
            {
                Id = publisher.Id,
                Name = publisher.Name,
                CreatedAt = publisher.CreatedAt,
            };

        }

        public async Task<bool> DeleteAsync(int id, string userId)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid publisher ID.");
            var publisher = await _dbcontext.Publishers.FirstOrDefaultAsync(c => c.Id == id && !c.IsDeleted);
            if (publisher == null)
                throw new Exception("publisher not found.");
            publisher.IsDeleted = true;
            publisher.DeleteAt = DateTime.UtcNow;
            publisher.UpdateAt = DateTime.UtcNow;
            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Delete", nameof(Publisher), publisher.Id);

            return true;

        }

        public async Task<IEnumerable<GetPublisherDTO>> GetAllAsync()
        {
            return await _dbcontext.Publishers.AsNoTracking()
                .Where(c => !c.IsDeleted)
                .Select(c => new GetPublisherDTO
                {
                    Id = c.Id,
                    Name = c.Name,
                    CreatedAt = c.CreatedAt,
                    UpdateAt = c.UpdateAt
                })
                .ToListAsync();


        }

        public async Task<GetPublisherDTO?> GetByIdAsync(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid publisher ID.");
            var publisher = await _dbcontext.Publishers
                .AsNoTracking()
                .Where(c => c.Id == id && !c.IsDeleted)
                 .Select(c => new GetPublisherDTO
                 {
                     Id = c.Id,
                     Name = c.Name,
                     CreatedAt = c.CreatedAt,
                     UpdateAt = c.UpdateAt

                 })
                 .FirstOrDefaultAsync();

            return publisher;
        }

        public async Task<bool> UpdateAsync(UpdatePublisherDTO dto, string userId)
        {
            if (dto.Id <= 0)
                throw new ArgumentException("Invalid publisher ID.");
            
            var publisher = await _dbcontext.Publishers.FirstOrDefaultAsync(c => c.Id == dto.Id && !c.IsDeleted);
            if (publisher == null)
                return false;
            publisher.Name = dto.Name;
            publisher.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Update", nameof(Publisher), publisher.Id);

            return true;
        }
    }
}
