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
        public int? OfficerID { get; set; }
        public int? OrganizationID { get; set; }
    }
}
