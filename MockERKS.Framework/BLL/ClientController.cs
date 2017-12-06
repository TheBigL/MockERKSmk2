using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities;
using MockERKS.Framework.Entities.POCOs;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class ClientController
    {



        /* List Client Description
         * Description: Creates a list of Client Descriptions for a dropdown list.
         * Author: Leban Mohamed
         * Author's Comments: I figured this object would be simple. Add a list with an ID and a descripton and call it a day.
         */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Organization_Description> ListClientDescription()
        {
            using (var context = new MockERKSDb())
            {
                var odescriptions = from org in context.Organization_Description
                                    orderby org.Description
                                    select new Organization_Description
                                    {
                                        Description_ID = org.Description_ID,
                                        Description = org.Description
                                    };

                return odescriptions.ToList();
            }

        }




        //Author :Sayed
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Organization_Description> DescriptionList()
        {
            using (var context = new MockERKSDb())
            {

                return context.Organization_Description.ToList();
            }

        }





        //Author :Sayed
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void RegisterOrganization(string organizationName, int description, string phone, string email, string userName)
        {
            using (var context = new MockERKSDb())
            {
                Organization newOrg = new Organization();
                newOrg.Organization_Name = organizationName;
                newOrg.Description_ID = description;
                newOrg.Email = email;
                newOrg.Phone = phone;
                newOrg.User_Name = userName;

                context.Organizations.Add(newOrg);

                context.SaveChanges();
            }
        }


        /*Look
         * Author: Leban Mohamed
         * 
         * 
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        
        public List<Site_File> LookupFilesByIndividualClient( int orgID)
        {
            using (var context = new MockErksDbContext())
            {
                

            }


               
        }

    */

        /*
         * 
         * 
         * 
         * */

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void addOrganizationInfoFromForm()
        {
            using (var context = new MockERKSDb())
            {
                //Add items to the list. Or a possible LINQ Query.
            }
        }




        /*  Author: Wenyu */
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<CreatedFile> ListFilebyClient (/*String currOrganization_Name*/)
        {
            using (var context = new MockERKSDb())
            {
                var files = from file in context.Site_File
                            //where file.Organization.Organization_Name.Trim().Equals(currOrganization_Name.Trim(), StringComparison.InvariantCultureIgnoreCase)
                            select new CreatedFile
                            {
                                fileID = file.File_ID,
                                organizationName = file.Organization.Organization_Name,
                                categoryName = file.Category.Category_Name,
                                operationName = file.Operation.Operation_Name
                            };

                return files.ToList();
            }
        }

        /*  Author: Wenyu */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<FileReport> GetFileReport()
        {
            using (MockERKSDb context = new MockERKSDb())
            {
                var results = from f in context.Site_File
                              select new FileReport
                              {
                                  fileID = f.File_ID,
                                  typeDescription = f.File_Type.Type_Description,
                                  categoryName = f.Category.Category_Name,
                                  operationName = f.Operation.Operation_Name,
                                  operationID = f.Operation.Operation_ID,
                                  location = f.Organization.Site_Address.Location,
                                  address = f.Organization.Site_Address.Address,
                                  merdianNumber = f.Organization.Site_Address.LLD_ATS.Meridian_Number,
                                  rangeNumber = f.Organization.Site_Address.LLD_ATS.Range_Number,
                                  townshipNumber = f.Organization.Site_Address.LLD_ATS.Township_Number,
                                  sectionNumber = f.Organization.Site_Address.LLD_ATS.Section_Number,
                                  quarterSectionNumber = f.Organization.Site_Address.LLD_ATS.Quarter_Section_Number,
                                  lsd = f.Organization.Site_Address.LLD_ATS.LSD,
                                  planNumber = f.LLD_PBL.Plan_Number,
                                  blockNumber = f.LLD_PBL.Block_Number,
                                  lotNumber = f.LLD_PBL.Lot_Number,
                                  linc = f.SPIN_II.LINC_Number,
                                  fileStatus = f.File_Status
                              };
                return results.ToList();
            }
        }

    }
}