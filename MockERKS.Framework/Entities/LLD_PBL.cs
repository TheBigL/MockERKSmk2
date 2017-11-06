using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("LLD_PBL")]
    public partial class LLD_PBL
    {
        public int PBL_ID { get; set; }

        public int Plan_Number { get; set; }

        public int Block_Number { get; set; }

        public int Lot_Number { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
