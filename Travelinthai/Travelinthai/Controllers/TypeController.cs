﻿using Travelinthai.Data;
using Microsoft.AspNetCore.Mvc;
using Travelinthai.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace Travelinthai.Controllers
{
    public class TypeController : Controller
    {
        private readonly ApplicationDbContext _context;
        public TypeController(ApplicationDbContext context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult TypeUser()
        {
            IEnumerable<Type_tb> Types = _context.Type_tb
               
               .ToList();
            return View(Types);
        }
        public IActionResult TypeAdmin()
        {
            IEnumerable<Type_tb> Types = _context.Type_tb

               .ToList();
            return View(Types);
        }
    }
}
