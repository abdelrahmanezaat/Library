using Library.Contract;
using Library.DTOs;
using Library.DTOs.PublisherDTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Library.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class PublisherController : ControllerBase
    {
        private readonly IPublisherService _publisherService;

        public PublisherController(IPublisherService publisherService)
        {
            _publisherService = publisherService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var categories = await _publisherService.GetAllAsync();

            return Ok(categories);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var category = await _publisherService.GetByIdAsync(id);

            if (category == null)
                return NotFound();

            return Ok(category);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Create(CreatePublisherDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var category = await _publisherService.CreateAsync(dto,userId);

            return Ok(category);
        }

        [HttpPut]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Update(UpdatePublisherDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _publisherService.UpdateAsync(dto,userId);

            if (!result)
                return NotFound();

            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Delete(int id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _publisherService.DeleteAsync(id,userId);

            if (!result)
                return NotFound();

            return NoContent();
        }
    }
}
