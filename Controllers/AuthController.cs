using Library.Contract;
using Library.DTOs.Auth;
using Library.Models;
using Library.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

[Route("api/[controller]")]
[ApiController]
public class AuthController : ControllerBase
{
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly ITokenService _tokenService;

    public AuthController(
        UserManager<ApplicationUser> userManager,
        ITokenService tokenService)
    {
        _userManager = userManager;
        _tokenService = tokenService;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login(LoginDto dto)
    {
        var user = await _userManager.FindByNameAsync(dto.UserName);

        if (user == null)
            return Unauthorized("Invalid username or password");

        var validPassword = await _userManager.CheckPasswordAsync(user, dto.Password);

        if (!validPassword)
            return Unauthorized("Invalid username or password");

        var token = await _tokenService.CreateTokenAsync(user);

        return Ok(new
        {
            Token = token
        });
    }
}