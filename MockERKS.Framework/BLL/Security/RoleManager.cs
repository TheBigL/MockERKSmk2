using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MockERKS.Framework.DAL.Security;
using MockERKS.Framework.Entities.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;

namespace MockERKS.Framework.BLL.Security
{
    public class RoleManager : RoleManager<IdentityRole>
    {
        public RoleManager() : base(new RoleStore<IdentityRole>(new ApplicationDbContext()))
        {

        }


        public void AddStartupRoles()
        {
            foreach (string roleName in SecurityRoles.StartUpSecurityRoles)
            {
                if (!Roles.Any(r => r.Name == roleName))
                {
                    this.Create(new IdentityRole(roleName));
                }
            }
        }

        #region List All Roles
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<RoleProfile> ListAllRoles()
        {
            var um = new UserManager();
            var result = from data in Roles.ToList()
                         select new RoleProfile()
                         {
                             RoleId = data.Id,
                             RoleName = data.Name,
                             UserNames = data.Users.Select(u => um.FindById(u.UserId).UserName)
                         };

            return result.ToList();
        }
        #endregion

    }
}
