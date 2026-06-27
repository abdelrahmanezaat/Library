using Library.DTOs;
using Library.DTOs.Member;

namespace Library.Contract
{
    public interface IMemberService
    {
        Task<IEnumerable<GetMemberDTO>> GetAllAsync();
        Task<GetMemberDTO?> GetByIdAsync(int id);
        Task<GetMemberDTO> CreateAsync(CreateMemberDTO dto, string userId);
        Task<bool> UpdateAsync(UpdateMemberDTO dto, string userId);
        Task<bool> DeleteAsync(int id, string userId);
    }
}
