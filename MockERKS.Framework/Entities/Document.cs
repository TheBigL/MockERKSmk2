namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Document")]
    public partial class Document
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Document()
        {
            Site_File = new HashSet<Site_File>();
        }

        [Key]
        public int Document_ID { get; set; }

        public int? Document_Type_ID { get; set; }

        [Column(TypeName = "date")]
        public DateTime From_Date { get; set; }

        [Required]
        [StringLength(6)]
        public string Microfilm_Roll_Number { get; set; }

        [Required]
        [StringLength(6)]
        public string Microfilm_Frame_Number { get; set; }

        public virtual Document_Type Document_Type { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_File> Site_File { get; set; }
    }
}
