using Library.Contract;
using Library.DTOs.BorrowTransactionDTOs;
using Library.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

[ApiController]
[Route("api/[controller]/[action]")]
public class BorrowController : ControllerBase
{
    private readonly IBorrowService _borrowService;

    public BorrowController(IBorrowService borrowService)
    {
        _borrowService = borrowService;
    }

    [HttpPost]
    [Authorize(Roles = "Admin,Librarian,Staff")]

    public async Task<IActionResult> Borrow(BorrowDTO dto)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

        await _borrowService.BorrowBookAsync(dto, userId);

        return Ok("Book borrowed successfully.");
    }

    [HttpPost("{transactionId}")]
    [Authorize(Roles = "Admin,Librarian,Staff")]


    public async Task<IActionResult> Return(int transactionId)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

        await _borrowService.ReturnBookAsync(transactionId, userId);

        return Ok("Book returned successfully.");
    }
    [HttpGet]
    public async Task<IActionResult> GetAll()
    {
        var categories = await _borrowService.GetAllAsync();

        return Ok(categories);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(int id)
    {
        var category = await _borrowService.GetByIdAsync(id);

        if (category == null)
            return NotFound();

        return Ok(category);
    }
    [HttpGet("{IsReturned}")]
    public async Task<IActionResult> GetByStatus(bool IsReturned)
    {
        var books = await _borrowService.GetByStatusAsync(IsReturned);

        if (!books.Any())
            return NotFound("No books found.");

        return Ok(books);
    }
    [HttpGet("{memberId}")]

    public async Task<IActionResult> GetByMemberId(int memberId)
    {
        var books = await _borrowService.GetByMemberIdAsync(memberId);

        if (!books.Any())
            return NotFound("No books found.");

        return Ok(books);
    }
    [HttpDelete("{id}")]
    [Authorize(Roles = "Admin,Librarian,Staff")]
    public async Task<IActionResult> Delete(int id)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        var result = await _borrowService.DeleteAsync(id, userId);

        if (!result)
            return NotFound();

        return NoContent();
    }
}