using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities;
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
        public List<Organization> ListClientDescription()
        {
            using (var context = new MockERKSDb())
            {
                var odescriptions = from org in context.Organizations
                                    orderby org.Organization_Description
                                    select new Organization()
                                    {
                                        Organization_ID = org.Organization_ID,
                                        Organization_Description = org.Organization_Description
                                    };

                return odescriptions.ToList();
            }

        }



        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void RegisterOrganization(string clientName, string Description, int Phone, string email)
        {
            using (var context = new MockERKSDb())
            {
                Organization newOrg = new Organization();
                newOrg.Organization_Name = clientName;
                newOrg.Organization_Description = Description;
                newOrg.Email = email;
                newOrg.Phone = Phone;

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


    }
}
