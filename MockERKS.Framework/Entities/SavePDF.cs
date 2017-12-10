namespace MockERKS.Framework.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SavePDF")]
    public partial class SavePDF
    {
        public int ID { get; set; }

        public string PDF_Name { get; set; }
        public string PDF_Type { get; set; }
        public byte[] PDF_Data { get; set; }

        public int? Organization_ID { get; set; }

        public virtual Organization Organization { get; set; }
    }
}
