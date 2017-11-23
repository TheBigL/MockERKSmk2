namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Site_File
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Site_File()
        {
            Record_Details = new HashSet<Record_Details>();
        }

        [Key]
        public int File_ID { get; set; }

        public int? Type_ID { get; set; }

        public int? Operation_ID { get; set; }

        public int? PBL_ID { get; set; }

        public int? Category_ID { get; set; }

        public int? LINC_Number { get; set; }

        public int? Organization_ID { get; set; }

        public int? Document_ID { get; set; }

        public int? Security_Classification_ID { get; set; }

        [Required]
        [StringLength(25)]
        public string File_Status { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Closed_Date { get; set; }

        public virtual Category Category { get; set; }

        public virtual Document Document { get; set; }

        public virtual File_Type File_Type { get; set; }

        public virtual LLD_PBL LLD_PBL { get; set; }

        public virtual Operation Operation { get; set; }

        public virtual Organization Organization { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Record_Details> Record_Details { get; set; }

        public virtual Security_Classification Security_Classification { get; set; }

        public virtual SPIN_II SPIN_II { get; set; }
    }
}
