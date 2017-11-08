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

        
        /* Create Organization
         * Description: Creates an Organization
         * Author: Leban Mohamed
         * Author's Comments: I figured this object would be simple. Add the Organization and call it a day.
         * If there are any business rules, I will change the method accordingly.
         * Note: This code is incomplete; Wenyu, this is your time to shine.
         */
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void RegisterOrganization(Organization org)
        {
            using (var context = new MockErksDbContext())
            {
                context.Organizations.Add(org);
                context.SaveChanges();
            }

        }


        /*Look
         * Author: Leban Mohamed
         * 
         * 
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        
        public List<Site_File> LookupFilesByClient( int orgID)
        {
            using (var context = new MockErksDbContext())
            {
                

            }


               
        }

    */

        




    }
}
