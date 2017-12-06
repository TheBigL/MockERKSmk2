using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class OrganizationListAdminPOCO
    {
        public int OrganizationID { get; set; }
       
        public int LocationCode { get; set; }
        public int DescriptionID { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string LocationAddress {get;set;}

        
        
    }
}
