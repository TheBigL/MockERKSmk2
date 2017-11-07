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
        public void DeleteFile(int fileID, List<Record_Details> rdetails)
        {
            using (var context = new MockErksDbContext())
            {
                var file = context.Site_File.Find(fileID);
                if (file == null) throw new ArgumentException("This file doesn't exist");
                
                //Getting right of all foreign keys associated with the file.
                bool categoryMatch = context.Categories.Any(x => x.Category_ID == file.Category_ID);
                if (!categoryMatch) throw new Exception("No Category exists");
                else context.Categories.Remove(file.Category);


                bool typeMatch = context.Document_Type.Any(x => x.Document_Type_ID == file.Document_Type_ID);
                if (!typeMatch) throw new Exception("No Document Type Exists");
                else context.Document_Type.Remove(file.Document_Type);


                bool operMatch = context.Operations.Any(x => x.Operation_ID == file.Operation_ID);
                if (!operMatch) throw new Exception("No Operation is associated with that message.");
                else context.Operations.Remove(file.Operation);


                bool orgMatch = context.Organizations.Any(x => x.Organization_ID == file.Organization_ID);
                if (!orgMatch) throw new Exception("No Organization is associated with that file.");
                else context.Organizations.Remove(file.Organization);

                bool addressMatch = context.LLD_PBL.Any(x => x.PBL_ID == file.PBL_ID);
                if (!addressMatch) throw new Exception("No Address has been found....");
                else context.LLD_PBL.Remove(file.LLD_PBL);

                bool filetypeMatch = context.File_Type.Any(x => x.Type_ID == file.Type_ID);
                if (!filetypeMatch) throw new Exception("No File Type has been found");
                else context.File_Type.Remove(file.File_Type);

                context.Security_Classification.Remove(file.Security_Classification);

                List<Record_Details> remove = new List<Record_Details>();
                 

                foreach(var item in rdetails)
                {
                    bool rdMatch = context.Record_Details.Any(x => x.File_ID == fileID);
                    if(rdMatch)
                    {
                        remove.Add(item);
                    } 
                }

                foreach(var item in remove)
                {
                    context.Record_Details.Remove(item);
                }


                
                
                



                context.Site_File.Remove(file);
                context.SaveChanges();
            }

        }
        #endregion


    }
}
