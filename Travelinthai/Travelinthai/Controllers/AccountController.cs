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
                return RedirectToAction("TypeAdmin", "Type");
            }
            else
            {
                return RedirectToAction("TypeUser", "Type");
            }

        }
        [HttpGet]
        public IActionResult Register()
        {
            return View();

        }
        [HttpPost]
        public IActionResult Register(string Username, string Email, string Password, string cpassword)
        {
            // ตรวจสอบว่า รหัสผ่านที่กรอกสองครั้งตรงกันหรือไม่
            if (Password != cpassword)
            {
                ModelState.AddModelError("Cpassword", "Passwords do not match."); // ถ้าไม่ตรงให้แสดงข้อความผิดพลาด
                return View(); // ส่งกลับไปที่หน้าฟอร์มสมัครสมาชิก
            }

            // ตรวจสอบว่ามีผู้ใช้หรืออีเมลนี้ในระบบแล้วหรือไม่
            if (_context.User_tb.Any(u => u.Username == Username || u.Useremail == Email))
            {
                ModelState.AddModelError("DuplicateUser", "Username or Email already exists."); // ถ้ามีให้แสดงข้อความผิดพลาด
                return View();
            }

            try
            {
                // สร้างผู้ใช้ใหม่
                var newUser = new User_tb
                {
                    Username = Username, // กำหนดชื่อผู้ใช้
                    Useremail = Email,       // กำหนดอีเมล
                    Password = Password, // เก็บรหัสผ่าน (ควรเก็บแบบเข้ารหัสในโปรดักชัน)
                    Role = "User"        // กำหนดบทบาทผู้ใช้เป็น User
                };

                _context.User_tb.Add(newUser); // เพิ่มผู้ใช้ใหม่ในฐานข้อมูล
                _context.SaveChanges(); // บันทึกการเปลี่ยนแปลงในฐานข้อมูล

                // เปลี่ยนเส้นทางไปที่หน้า Login หลังจากสมัครสมาชิกสำเร็จ
                return RedirectToAction("Login", "Account");
            }
            catch (Exception ex)
            {
                // ถ้ามีข้อผิดพลาดในการสมัครสมาชิก ให้แสดงข้อความผิดพลาด
                ViewBag.ErrorMessage = ex.InnerException?.Message ?? ex.Message;
                return View();
            }
        }
    }
}
