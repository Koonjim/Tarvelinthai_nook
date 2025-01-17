using Microsoft.AspNetCore.Mvc;
using Travelinthai.Data;
using Travelinthai.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis;
using Mono.TextTemplating;
using System.Linq.Expressions;

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
        public IActionResult BeachAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                
                .ToList();
            return View(locations);
        }
        public IActionResult MountainAdmin()
        {
            IEnumerable<Location_tb> locations = _context.Location_tb
                .Include(b => b.Type)
                
                .ToList();
            return View(locations);
        }
        public IActionResult WaterfallAdmin()
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
            
            var Location = _context.Location_tb.Find(id);
            if (Location == null)
            {
                return View();
            }

            _context.Location_tb.Remove(Location);
            _context.SaveChanges();
            return RedirectToAction("TypeAdmin", "Type");
        }
             
        public IActionResult Edit(int id)
        {
            // เช็กว่า ID มีค่าไหม
            var location = _context.Location_tb.Find(id);
            if (location == null)
            {
                return NotFound();
            }
            
            return View(location);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(string locationname, string details, string img, string province, int locationID, int typeID)
        {
            try
            {
                // แก้ไขข้อมูล
                var editlocation = new Location_tb
                {
                    LocationName = locationname, // กำหนดชื่อสถานที่
                    Details = details,       // กำหนดรายละเอียด
                    Img = img, // กำหนดใส่เป็นลิ้งรูปภาพ
                    Province = province,        // กำหนดจังหวัด
                    LocationID = locationID, // กำหนด ID ของสถานที่
                    TypeID = typeID, // กำหนด ID ของประเภทสถานที่
                };

                _context.Location_tb.Update(editlocation); // อัพเดทข้อมูลที่แก้ไขแล้วลงฐานข้อมูล
                _context.SaveChanges(); // บันทึกการเปลี่ยนแปลงในฐานข้อมูล

                // เปลี่ยนหน้าไปที่หน้าเลือกประเภทของสถานที่
                return RedirectToAction("TypeAdmin", "Type");
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        public IActionResult Create(int id)
        {
            // เช็กว่า ID ต้องไม่มีค่า
            var location = _context.Location_tb.Find(id);
            if (location != null)
            {
                return NotFound();
            }

            return View(location);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(string locationname, string details, string img, string province, int locationID, int typeID)
        {
            try
            {
                // สร้างข้อมูลใหม่
                var Createlocation = new Location_tb                
                {
                    LocationName = locationname, // กำหนดชื่อสถานที่
                    Details = details,       // กำหนดรายละเอียด
                    Img = img, // กำหนดใส่เป็นลิ้งรูปภาพ
                    Province = province,        // กำหนดจังหวัด
                    LocationID = locationID, // กำหนด ID ของสถานที่
                    TypeID = typeID, // กำหนด ID ของประเภทสถานที่
                };

                _context.Location_tb.Add(Createlocation); // เพิ่มข้อมูลลงฐานข้อมูล
                _context.SaveChanges(); // บันทึกการเปลี่ยนแปลงในฐานข้อมูล
                
                return RedirectToAction("TypeAdmin", "Type"); // เปลี่ยนหน้าไปที่หน้าเลือกประเภทของสถานที่
            }
            catch (Exception ex)
            {
                return View();
            }
        }
    }
}
