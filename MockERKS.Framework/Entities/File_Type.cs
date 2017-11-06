using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("File_Type")]
    public partial class File_Type
    {
        public int Type_ID { get; set; }

        public string Type_Description { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
