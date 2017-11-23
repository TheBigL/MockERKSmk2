namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Officer")]
    public partial class Officer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Officer()
        {
            Record_Details = new HashSet<Record_Details>();
        }

        [Key]
        public int Officer_ID { get; set; }

        [Required]
        [StringLength(25)]
        public string First_Name { get; set; }

        [Required]
        [StringLength(25)]
        public string Last_Name { get; set; }

        [Required]
        [StringLength(10)]
        public string Phone { get; set; }

        [Required]
        [StringLength(125)]
        public string Email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Record_Details> Record_Details { get; set; }
    }
}
