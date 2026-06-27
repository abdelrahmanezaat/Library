using Library.DTOs;
using Library.DTOs.AuthorDtos;

namespace Library.Contract
{
    public interface IAuthorService
    {
        Task<IEnumerable<GetAuthorDTO>> GetAllAsync();

        Task<GetAuthorDTO?> GetByIdAsync(int id);

        Task<GetAuthorDTO> CreateAsync(CreateAuthorDTO dto,string userId);

        Task<bool> UpdateAsync(UpdateAuthorDTO dto,string userId);

        Task<bool> DeleteAsync(int id,string userId);
    }
}
