namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Record_Details
    {
        [Key]
        public int Record_ID { get; set; }

        public int? File_ID { get; set; }

        public int? Officer_ID { get; set; }

        public int? Manager_Group_ID { get; set; }

        [Column(TypeName = "date")]
        public DateTime Record_Date { get; set; }

        public int Status { get; set; }

        [Column(TypeName = "date")]
        public DateTime Status_Date { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Recieved_Date { get; set; }

        public int Essential { get; set; }

        [Required]
        [StringLength(25)]
        public string Offcial { get; set; }

        public int Storage_Medium { get; set; }

        [StringLength(50)]
        public string Accession { get; set; }

        [StringLength(50)]
        public string Subject { get; set; }

        [Column(TypeName = "text")]
        public string Update_Cycle_Period { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Next_Review_Date { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Last_Review_Date { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string RM_Classification { get; set; }

        [Column(TypeName = "text")]
        public string RSI { get; set; }

        public virtual Manager_Group Manager_Group { get; set; }

        public virtual Officer Officer { get; set; }

        public virtual Site_File Site_File { get; set; }
    }
}
