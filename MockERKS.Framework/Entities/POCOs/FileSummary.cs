using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class FileSummary
    {
        public int fileID { get; set; }
        public string categoryDescription { get; set; }
        public string docTypeDescription { get; set; }
        public DateTime datePosted { get; set; }
        public string securityClassificationTypeDescription { get; set; }
        public string organizationName { get; set; }


    }
}
