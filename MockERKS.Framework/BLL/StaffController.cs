using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Extra Namespaces
using System.ComponentModel;
using MockERKS.Framework.Entities;
using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities.POCOs;
#endregion

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class StaffController
    {
        #region Lookup Organizations
        /* Look Up All Organizations
        * Description: List all of the Organizations in the Database.
        * Author: Leban Mohamed
        * Author's Comments: Access the Database and put all the Organizations to the List. Easy as Apple Pie!
        */

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Organization> LookupAllOrganizations()
        {
            //Simple Lookup for All Organizations
            using (var context = new MockERKSDb())
            {
                return context.Organizations.ToList();
            }
        }
        #endregion


        #region LookupOrganizationByName
        /* Look Up Organizations By Name
        * Description: List all of the Organizations in the Database by name.
        * Author: Leban Mohamed
        * Author's Comments: Nothinng in particular.
        */

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Organization> LookupOrganizationByName(string name)
        {
            using (var context = new MockERKSDb())
            {
                var results = from org in context.Organizations
                              where org.Organization_Name == name
                              select org;

                return results.ToList();
            }

        }
        #endregion

        #region LookupFilesByCategory
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Site_File> LookupFilesOrderByCategory(string cDescription)
        {
            using (var context = new MockERKSDb())
            {
                var results = from fileList in context.Site_File
                              where fileList.Category.Description == cDescription
                              select fileList;

                return results.ToList();
            }
        }
        #endregion


        #region LookupAdmin
        /*Lookup Admins
         * Simple lookups of the Admins by Last Name
         * Author: Leban Mohamed
         * 
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Manager> LookupAdmins()
        {
            using (var context = new MockERKSDb())
            {
                var result = from admin in context.Managers
                             orderby admin.Last_Name
                             select admin;

                return result.ToList();
            }
        }
        #endregion


        #region LookupOfficers
        /*
         * Lookup Staff
         * Simple Lookup on all Staff Members.
         * Author: Leban Mohamed
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Officer> LookupOfficers()
        {
            using (var context = new MockERKSDb())
            {
                var results = from officerList in context.Officers
                              orderby officerList.Last_Name
                              select officerList;

                return results.ToList();
            }

        }
        #endregion

        #region LookupFiles
        /*
         * Author: Leban Mohamed
         * 
         * 
         * 
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Site_File> LookupFiles()
        {
            using (var context = new MockERKSDb())
            {
                

            }
        }
        */
        #endregion


        #region LookupFileByOrganization
        /*
         * LookupFilebyOrganization
         *Author: Leban Mohamed 
         * Note: I may change the Site File variables based on what is important to display.
         * Comments: Note that I focus on the foreign keys first BEFORE I go on to remove the files.
         */
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Site_File> LookupFileByOrganization(int orgID)
        {
            using (var context = new MockERKSDb())
            {
                //Simple LINQ Query for a list of file based on a matching Organization ID (or Client ID if they decide to change it).
                var results = from file in context.Site_File
                              where file.Organization.Organization_ID == orgID
                              select file;
                return results.ToList();
            }


        }
        #endregion


        #region GetOfficerByID
        /*
        * LookupOfficerByOfficerID
        *Author: Sayed
        * 
        */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Officer Officer_Get(int Officer_ID)
        {
            using (var context = new MockERKSDb())
            {
                return context.Officers.Find(Officer_ID);
            }
        }
        #endregion

        #region LookupRegisteredOrganizations
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<organizationRegistrationPOCO> LookupRegisteredOrganizations()
        {
            using (var context = new MockERKSDb())
            {
                var list = from orglist in context.Organizations
                           orderby orglist.Organization_Name
                           select new organizationRegistrationPOCO
                           {
                               Organization_ID = orglist.Organization_ID,
                               Organization_Name = orglist.Organization_Name,
                               Organization_Description = orglist.Organization_Description,
                               Email = orglist.Email,
                               Phone = orglist.Phone
                           };
                return list.ToList();
            }
        }



        #endregion

        #region LookupRegisteredOfficers
        [DataObjectMethod(DataObjectMethodType.Select)]
        List<RegisteredOfficerPOCO> LookupRegisteredOfficers()
        {
            using (var context = new MockERKSDb())
            {
                var officerList = from o in context.Officers
                                  orderby o.Last_Name
                                  select new RegisteredOfficerPOCO
                                  {
                                      Officer_ID = o.Officer_ID,
                                      UserName = o.First_Name
                                  };

                return officerList.ToList();
            }
        }

        #endregion







    }



}
