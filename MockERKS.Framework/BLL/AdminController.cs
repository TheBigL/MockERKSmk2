using System;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Extra Namespaces
using System.ComponentModel;
using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities;
#endregion

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class AdminController
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


        //TODO Create a Delete File Function For the Admin.
        #region DeleteFile
        /*Delete File
         * Deletes the foreign keys associated with the file, then it removes the file
         * based on the fileID
         * Author: Leban Mohamed
         * Comments:
         */

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void DeleteFile(int fileID, int categoryID, int operationID, int filetypeID, int organizationID, int securityID)
        {
            using (var context = new MockErksDbContext())
            {
                var file = context.Site_File.Find(fileID);
                if (file == null) throw new ArgumentException("This file doesn't exist");
                //TODO: Get rid any foreign keys associated with it.
                bool categoryMatch = context.Categories.Any(x => x.Category_ID == categoryID);
                if (categoryMatch == false) throw new ArgumentNullException("No Category exists.");

                bool organizationmatch = context.Organizations.Any(x => x.Organization_ID == organizationID);
                if (organizationmatch == false) throw new ArgumentNullException("No Organization like that exists.");

                bool filetypeMatch = context.File_Type.Any(x => x.Type_ID == filetypeID);
                if (filetypeMatch == false) throw new ArgumentNullException("No File Type exists for that file");

                bool securitymatch = context.Security_Classification.Any(x => x.Security_Classification_ID == securityID);
                if (securitymatch == false) throw new ArgumentNullException("No Security Classification exists");
                
                //TODO: Do the same process for the other foreign keys. 
                



                context.Site_File.Remove(file);
                context.SaveChanges();
            }

        }
        #endregion


    }
}
