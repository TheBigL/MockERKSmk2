using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("SPIN_II")]
    public partial class SPIN_II
    {
        public int LINC_Number { get; set; }

        [StringLength(50)]
        public string Street_Range { get; set; }

        [StringLength(50)]
        public string Avenue_Range { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
