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
        public int? merdianNumber { get; set; }
        public int? rangeNumber { get; set; }
        public int? townshipNumber { get; set; }
        public int? sectionNumber { get; set; }
        public string quarterSectionNumber { get; set; }
        public int? lsd { get; set; }
        public int? planNumber { get; set; }
        public int? blockNumber { get; set; }
        public int? lotNumber { get; set; }
        public int linc { get; set; }
        public string fileStatus { get; set; }
        public DateTime? closedDate { get; set; }
    }
}
