using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Organization")]
    public partial class Organization
    {
        public int Organization_ID { get; set; }

        public int Location_Code { get; set; }

        [StringLength(50)]
        public string Organization_Name { get; set; }

        public string Organization_Description { get; set; }

        public string Phone { get; set; }

        [StringLength(125)]
        public string Email { get; set; }

        public virtual Site_File Site_File { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
