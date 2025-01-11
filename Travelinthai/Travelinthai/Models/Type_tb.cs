using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Travelinthai.Models
{
    public class Type_tb
    {
        public ICollection<Location_tb> Locations { get; set; }
        [Key]
        public int TypeID { get; set; }
        public string TypeName { get; set; }
        
    }
}
