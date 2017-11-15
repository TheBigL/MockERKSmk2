using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.BLL.Security
{
    public class ApplicationUser : IdentityUser
    {
        public int? AdminId { get; set; }
        public int? StaffId { get; set; }

        public int? OrganizationId { get; set; }

    }
}
