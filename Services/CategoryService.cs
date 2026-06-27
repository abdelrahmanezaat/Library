using Library.Contract;
using Library.DTOs.CategoryDTOs;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;

        public CategoryService(LibraryContext context, IActivityLogService activityLogService)
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
        }
        public async Task<GetCategoryDTO> CreateAsync(CreateCategoryDTO dto, string userId)
        {
            if (dto.ParentId.HasValue)
            {
                var exists = await _dbcontext.Categories
                    .AnyAsync(c => c.Id == dto.ParentId && !c.IsDeleted);

                if (!exists)
                    throw new Exception("Parent category not found.");
            }

            var category = new Category
            {
                Name = dto.Name,
                ParentId = dto.ParentId,
                CreatedAt= DateTime.UtcNow,

            };

            _dbcontext.Categories.Add(category);

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId,"Create",nameof(Category),category.Id);

            return new GetCategoryDTO
            {
                Id = category.Id,
                Name = category.Name,
                ParentId = category.ParentId,
                CreatedAt = category.CreatedAt,
            };

        }

        public async Task<bool> DeleteAsync(int id, string userId)
        {
            if(id <= 0)
                throw new ArgumentException("Invalid category ID.");
            var category = await _dbcontext.Categories.FirstOrDefaultAsync(c => c.Id == id && !c.IsDeleted);
            if (category == null)
                throw new Exception("Category not found.");
            category.IsDeleted = true;
            category.DeleteAt = DateTime.UtcNow;
            category.UpdateAt= DateTime.UtcNow;
            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Delete", nameof(Category), category.Id);

            return true;

        }

        public async Task<IEnumerable<GetCategoryDTO>> GetAllAsync()
        {
            return await _dbcontext.Categories
                .Where(c => !c.IsDeleted)
                .AsNoTracking()
                .Select(c => new GetCategoryDTO
                {
                    Id = c.Id,
                    Name = c.Name,
                    ParentId = c.ParentId,
                    CreatedAt= c.CreatedAt,
                    UpdateAt= c.UpdateAt
                })
                .ToListAsync();
         
           
        }

        public async Task<GetCategoryDTO?> GetByIdAsync(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid category ID.");
            var category = await _dbcontext.Categories
                .AsNoTracking()
                .Where(c => c.Id == id && !c.IsDeleted)

                 .Select(c=>new GetCategoryDTO
                 {
                        Id = c.Id,
                        Name = c.Name,
                        ParentId = c.ParentId,
                        CreatedAt = c.CreatedAt,
                        UpdateAt= c.UpdateAt

                 })
                 .FirstOrDefaultAsync();
           
            return category;    
        }

        public async Task<bool> UpdateAsync( UpdateCategoryDTO dto, string userId)
        {
            if (dto.Id <= 0)
                throw new ArgumentException("Invalid category ID.");
            if (dto.ParentId.HasValue)
            {
                var exists = await _dbcontext.Categories
                    .AnyAsync(c => c.Id == dto.ParentId && !c.IsDeleted);

                if (!exists)
                    throw new Exception("Parent category not found.");
                if (dto.ParentId == dto.Id)
                    throw new Exception("Category cannot be its own parent.");
            }
            var category = await _dbcontext.Categories.FirstOrDefaultAsync(c => c.Id == dto.Id && !c.IsDeleted);
            if (category == null)
                return false;
            category.Name = dto.Name;
            category.ParentId = dto.ParentId;
            category.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Update", nameof(Category), category.Id);

            return true;
        }
    }
}
