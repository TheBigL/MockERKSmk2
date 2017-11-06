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
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ATS_ID { get; set; }

        public int? Meridian_Number { get; set; }

        public int? Range_Number { get; set; }

        public int? Township_Number { get; set; }

        public int? Section_Number { get; set; }

        public int? Quarter_Section_Number { get; set; }

        public int? LSD { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_Address> Site_Address { get; set; }
    }
}
