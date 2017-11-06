using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("LLD_ATS")]
    public partial class LLD_ATS
    {

        public int ATS_ID { get; set; }

        public int Meridian_Number { get; set; }

        public int Range_Number { get; set; }

        public int Township_Number { get; set; }

        public int Section_Number { get; set; }

        public int Quarter_Section_Number { get; set; }

        public int LSD { get; set; }

        public virtual ICollection<Site_Address> SiteAddress { get; set; }
    }
}
