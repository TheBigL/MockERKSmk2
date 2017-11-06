using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Record_Details")]
    public partial class Record_Details
    {
        public int Record_ID { get; set; }

        public int File_ID { get; set; }

        public int Officer_ID { get; set; }

        public int Manager_Group_ID { get; set; }

        public DateTime? Record_Date { get; set; }

        public int Status { get; set; }

        public DateTime? Status_Date { get; set; }

        public DateTime? Recieved_Date { get; set; }

        public int Essential { get; set; }

        [StringLength(25)]
        public string Offcial { get; set; }

        public int Storage_Medium { get; set; }

        [StringLength(50)]
        public string Accession { get; set; }

        [StringLength(50)]
        public string Subject { get; set; }

        public string Update_Cycle_Period { get; set; }

        public DateTime? Next_Review_Date { get; set; }

        public DateTime? Last_Review_Date { get; set; }

        public string RM_Classification { get; set; }

        public string RSI { get; set; }

        public virtual Site_File SiteFile { get; set; }

        public virtual Officer Officer { get; set; }

        public virtual Manager_Group ManagerGroup { get; set; }
    }
}
