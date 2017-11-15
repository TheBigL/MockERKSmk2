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
      


        //TODO Create a Delete File Function For the Admin.
        #region DeleteFile
       

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void DeleteFile(int fileID, List<Record_Details> rdetails)
        {
            using (var context = new MockERKSDb())
            {
                //TODO: Find the file
                var file = context.Site_File.Find(fileID);
                if (file == null) throw new ArgumentException("This file doesn't exist");
                
                //Getting rid of all the Foreign Key Associted with the class.
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

                //Get rid of the child class be creating a List of Record Details.
                List<Record_Details> remove = new List<Record_Details>();
                 
                //Adding the Record details to the new List.
                foreach(var item in rdetails)
                {
                    bool rdMatch = context.Record_Details.Any(x => x.File_ID == fileID);
                    if(rdMatch)
                    {
                        remove.Add(item);
                    } 
                }

                //Removing each Record Details from the list.
                foreach(var item in remove)
                {
                    context.Record_Details.Remove(item);
                }


                
                
                


                //Getting rid of the file class proper
                context.Site_File.Remove(file);

                //Saving all the changes making them permanent.
                context.SaveChanges();
            }

        }
        #endregion

        #region UpdateFile
   
        [DataObjectMethod(DataObjectMethodType.Update,true)]
        public void UpdateFile(Site_File file, List<Record_Details> rDetails)
        {
            using (var context = new MockERKSDb())
            {
                var sFile = context.Site_File.Find(file.File_ID);
                if (sFile == null) throw new ArgumentNullException("Invalid File - The file does not exist");

                foreach(var item in rDetails)
                {
                    //TODO: Update the relevant parts (Including the Foreign Keys) of the File class. 
                }

                context.Entry<Site_File>(context.Site_File.Attach(file)).State = System.Data.Entity.EntityState.Modified;

                context.SaveChanges();
            }

            

        }


        #endregion

        #region DeleteUser
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void DeleteUser()
        {

        }

        #endregion


    }
}
