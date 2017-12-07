using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
   public class FilelookupAdminPOCO
    {
        public int FileID { get; set; }
        public string typeDescription { get; set; }
        public string operationName { get; set; }
        public int operationID { get; set; }
        public int? organizationID { get; set; }
        public string organizationName { get; set; }
        public string SecurityCassification { get; set; }
        public int? securityClassificationID { get; set; }
        public string linc { get; set; }
        public string fileStatus { get; set; }
        public DateTime? ClosedDate { get; set; }
    }
}
