using Microsoft.AspNetCore.Mvc;
using Travelinthai.Data;
using Travelinthai.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Travelinthai.Controllers
{
    public class AdminController : Controller
    {
       
        private readonly ApplicationDbContext _context;
        public AdminController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult MesasureAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                
                .ToList();

            return View(locations);
        }
        public IActionResult Admin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                
                .ToList();

            return View(locations);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            var locations = _context.Location_tb.Find(id);
            if (locations == null)
            {
                return NotFound();
            }
            _context.Location_tb.Remove(locations);
            _context.SaveChanges();
            return RedirectToAction("Admin", "Admin");
        }
    }
}
