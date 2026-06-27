using Library.Contract;
using Library.DTOs.BorrowTransactionDTOs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

[ApiController]
[Route("api/[controller]/[action]")]
[Authorize]
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

    [HttpPost("return/{transactionId}")]
    [Authorize(Roles = "Admin,Librarian,Staff")]


    public async Task<IActionResult> Return(int transactionId)
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier)!;

        await _borrowService.ReturnBookAsync(transactionId, userId);

        return Ok("Book returned successfully.");
    }
}