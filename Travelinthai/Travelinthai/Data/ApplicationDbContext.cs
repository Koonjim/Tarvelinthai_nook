using Microsoft.EntityFrameworkCore;
using Travelinthai.Models;
using Microsoft.Extensions.Options;
namespace Travelinthai.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) 
        {
            
        }

        public DbSet<Location_tb> Location_tb {  get; set; }
        public DbSet<Type_tb> Type_tb { get; set; }
        public DbSet<User_tb> User_tb { get; set; }

    }
}
