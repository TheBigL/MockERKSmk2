using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class PDFSummary
    {
        public int pdfID { get; set; }

        public string pdfName { get; set; }

        public string pdfType { get; set; }
        public int organizationID { get; set; }
        public string organizationName { get; set; }

        public string ogranizationDescription { get; set; }
        
    }
}
