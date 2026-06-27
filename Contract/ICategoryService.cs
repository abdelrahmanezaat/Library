using Library.DTOs.CategoryDTOs;

namespace Library.Contract
{
    public interface ICategoryService
    {
        Task<IEnumerable<GetCategoryDTO>> GetAllAsync();

        Task<GetCategoryDTO?> GetByIdAsync(int id);

        Task<GetCategoryDTO> CreateAsync(CreateCategoryDTO dto,string userId);

        Task<bool> UpdateAsync( UpdateCategoryDTO dto, string userId);

        Task<bool> DeleteAsync(int id,string userId);
    }
}
