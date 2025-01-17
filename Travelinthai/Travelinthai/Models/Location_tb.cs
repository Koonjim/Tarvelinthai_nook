using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Travelinthai.Models
{
    public class Location_tb
    {
        [Key]
        public int LocationID { get; set; }
        
        public string LocationName { get; set; }

        
        public string Details { get; set; }

        
        public string Img { get; set; }

        public string Province { get; set; }

        [ForeignKey("TypeID")]
        public int TypeID { get; set; }
        public Type_tb Type { get; set; }
    }
}
