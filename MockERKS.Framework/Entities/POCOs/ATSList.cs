using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class ATSList
    {
        public int ATSID { get; set; }
        public string meridian { get; set; }
        public string range { get; set; }
        public string township { get; set; }
        public string section { get; set; }
        public string quarterSection { get; set; }
        public string lsd { get; set; }
    }
}
