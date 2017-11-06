using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Document_Type")]
    public partial class Document_Type
    {
        public int Document_Type_ID { get; set; }

        public string Document_Type_Description { get; set; }

        public DateTime? From_Date { get; set; }

        public int Microfilm_Roll_Number { get; set; }

        public int Microfilm_Frame_Number { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
