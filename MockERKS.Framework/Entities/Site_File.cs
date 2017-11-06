using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Site_File")]
    public partial class Site_File
    {
        public int File_ID { get; set; }

        public int Type_ID { get; set; }

        public int Operation_ID { get; set; }

        public int PBL_ID { get; set; }

        public int Category_ID { get; set; }

        public int LINC_Number { get; set; }

        public int Organization_ID { get; set; }

        public int Document_Type_ID { get; set; }

        public int Security_Classification_ID { get; set; }

        [StringLength(25)]
        public string File_Status { get; set; }

        public DateTime? Closed_Date { get; set; }

        public virtual File_Type FileType { get; set; }

        public virtual Operation Operation { get; set; }

        public virtual LLD_PBL LLD_PBL { get; set; }

        public virtual Category Category { get; set; }

        public virtual SPIN_II SPIN_II { get; set; }

        public virtual Organization Organization { get; set; }

        public virtual Document_Type DocumentType { get; set; }

        public virtual Security_Classification SecurityClassification { get; set; }

        public virtual ICollection<Record_Details> RecordDetails { get; set; }

        public virtual ICollection<Organization> Organizations { get; set; }
        public virtual ICollection<Manager> Managers { get; set; }
    }
}
