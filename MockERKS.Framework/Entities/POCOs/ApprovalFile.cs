using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class ApprovalFile
    {
        public int fileID { get; set; }

        public string fileTitle { get; set; }
        public string fileDescription { get; set; }
        public string securityClassification { get; set; }
        public string fileType { get; set; }
        public int organizationID { get; set; }
        public string organizationName { get; set; }
        public string operationName { get; set; }
        public bool approval { get; set; }
    }
}
