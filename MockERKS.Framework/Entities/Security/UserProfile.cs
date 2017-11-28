using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities.Security
{
    public class UserProfile
    {
        public string UserId { get; set; }
        public string UserName { get; set; }
        public int? Officer_ID { get; set; }
        public int? Organization_ID { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public string Email { get; set; }
        public bool EmailConfirmed { get; set; }
        public string RequestedPassord { get; set; }
        public IEnumerable<string> RoleMemberships { get; set; }





    }
}
