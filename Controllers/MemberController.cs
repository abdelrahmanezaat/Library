using Library.Contract;
using Library.DTOs;
using Library.DTOs.AuthorDtos;
using Library.Models;
using Library.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Library.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class MemberController : ControllerBase
    {
        private readonly IMemberService _memberService;
        
        public MemberController(IMemberService memberService)
        {
            _memberService = memberService;
        }
        [HttpGet]

        public async Task<IActionResult> GetAll()
        {
            var categories = await _memberService.GetAllAsync();

            return Ok(categories);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var category = await _memberService.GetByIdAsync(id);

            if (category == null)
                return NotFound();

            return Ok(category);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Librarian,Staff")]
        public async Task<IActionResult> Create(CreateMemberDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var category = await _memberService.CreateAsync(dto, userId);

            return Ok(category);
        }

        [HttpPut]
        [Authorize(Roles = "Admin,Librarian,Staff")]
        public async Task<IActionResult> Update(UpdateMemberDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _memberService.UpdateAsync(dto, userId);

            if (!result)
                return NotFound();

            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin,Librarian,Staff")]
        public async Task<IActionResult> Delete(int id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _memberService.DeleteAsync(id, userId);

            if (!result)
                return NotFound();

            return NoContent();
        }
    }
}
