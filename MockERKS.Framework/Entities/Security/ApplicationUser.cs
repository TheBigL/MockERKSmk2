using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
#region Additional Namespaces
using Microsoft.AspNet.Identity.EntityFramework;
#endregion
namespace MockERKS.Framework.Entities.Security
{
    public class ApplicationUser : IdentityUser
    {
        public int? Officer_ID { get; set; }
        public int? Organization_ID { get; set; }
        public int? Phone { get; set; }
        public string Organization_Description { get; set; }
       
    }
}
