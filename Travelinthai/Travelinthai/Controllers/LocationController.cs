using Travelinthai.Data;
using Microsoft.AspNetCore.Mvc;
using Travelinthai.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using Microsoft.CodeAnalysis;
using Mono.TextTemplating;

namespace Travelinthai.Controllers
{
    public class LocationController : Controller
    {
        private readonly ApplicationDbContext _context;
        public LocationController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                .ToList();
            return View(locations);
        }
    }
}
