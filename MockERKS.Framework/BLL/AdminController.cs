using System;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Extra Namespaces
using System.ComponentModel;
using MockERKS.Framework.DAL;
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

            /*Delete File
             * Deletes the foreign keys associated with the file, then it removes the file
             * based on the fileID
             * Author: Leban Mohamed
             * Comments:
             */

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void DeleteFile(int fileID)
        {
            using (var context = new MockErksDbContext())
            {
                var file = context.Site_File.Find(fileID);
                if (file == null) throw new ArgumentException("This file doesn't exist");
                //TODO: Get rid any foreign keys associated with it.


                context.Site_File.Remove(file);
                context.SaveChanges();
            }

        }


    }
}
