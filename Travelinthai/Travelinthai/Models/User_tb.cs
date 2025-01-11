using System.ComponentModel.DataAnnotations;

namespace Travelinthai.Models
{
    public class User_tb
    {
        [Key]
        public int UserID { get; set; }
        public string Username { get; set; }
        public string Useremail { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
    }
}
