using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.POCOs
{
    public class organizationRegistrationPOCO
    {
        public string Email { get; set; }
        public string Organization_Name { get; set; }

        public string Organization_Description { get; set; }
        public int? Phone { get; set; }

        public int? Organization_ID { get; set; }


    }
}
