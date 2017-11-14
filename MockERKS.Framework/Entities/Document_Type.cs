namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Document_Type
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Document_Type()
        {
            Site_File = new HashSet<Site_File>();
        }

        [Key]
        public int Document_Type_ID { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Document_Type_Description { get; set; }

        [Column(TypeName = "date")]
        public DateTime From_Date { get; set; }

        public int Microfilm_Roll_Number { get; set; }

        public int Microfilm_Frame_Number { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_File> Site_File { get; set; }
    }
}
