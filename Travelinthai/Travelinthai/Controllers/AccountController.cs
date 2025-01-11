using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
using Travelinthai.Data;
using Travelinthai.Models;
using Microsoft.Identity.Client;

namespace Travelinthai.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;
        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string UsernameOrEmail, string password, bool remember)
        {
            var User = _context.User_tb
                .FirstOrDefault(u => (u.Username == UsernameOrEmail || u.Useremail == UsernameOrEmail) && u.Password == password);
            if (User == null)
            {
                ViewBag.ErrorMessage = "ชื่อผู้ใช้หรืออีเมล หรือรหัสผ่านไม่ถูกต้อง";
                return View();
            }

            var claims = new[]
            {
                new Claim(ClaimTypes.Name,User.Username),
                new Claim(ClaimTypes.Email,User.Useremail),
            };

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            var principal = new ClaimsPrincipal(identity);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);

            if (User.Role == "Admin")
            {
                return RedirectToAction("Admin", "Admin");
            }
            else
            {
                return RedirectToAction("Index", "Type");
            }

        }
    }
}
