using Library.Contract;
using Library.DTOs;
using Library.DTOs.AuthorDtos;
using Library.DTOs.BookDTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Library.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class BookController : ControllerBase
    {
        private readonly IBookService _BookService;

        public BookController(IBookService bookService)
        {
            _BookService = bookService;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var categories = await _BookService.GetAllAsync();

            return Ok(categories);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var category = await _BookService.GetByIdAsync(id);

            if (category == null)
                return NotFound();

            return Ok(category);
        }
        [HttpGet("{categoryId}")]
        public async Task<IActionResult> GetByCategory(int categoryId)
        {
            var books = await _BookService.GetByCategoryAsync(categoryId);

            if (!books.Any())
                return NotFound("No books found.");

            return Ok(books);
        }

        [HttpGet("{authorId}")]
        public async Task<IActionResult> GetByAuthor(int authorId)
        {
            var books = await _BookService.GetByAuthorAsync(authorId);

            if (!books.Any())
                return NotFound("No books found.");

            return Ok(books);
        }

        [HttpGet("{isAvailable}")]
        public async Task<IActionResult> GetByStatus(bool isAvailable)
        {
            var books = await _BookService.GetByStatusAsync(isAvailable);

            if (!books.Any())
                return NotFound("No books found.");

            return Ok(books);
        }

        [HttpGet("search")]
        public async Task<IActionResult> GetByName([FromQuery] string name)
        {
            var book = await _BookService.GetByNameAsync(name);

            if (book == null)
                return NotFound("Book not found.");

            return Ok(book);
        }

        [HttpPost]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Create(CreateBookDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var category = await _BookService.CreateAsync(dto, userId);

            return Ok(category);
        }

        [HttpPut]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Update(UpdateBookDTO dto)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _BookService.UpdateAsync(dto, userId);

            if (!result)
                return NotFound();

            return NoContent();
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = "Admin,Librarian")]
        public async Task<IActionResult> Delete(int id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var result = await _BookService.DeleteAsync(id, userId);

            if (!result)
                return NotFound();

            return NoContent();
        }
    }
}
