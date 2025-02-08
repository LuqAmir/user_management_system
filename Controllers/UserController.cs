using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

using ClosedXML.Excel;

using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using OfficeOpenXml;
using BCrypt.Net;

using user_management_system.Models;

namespace user_management_system
{
    [Authorize]
    public class UserController : Controller
    {
        private readonly ApplicationDbContext _context;

        
        public UserController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(string startDate, string endDate)
        {
            var users = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(startDate) && DateTime.TryParseExact(startDate, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime start))
            {
                users = users.Where(u => u.CreatedAt >= start);
            }

            if (!string.IsNullOrEmpty(endDate) && DateTime.TryParseExact(endDate, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime end))
            {
                users = users.Where(u => u.CreatedAt <= end);
            }

            return View(await users.ToListAsync());
        }


        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(User user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }

            user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);

            user.BatchId = user.BatchId.PadLeft(4, '0');


            var currentUser = await _context.Users
            .Where(u => u.Username == (User.Identity != null ? User.Identity.Name : null))
            .FirstOrDefaultAsync();

            if (currentUser != null)
            {
                user.AddedBy = currentUser.Fullname;
            }
            else
            {
                user.AddedBy = "System";
            }

            _context.Add(user);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "User created successfully!";

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, User user)
        {
            if (id != user.Id)
            {
                return BadRequest();
            }

            if (!ModelState.IsValid)
            {
                return View(user);
            }

            var existingUser = await _context.Users.FindAsync(id);
            if (existingUser == null)
            {
                return NotFound();
            }

            // Update fields
            existingUser.BatchId = user.BatchId;
            existingUser.Fullname = user.Fullname;
            existingUser.Email = user.Email;
            existingUser.Position = user.Position;
            existingUser.ReportingTo = user.ReportingTo;
            existingUser.Department = user.Department;
            existingUser.DateJoined = user.DateJoined;
            existingUser.UserType = user.UserType;
            existingUser.Access = user.Access;

            _context.Update(existingUser);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "User updated successfully!";
            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            _context.Users.Remove(user);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "User deleted successfully!";
            return RedirectToAction("Index");
        }


        [HttpGet]
        public async Task<IActionResult> ExportToExcel()
        {
            var users = await _context.Users.ToListAsync();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Users");
                var currentRow = 1;

                
                worksheet.Cell(currentRow, 1).Value = "Batch ID";
                worksheet.Cell(currentRow, 2).Value = "Full Name";
                worksheet.Cell(currentRow, 3).Value = "Email";
                worksheet.Cell(currentRow, 4).Value = "Position";
                worksheet.Cell(currentRow, 5).Value = "Reporting To";
                worksheet.Cell(currentRow, 6).Value = "Department";
                worksheet.Cell(currentRow, 7).Value = "Date Joined";
                worksheet.Cell(currentRow, 8).Value = "User Type";
                worksheet.Cell(currentRow, 9).Value = "Access";
                worksheet.Cell(currentRow, 10).Value = "Added By";

               
                worksheet.Row(1).Style.Font.Bold = true;

                
                foreach (var user in users)
                {
                    currentRow++;
                    worksheet.Cell(currentRow, 1).Value = user.BatchId;
                    worksheet.Cell(currentRow, 2).Value = user.Fullname;
                    worksheet.Cell(currentRow, 3).Value = user.Email;
                    worksheet.Cell(currentRow, 4).Value = user.Position;
                    worksheet.Cell(currentRow, 5).Value = user.ReportingTo;
                    worksheet.Cell(currentRow, 6).Value = user.Department;
                    worksheet.Cell(currentRow, 7).Value = user.DateJoined.ToString("yyyy-MM-dd");
                    worksheet.Cell(currentRow, 8).Value = user.UserType;
                    worksheet.Cell(currentRow, 9).Value = user.Access;
                    worksheet.Cell(currentRow, 10).Value = user.AddedBy;
                }

                
                worksheet.Columns().AdjustToContents();

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var content = stream.ToArray();
                    return File(content, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Users.xlsx");
                }
            }
        }


        [HttpGet]
        public IActionResult GetUserRegistrationData(DateTime startDate, DateTime endDate)
        {
            try
            {
                var data = _context.Users
                    .Where(u => u.DateJoined >= startDate && u.DateJoined <= endDate)
                    .AsEnumerable()
                    .GroupBy(u => new { u.DateJoined.Year, u.DateJoined.Month })
                    .Select(g => new 
                    { 
                        date = $"{g.Key.Year}-{g.Key.Month:D2}",
                        count = g.Count()
                    })
                    .OrderBy(d => d.date)
                    .ToList();

                return Json(data);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}"); 
                return StatusCode(500, new { message = ex.Message, details = ex.StackTrace });
            }
        }













    }
}