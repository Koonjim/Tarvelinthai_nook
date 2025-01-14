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
                .Where(b => b.TypeID == 1)
                .ToList();
            return View(locations);
        }
        public IActionResult BeachAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                .Where(b => b.TypeID == 2)
                .ToList();
            return View(locations);
        }public IActionResult MountainAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                .Where(b => b.TypeID == 3)
                .ToList();

            return View(locations);
        }public IActionResult WaterfallAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                .Where(b => b.TypeID == 4)
                .ToList();

            return View(locations);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Delete(int id)
        {
            var Location = _context.Location_tb.Find(id);
            if (Location == null)
            {
                return NotFound();
            }

            _context.Location_tb.Remove(Location);
            _context.SaveChanges();
            return RedirectToAction("TypeAdmin", "Type");
        }
    }
}
