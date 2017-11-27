using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using MockERKS.Framework.DAL;
using MockERKS.Framework.DAL.Security;
using MockERKS.Framework.Entities.Security;
using MockERKS.Framework.Entities.POCOs;
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
        //Author:Sayed
        public void AddWebMaster()
        {
            //Users accesses all the records on the AspNetUsers table
            
            if (!Users.Any(u => u.UserName.Equals(STR_WEBMASTER_USERNAME)))
            {
                //create a new instance that will be used as the data to
                //   add a new record to the AspNetUsers table
                
                var webmasterAccount = new ApplicationUser()
                {
                    UserName = STR_WEBMASTER_USERNAME,
                    Email = string.Format(STR_EMAIL_FORMAT, STR_WEBMASTER_USERNAME)
                };

                this.Create(webmasterAccount, STR_DEFAULT_PASSWORD);

                this.AddToRole(webmasterAccount.Id, SecurityRoles.WebAdmins);
            }

     
        }

        //Author:Sayed

        public void AddStaff()
        {
            using (var context = new MockERKSDb())
            {
                
                var currentStaff = from x in context.Officers
                                       select new OfficerListPOCO
                                       {
                                           Officer_ID = x.Officer_ID,
                                           First_Name = x.First_Name,
                                           Last_Name = x.Last_Name
                                       };

              
                var UserOfficer = from x in Users.ToList()
                                    where x.Officer_ID.HasValue
                                    select new RegisteredOfficerPOCO
                                    {
                                        UserName = x.UserName,
                                        Officer_ID = int.Parse(x.Officer_ID.ToString())
                                    };
             
                foreach (var officer in currentStaff)
                {
                    //does the employee NOT have a logon (no User record)
                    if (!UserOfficer.Any(us => us.Officer_ID == officer.Officer_ID))
                    {
                        
                        var newUserName = officer.First_Name.Substring(0, 1) + officer.Last_Name;

                        //create a new User ApplicationUser instance
                        var userAccount = new ApplicationUser()
                        {
                            UserName = newUserName,
                            Email = string.Format(STR_EMAIL_FORMAT, newUserName),
                            EmailConfirmed = true
                        };
                        userAccount.Officer_ID = officer.Officer_ID;
                        //create the Users record
                        IdentityResult result = this.Create(userAccount, STR_DEFAULT_PASSWORD);

                        //result hold the return value of the creation attempt
                        
                        if (!result.Succeeded)
                        {
                           
                            newUserName = VerifyNewUserName(newUserName);
                            userAccount.UserName = newUserName;
                            this.Create(userAccount, STR_DEFAULT_PASSWORD);
                        }

                        //create the staff role in UserRoles
                        this.AddToRole(userAccount.Id, SecurityRoles.Staff);
                    }
                }
            }
        }

        public string VerifyNewUserName(string suggestedUserName)
        {
            
            var allUserNames = from x in Users.ToList()
                               where x.UserName.StartsWith(suggestedUserName)
                               orderby x.UserName
                               select x.UserName;
            //set up the verified unique UserName
            var verifiedUserName = suggestedUserName;

            for (int i = 1; allUserNames.Any(x => x.Equals(verifiedUserName,
                         StringComparison.OrdinalIgnoreCase)); i++)
            {
                verifiedUserName = suggestedUserName + i.ToString();
            }

            //return teh finalized new verified user name
            return verifiedUserName;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<UserProfile> ListAllUsers()
        {
            var rm = new RoleManager();
            var result = from person in Users.ToList()
                         select new UserProfile()
                         {
                             UserId = person.Id,
                             UserName = person.UserName,
                             Email = person.Email,
                             EmailConfirmed = person.EmailConfirmed,
                             Officer_ID = person.Officer_ID,
                             Organization_ID = person.Organization_ID,
                             RoleMemberships = person.Roles.Select(r => rm.FindById(r.RoleId).Name)
                         };

            using (var context = new MockERKSDb())
            {
                foreach (var person in result)
                {
                    if (person.Organization_ID.HasValue)
                    {
                        
                        person.First_Name = context.Managers.Find(person.Officer_ID).First_Name;
                        person.Last_Name = context.Managers.Find(person.Officer_ID).Last_Name;
                    }

                    else if (person.Officer_ID.HasValue)
                    {
                        person.First_Name = context.Officers.Find(person.Officer_ID).First_Name;
                        person.Last_Name = context.Officers.Find(person.Officer_ID).Last_Name;
                    }

                }
            }

            return result.ToList();
        }

        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddUser(UserProfile organizationInfo)
        {
            if (string.IsNullOrEmpty(organizationInfo.Officer_ID.ToString()))
            {
                throw new Exception("Staff ID is missing. Remember Staff must be on file to get an user account.");

            }
            else
            {
                AdminController sysmgr = new AdminController();
                Officer existing = sysmgr.Officer_Get(int.Parse(organizationInfo.Officer_ID.ToString()));
                if (existing == null)
                {
                    throw new Exception("Staff must be on file to get an user account.");
                }
                else
                {
                    var userAccount = new ApplicationUser()
                    {
                        Officer_ID = organizationInfo.Officer_ID,
                        Organization_ID = organizationInfo.Organization_ID,
                        UserName = organizationInfo.UserName,
                        Email = organizationInfo.Email
                    };
                    IdentityResult result = this.Create(userAccount,
                        string.IsNullOrEmpty(organizationInfo.RequestedPassord) ? STR_DEFAULT_PASSWORD
                        : organizationInfo.RequestedPassord);
                    if (!result.Succeeded)
                    {
                        //name was already in use
                        //get a UserName that is not already on the Users Table
                        //the method will suggest an alternate UserName
                        userAccount.UserName = VerifyNewUserName(organizationInfo.UserName);
                        this.Create(userAccount, STR_DEFAULT_PASSWORD);
                    }
                    foreach (var roleName in organizationInfo.RoleMemberships)
                    {
                        //this.AddToRole(userAccount.Id, roleName);
                        AddUserToRole(userAccount, roleName);
                    }
                }
            }

        }

        public void AddUserToRole(ApplicationUser userAccount, string roleName)
        {
            this.AddToRole(userAccount.Id, roleName);
        }

        public void RemoveUser(UserProfile organizationifo)
        {
            this.Delete(this.FindById(organizationifo.UserId));
        }

    }
}
