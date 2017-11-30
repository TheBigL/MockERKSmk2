using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class FileReport
    {
        public int fileID { get; set; }
        public string typeDescription { get; set; }
        public string categoryName { get; set; }
        public string operationName { get; set; }
        public int operationID { get; set; }
        public string location { get; set; }
        public string address { get; set; }
        public string merdianNumber { get; set; }
        public string rangeNumber { get; set; }
        public string townshipNumber { get; set; }
        public string sectionNumber { get; set; }
        public string quarterSectionNumber { get; set; }
        public string lsd { get; set; }
        public string planNumber { get; set; }
        public string blockNumber { get; set; }
        public string lotNumber { get; set; }
        public string linc { get; set; }
        public string fileStatus { get; set; }
    }
}
