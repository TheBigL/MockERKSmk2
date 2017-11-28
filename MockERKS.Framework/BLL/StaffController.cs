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

        #region RegisteredOfficerDropdown
        /*
         * Officer Dropdown
         * Author: Leban Mohamed
         * Description: Spits out a list of users registered to the system. This method is designed for dropdowns.
         * Author's Comments: As a practical rule, we may need to have user names restricted to the staff member's first and last names.
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<OfficerFullNameList> RegisteredStaffDropdown()
        {
            using (var context = new MockERKSDb())
            {
                var round1 = from ro in context.Officers
                             orderby ro.Last_Name
                             select new OfficerFullNameList
                             {
                                 officerID = ro.Officer_ID,
                                 fullName = ro.Last_Name  + ", " + ro.First_Name
                             };
                return round1.ToList();
            }

        }



        #endregion



        #region FileTypeDropdown
        /*
         * File Type Dropdown
         * Author: Leban Mohamed
         * BLL method meant to bring down the options for the file types.
         * 
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<FileTypeList> FileTypeDropdown()
        {
            using (var context = new MockERKSDb())
            {
                var fileTypeCollection = from ft in context.File_Type
                                         select new FileTypeList
                                         {
                                             typeID = ft.Type_ID,
                                             typeDescription = ft.Type_Description
                                         };
                return fileTypeCollection.ToList();

            }

        }


        #endregion

        #region CategoryDropdown
        /*Dropdown Category
         * Author: Leban Mohamed
         * Brings up a list of Categories for a dropdown List
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<CategoryList> DropdownCategories()
        {
            using (var context = new MockERKSDb())
            {
                var categories = from c in context.Categories
                                 select new CategoryList
                                 {
                                     categoryID = c.Category_ID,
                                     categoryName = c.Category_Name
                                 };

                return categories.ToList();
            }
        }


        #endregion

        #region OrganizationDescriptionDropdown
        /*
         * OrganizationDescriptionDropdown
         * 
         * Author: Leban Mohamed
         * Returns a List of Organization Descriptions. This class is meant to be used for the Organization Description Dropdown
         * 
         * 
         *   **
        * */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Organization_Description> OrganizationDescriptionDropdown()
        {
            using(var context = new MockERKSDb())
            {
                var odList = from od in context.Organization_Description
                             select new Organization_Description
                             {Description_ID = od.Description_ID,
                             Description = od.Description
                             };
                return odList.ToList();

            }

        }

        #endregion


        #region OrganizationDropdown
        /*
         * Organization Dropdown
         * Author: Leban Mohamed 
         * Used for an Organization Dropdown.
         * 
         * 
         */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<OrganizationList> organizationDropdown()
        {
            using (var context = new MockERKSDb())
            {
                var orgList = from org in context.Organizations
                              select new OrganizationList
                              {
                                  organizationID = org.Organization_ID,
                                  organizationName = org.Organization_Name
                              };
               return orgList.ToList();

            }

        }

        #endregion

        #region LookupFilesByCategory
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<FileSummary> LookupFilesOrderByCategory(int catID)
        {
            using (var context = new MockERKSDb())
            {
                var results = from f in context.Site_File
                              where f.Category_ID == catID
                              select new FileSummary
                              {
                                  fileID = f.File_ID,
                                  categoryName = f.Category.Category_Name,
                                  docTypeDescription = f.Document.Document_Type.Type_Description,
                                  operationName = f.Operation.Operation_Name,
                                  organizationName = f.Organization.Organization_Name,
                                  securityClassificationTypeName = f.Security_Classification.Security_Classification_Name
                              };
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


        #region CategoryDropdown
        [DataObjectMethod(DataObjectMethodType.Select)]
        List<CategoryList> CategoryDropdown()
        {
            using (var context = new MockERKSDb())
            {
                var categories = from c in context.Categories
                                 select new CategoryList
                                 {
                                     categoryID = c.Category_ID,
                                     categoryName = c.Category_Name
                                 };
                return categories.ToList();
            }
        }

        #endregion

        #region SecurityClassifcationDropdownList
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<SecurityClassificationSummary> CategoryDropDown()
        {
            using (var context = new MockERKSDb())
            {
                var results = from scs in context.Security_Classification
                              select new SecurityClassificationSummary
                              {
                                  securityClassificationID = scs.Security_Classification_ID,
                                  securityClassificationName = scs.Security_Classification_Name

                              };
                return results.ToList();
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
        public List<OfficerListPOCO> LookupOfficers()
        {
            using (var context = new MockERKSDb())
            {
                var results = from officerList in context.Officers
                              select new OfficerListPOCO
                              {
                                  Officer_ID = officerList.Officer_ID,
                                  First_Name = officerList.First_Name,
                                  Last_Name = officerList.Last_Name
                              };

                return results.ToList();
            }

        }
        #endregion

        #region LookupFiles
        /*
         * Author: Leban Mohamed
         * Makes a List of Files using a POCO class
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<FileSummary> LookupFiles()
        {
            using (var context = new MockERKSDb())
            {
                var files = from f in context.Site_File
                            select new FileSummary
                            {
                                fileID = f.File_ID,
                                categoryName = f.Category.Category_Name,
                                docTypeDescription = f.Document.Document_Type.Type_Description,
                                operationName = f.Operation.Operation_Name,
                                securityClassificationTypeName = f.Security_Classification.Security_Classification_Name,
                                organizationName = f.Organization.Organization_Name

                            };

                            return files.ToList();

            }
        }
       
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

        /* Look Up All Organizations
        * Description: List all of the Organizations in the Database.
        * Author: Leban Mohamed
        * Author's Comments: Access the Database and put all the Organizations to the List. Easy as Apple Pie!
        */
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
                               Organization_Description = orglist.Organization_Description.Description,
                               Email = orglist.Email,
                               Phone = orglist.Phone
                           };
                return list.ToList();
            }
        }



        #endregion



        #region GenerateRecordDetailsByOfficerID
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<RecordDetailsSummary> RDSummaryByOfficerID(int officerID)
        {
            using (var context = new MockERKSDb())
            {
                var rdList = from rd in context.Record_Details
                             where rd.Officer_ID == officerID
                             select new RecordDetailsSummary
                             {
                                 officerID = rd.Officer_ID,
                                 essential = rd.Essential,
                                 status = rd.Status,
                                 statusDate = rd.Status_Date,
                                 dateRecieved = rd.Recieved_Date,
                                 subject = rd.Subject,
                                 recordDate = rd.Record_Date,
                                 updateCyclePeroid = rd.Update_Cycle_Period,
                                 offical = rd.Offcial
                                 

                             };
                return rdList.ToList();
            }

        }



        #endregion

       






    }



}
