using Library.DTOs;
using Library.DTOs.BookDTOs;
using Library.DTOs.PublisherDTOs;

namespace Library.Contract
{
    public interface IBookService
    {
        Task<IEnumerable<GetBookDTO>> GetAllAsync();
        Task<IEnumerable<GetBookDTO>> GetByStatusAsync(bool IsAvailable);

        Task<GetBookDTO?> GetByIdAsync(int id);
        Task<GetBookDTO?> GetByNameAsync(string Name );
        Task<IEnumerable<GetBookDTO>> GetByAuthorAsync(int AuthorId );
        Task<IEnumerable<GetBookDTO>> GetByCategoryAsync(int CategoryId );

        Task<GetBookDTO> CreateAsync(CreateBookDTO dto, string userId);

        Task<bool> UpdateAsync(UpdateBookDTO dto, string userId);

        Task<bool> DeleteAsync(int id, string userId);
    }
}
