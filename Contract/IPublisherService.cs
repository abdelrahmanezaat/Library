using Library.DTOs;
using Library.DTOs.PublisherDTOs;

namespace Library.Contract
{
    public interface IPublisherService
    {
        Task<IEnumerable<GetPublisherDTO>> GetAllAsync();

        Task<GetPublisherDTO?> GetByIdAsync(int id);

        Task<GetPublisherDTO> CreateAsync(CreatePublisherDTO dto,string userId);

        Task<bool> UpdateAsync(UpdatePublisherDTO dto,string userId);

        Task<bool> DeleteAsync(int id,string userId);
    }
}
