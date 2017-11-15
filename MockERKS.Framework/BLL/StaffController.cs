using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Extra Namespaces
using System.ComponentModel;
using MockERKS.Framework.Entities;
using MockERKS.Framework.DAL;
#endregion

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class StaffController
    {
        
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
                              where org.Organization_Name.Contains(name)
                              select org;

                return results.ToList();
            }

        }

        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Officer> LookupStaffMembers()
        {
            using (var context = new MockERKSDb())
            {
                var staffList = from staff in context.Officers
                                select staff;

                return staffList.ToList();
            }

            
        }



        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Manager> LookupAdmins()
        {
            using (var context = new MockERKSDb())
            {
                var result = from admin in context.Managers
                             select new Manager
                             {
                                 First_Name = admin.First_Name,
                                 Last_Name = admin.Last_Name,
                                 Email = admin.Email,
                                 Phone = admin.Phone
                             };
                return result.ToList();
            }
        }

        /*
         * Lookup Staff
         * Simple Lookup on all Staff Members.
         * Author: Leban Mohamed
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Officer> LookupStaff()
        {
            using (var context = new MockERKSDb())
            {
                var results = from staffC in context.Officers
                              select staffC;


                return results.ToList();
            };

            

        }

        


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
                              select new Site_File
                              {
                                  Organization_ID = orgID,
                                  File_ID = file.File_ID,
                                  Category_ID = file.Category.Category_ID,
                                  Document_Type_ID = file.Document_Type_ID,
                                  File_Status = file.File_Status,
                                  Type_ID = file.Type_ID,
                                  Operation_ID = file.Operation_ID,
                                  LLD_PBL = file.LLD_PBL,
                                  LINC_Number = file.LINC_Number,
                                  Security_Classification_ID = file.Security_Classification_ID,
                              };
                return results.ToList();
            }


        }

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

        /*
         * Insert Staff
         * Author: Leban Mohamed
         * 
         * */
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void Insert_Staff(string firstName, string lastName, int phone, string email )
        {
            List<string> exceptionReasons = new List<string>();

            Officer newStaff = new Officer()
            {
                First_Name = firstName,
                Last_Name = lastName,
                Phone = phone,
                Email = email,

            };
            
            using (var context = new MockERKSDb())
            {

                context.Officers.Add(newStaff);
            }


            
        }
        /*Delete_Staff Method
         * 
         * Description: Removes the Record Detail Connections associated with the Staff Member and remove the Staff Member.
         * Author: Leban Mohamed
         * 
         */
        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete_Staff(int staffID, List<Record_Details> rdetails)
        {
            using (var context = new MockERKSDb())
            {
                //Find the StaffID
                Officer RemoveStaff = context.Officers.Find(staffID);
                List<Record_Details> toRemove = new List<Record_Details>();

                foreach(var item in RemoveStaff.Record_Details)
                {
                    bool rdetailsMatch = rdetails.Any(x => x.Officer_ID == RemoveStaff.Officer_ID);
                    if(rdetailsMatch)
                    {
                        toRemove.Add(item);
                    }

                }

                foreach(var item in toRemove)
                {
                    toRemove.Remove(item);
                }
                context.Officers.Remove(RemoveStaff);
                context.SaveChanges();

                

            }
            
        }

    }
}
