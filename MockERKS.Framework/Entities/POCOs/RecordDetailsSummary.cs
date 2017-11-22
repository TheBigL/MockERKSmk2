using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class RecordDetailsSummary
    {
        public int officerID { get; set; }
        public int fileID { get; set; }
        public DateTime recordDate { get; set; }
        public int status { get; set; }
        public DateTime statusDate { get; set; }
        public DateTime? dateRecieved {get;set;}
        public string subject { get; set; }

        public int essential { get; set; }
    }
}
