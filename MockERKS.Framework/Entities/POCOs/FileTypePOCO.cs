using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class FileTypePOCO
    {
       
        public int typeId { get; set; }
        public string typeName { get; set; }
        public int organizationId { get; set; }
        public string organizationName { get; set; }
        public string fileStatus { get; set; }
        public DateTime? closedDate { get; set; }
        public int fileID { get; set; }
        public string categoryName { get; set; }
        public string docTypeDescription { get; set; }
        public string securityClassificationTypeName { get; set; }
        public string operationName { get; set; }



    }
}
