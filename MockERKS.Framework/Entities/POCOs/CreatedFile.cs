using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class CreatedFile
    {
        public int fileID { get; set; }
        public int? orgainzationID { get; set; }
        public string organizationName { get; set; }
        public string categoryName { get; set; }
        public string operationName { get; set; }
        
        
    }
}
