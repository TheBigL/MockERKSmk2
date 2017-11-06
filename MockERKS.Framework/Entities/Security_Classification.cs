using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Security_Classification")]
    public partial class Security_Classification
    {
        public int Security_Classification_ID { get; set; }

        [StringLength(50)]
        public string Security_Classification_Name { get; set; }

        public string Security_Classification_Description { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
