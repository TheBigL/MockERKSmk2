namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LLD_ATS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LLD_ATS()
        {
            Site_Address = new HashSet<Site_Address>();
        }

        [Key]
        public int ATS_ID { get; set; }

        [StringLength(6)]
        public string Meridian_Number { get; set; }

        [StringLength(6)]
        public string Range_Number { get; set; }

        [StringLength(6)]
        public string Township_Number { get; set; }

        [StringLength(6)]
        public string Section_Number { get; set; }

        [StringLength(6)]
        public string Quarter_Section_Number { get; set; }

        [StringLength(6)]
        public string LSD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_Address> Site_Address { get; set; }
    }
}
