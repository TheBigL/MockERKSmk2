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
        /*Yo! I've set up the project for guys. Remember to comment on your code whenever you create
        * the class. We want to make sure we can tell who's working on which part.
        * I don't want you guys to get confused. We can go to each other and consult about
        * how it all gets done, but try not to make me do this for you.
        * 
        * I'm currently going to move on with my part of the project. 
        * NOTE: Remember what Steve said about the workload. Don't force me to everything.
        * 
        * 
        * Sincerely,
        * --Leban Mohamed
        */

        /* Look Up All Organizations
* Description: List all of the Organizations in the Database.
* Author: Leban Mohamed
* Author's Comments: Access the Database and put all the Organizations to the List. Easy as Apple Pie!
*/

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Organization> LookupAllOrganizations()
        {
            using (var context = new MockErksDbContext())
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
            using (var context = new MockErksDbContext())
            {
                var results = from org in context.Organizations
                              where org.Organization_Name.Contains(name)
                              select org;

                return results.ToList();
            }

        }

        /*
         * LookupFilebyOrganization
         *Author: Leban Mohamed 
         * Note: I may change the Site File variables based on what is important to display.
         * 
         */
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public List<Site_File> LookupFileByOrganization(int orgID)
        {
            using (var context = new MockErksDbContext())
            {
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


    }
}
