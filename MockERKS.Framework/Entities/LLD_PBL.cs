namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LLD_PBL
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LLD_PBL()
        {
            Site_File = new HashSet<Site_File>();
        }

        [Key]
        public int PBL_ID { get; set; }

        public int Plan_Number { get; set; }

        public int? Block_NUmber { get; set; }

        public int? Lot_Number { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Site_File> Site_File { get; set; }
    }
}
