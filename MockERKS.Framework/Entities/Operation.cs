using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Operation")]
    public partial class Operation
    {
        public int Operation_ID { get; set; }

        [StringLength(25)]
        public string Operation_Name { get; set; }

        public string Description { get; set; }

        public virtual ICollection<Site_File> SiteFile { get; set; }
    }
}
