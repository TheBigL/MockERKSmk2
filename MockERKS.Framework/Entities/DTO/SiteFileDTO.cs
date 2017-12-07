using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MockERKS.Framework.Entities.POCOs;

namespace MockERKS.Framework.Entities.DTO
{
    public class SiteFileDTO
    {
        public int File_ID { get; set; }
        public string type_description { get; set; }
        public List<FilelookupAdminPOCO> FileList { get; set; }
    }
}
