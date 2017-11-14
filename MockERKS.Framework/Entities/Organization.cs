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
            Site_File = new HashSet<Site_File>();
        }

        [Key]
        public int Organization_ID { get; set; }

        public int? Location_Code { get; set; }

        [StringLength(50)]
        public string Organization_Name { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Organization_Description { get; set; }

        public int? Phone { get; set; }

        [StringLength(125)]
        public string Email { get; set; }

        public virtual Site_Address Site_Address { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_File> Site_File { get; set; }
    }
}
