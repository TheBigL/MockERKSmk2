namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Organization")]
    public partial class Organization
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Organization()
        {
            SavePDFs = new HashSet<SavePDF>();
            Site_File = new HashSet<Site_File>();
        }

        [Key]
        public int Organization_ID { get; set; }

        public int? Location_Code { get; set; }

        [Required]
        [StringLength(225)]
        public string Organization_Name { get; set; }

        public int? Description_ID { get; set; }

        [Required]
        [StringLength(10)]
        public string Phone { get; set; }

        [Required]
        [StringLength(125)]
        public string Email { get; set; }

        [Required]
        [StringLength(125)]
        public string User_Name { get; set; }

        public virtual Organization_Description Organization_Description { get; set; }

        public virtual Site_Address Site_Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SavePDF> SavePDFs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_File> Site_File { get; set; }
    }
}
