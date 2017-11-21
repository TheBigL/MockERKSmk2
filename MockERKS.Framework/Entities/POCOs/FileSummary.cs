﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class FileSummary
    {
        public int fileID { get; set; }
        public string categoryName { get; set; }
        public string docTypeDescription { get; set; }
        public string securityClassificationTypeName { get; set; }
        public string organizationName { get; set; }
        public string operationName { get; set; }

        public bool approval { get; set; }




    }
}
