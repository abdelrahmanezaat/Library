using AutoMapper;
using Library.Contract;
using Library.DTOs;
using Library.DTOs.AuthorDtos;
using Library.DTOs.Member;
using Library.Models;
using Microsoft.EntityFrameworkCore;

namespace Library.Services
{
    public class MemberService:IMemberService
    {
        private readonly LibraryContext _dbcontext;
        private readonly IActivityLogService _activityLogService;
        private readonly IMapper _mapper;
        public MemberService(LibraryContext context, IActivityLogService activityLogService, IMapper mapper) 
        {
            _dbcontext = context;
            _activityLogService = activityLogService;
            _mapper = mapper;
        }
        public async Task<GetMemberDTO> CreateAsync(CreateMemberDTO dto, string userId)
        {


            var member = _mapper.Map<Member>(dto);
            member.CreatedAt = DateTimeOffset.UtcNow;    

            _dbcontext.Members.Add(member);

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Create", nameof(Member), member.Id);

            return _mapper.Map<GetMemberDTO>(member);

        }

        public async Task<bool> DeleteAsync(int id, string userId)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid member ID.");
            var member = await _dbcontext.Members.FirstOrDefaultAsync(c => c.Id == id && !c.IsDeleted);
            if (member == null)
                throw new Exception("Member not found.");
            member.IsDeleted = true;
            member.DeleteAt = DateTime.UtcNow;
            member.UpdateAt = DateTime.UtcNow;
            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Delete", nameof(Member), member.Id);

            return true;

        }

        public async Task<IEnumerable<GetMemberDTO>> GetAllAsync()
        {
            var members= await _dbcontext.Members
                .AsNoTracking()
                .Where(c => !c.IsDeleted)
                .ToListAsync();
            return _mapper.Map<IEnumerable<GetMemberDTO>>(members);


        }

        public async Task<GetMemberDTO?> GetByIdAsync(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid Member ID.");
            var member = await _dbcontext.Members
                .AsNoTracking()
                .Where(c => c.Id == id && !c.IsDeleted)
                 .FirstOrDefaultAsync();

            return _mapper.Map<GetMemberDTO?>(member);
        }

        public async Task<bool> UpdateAsync(UpdateMemberDTO dto, string userId)
        {
            if (dto.Id <= 0)
                throw new ArgumentException("Invalid member ID.");

            var member = await _dbcontext.Members.FirstOrDefaultAsync(c => c.Id == dto.Id && !c.IsDeleted);
            if (member == null)
                return false;
            member=_mapper.Map(dto, member);

            member.UpdateAt = DateTimeOffset.UtcNow;

            await _dbcontext.SaveChangesAsync();
            await _activityLogService.LogAsync(userId, "Update", nameof(Member), member.Id);

            return true;
        }

       
    }
}
