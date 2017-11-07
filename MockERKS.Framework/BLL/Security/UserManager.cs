using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MockERKS.Framework.DAL;
using MockERKS.Framework.DAL.Security;
using MockERKS.Framework.Entities.Security;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MockERKS.Framework.Entities;

namespace MockERKS.Framework.BLL.Security
{
    [DataObject]
    public class UserManager : UserManager<ApplicationUser>
    {

     

        #region Constants
        private const string STR_DEFAULT_PASSWORD = "Pa$$word1";
        /// <summary>Requires FirstName and LastName</summary>
        private const string STR_USERNAME_FORMAT = "{0}.{1}";
        /// <summary>Requires UserName</summary>
        private const string STR_EMAIL_FORMAT = "{0}@Mockerks.ca";
        private const string STR_WEBMASTER_USERNAME = "Webmaster";
        #endregion
        public UserManager()
         : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }

        public void AddWebMaster()
        {
            //Users accesses all the records on the AspNetUsers table
            //UserName is the user logon user id (dwelch)
            if (!Users.Any(u => u.UserName.Equals(STR_WEBMASTER_USERNAME)))
            {
                //create a new instance that will be used as the data to
                //   add a new record to the AspNetUsers table
                //dynamically fill two attributes of the instance
                var webmasterAccount = new ApplicationUser()
                {
                    UserName = STR_WEBMASTER_USERNAME,
                    Email = string.Format(STR_EMAIL_FORMAT, STR_WEBMASTER_USERNAME)
                };

                //place the webmaster account on the AspNetUsers table
                this.Create(webmasterAccount, STR_DEFAULT_PASSWORD);

                //place an account role record on the AspNetUserRoles table
                //.Id comes from the webmasterAccount and is the pkey of the Users table
                //role will comes from the Entities.Security.SecurityRoles
                this.AddToRole(webmasterAccount.Id, SecurityRoles.WebAdmins);
            }
        }


        #region User CRUD









        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<UserProfile> ListAllStaff()
        {
            var rm = new RoleManager();
            var result = from person in Users.ToList()
                         select new UserProfile()
                         {
                             UserId = person.Id,
                             UserName = person.UserName,
                             Email = person.Email,
                             EmailConfirmed = person.EmailConfirmed,
                             StaffId = person.StaffId,
                             AdminId = person.AdminId,
                             RoleMemberships = person.Roles.Select(r => rm.FindById(r.RoleId).Name)
                         };

            using (var context = new MockErksDbContext())
            {
                foreach (var person in result)
                {
                    if (person.AdminId.HasValue)
                    {
                        //TODO: Finish the MockERKSDatabaseContext class before I can finish this method. 
                        person.FirstName = context.Managers.Find(person.StaffId).First_Name;
                        person.LastName = context.Managers.Find(person.StaffId).Last_Name;
                    }

                    else if (person.StaffId.HasValue)
                    {
                        person.FirstName = context.Officers.Find(person.StaffId).First_Name;
                        person.LastName = context.Officers.Find(person.StaffId).Last_Name;
                    }

                }
            }



            //TODO: Finish the MockERKSDatabaseContext class before I can finish this method. 


            return result.ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddUser(UserProfile userInfo)
        {
            var userAccount = new ApplicationUser()
            {
                UserName = userInfo.UserName,
                Email = userInfo.Email

            };

            this.Create(userAccount, STR_DEFAULT_PASSWORD);
            foreach (var roleName in userInfo.RoleMemberships)
                this.AddToRole(userAccount.Id, roleName);

        }







        #endregion



    }
}
