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
        public void RegisterOrganization(string organizationName, int description, string phone, string email)
        {
            using (var context = new MockERKSDb())
            {
                Organization newOrg = new Organization();
                newOrg.Organization_Name = organizationName;
                newOrg.Description_ID = description;
                newOrg.Email = email;
                newOrg.Phone = phone;

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
