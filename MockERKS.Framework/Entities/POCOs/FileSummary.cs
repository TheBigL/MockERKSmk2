using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    /*
     * Used to get Reports and GridViews in Lookup page for Files
     * Author: Leban Mohamed
     * 
     * 
     * */
    public class FileSummary
    {
        public int fileID { get; set; }
        public string categoryName { get; set; }
        public string docTypeDescription { get; set; }
        public string securityClassificationTypeName { get; set; }
        public string organizationName { get; set; }
        public string operationName { get; set; }




    }
}
