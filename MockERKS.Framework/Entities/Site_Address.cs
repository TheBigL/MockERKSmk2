using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Site_Address")]
    public partial class Site_Address
    {
        public int Location_Code { get; set; }

        public int ATS_ID { get; set; }

        [StringLength(255)]
        public string Location { get; set; }

        [StringLength(255)]
        public string Address { get; set; }

        [StringLength(255)]
        public string Street { get; set; }

        [StringLength(255)]
        public string City { get; set; }

        [StringLength(255)]
        public string Province { get; set; }

        [StringLength(6)]
        public string Postal_Code { get; set; }

        public virtual LLD_ATS LLD_ATS { get; set; }

        public virtual ICollection<Organization> Organization { get; set; }
    }
}
