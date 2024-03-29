namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Site_Address
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Site_Address()
        {
            Organizations = new HashSet<Organization>();
        }

        [Key]
        public int Location_Code { get; set; }

        public int? ATS_ID { get; set; }

        [StringLength(255)]
        public string Location { get; set; }

        [StringLength(255)]
        public string Address { get; set; }

        public virtual LLD_ATS LLD_ATS { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Organization> Organizations { get; set; }
    }
}
