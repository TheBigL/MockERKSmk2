using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MockERKS.Framework.DAL.Security;
using MockERKS.Framework.BLL.Security;
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

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<string> ListAllRoleNames()
        {
            return this.Roles.Where(r => r.Name != SecurityRoles.Staff).Select(r => r.Name).ToList();
        }



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
        



        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void AddRole(RoleProfile role)
        {
            if (!this.RoleExists(role.RoleName))
            {
                this.Create(new IdentityRole(role.RoleName));
            }
            else
            {
                throw new Exception("Creation failed. " + role.RoleName + " already exists.");
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void DeleteRole(RoleProfile role)
        {
            var existing = this.FindById(role.RoleId);
            if (existing.Users.Count() == 0)
            {
                this.Delete(this.FindById(role.RoleId));
            }
            else
            {
                throw new Exception("Delete failed. " + role.RoleName + " has existing users. Reassign users first.");
            }


        }
        #endregion

    }
}
