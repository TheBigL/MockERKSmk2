using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class FileTypePOCO
    {


        public int FileID { get; set; }

        public string filetype { get; set; }
        public string operationName { get; set; }
        public string organizationName { get; set; }
        public string CategoryName { get; set; }

        public int OrganizationID { get; set; }

        public string DocumentType { get; set; }

        public string SecurityClassification { get; set; }

       
        public string FileStatus { get; set; }




    }
}
