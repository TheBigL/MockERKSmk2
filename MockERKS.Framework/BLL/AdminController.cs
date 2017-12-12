using System;
using System.Collections.Generic;

using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Extra Namespaces
using System.ComponentModel;
using MockERKS.Framework.Entities;
using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities.POCOs;
using MockERKS.Framework.Entities.DTO;
#endregion

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class AdminController
    {
        //Author:Sayed
        //TODO Create a Delete File Function For the Admin.
        #region DeleteSITEFile


        [DataObjectMethod(DataObjectMethodType.Delete)]

        public void DeleteFile(int fileID)
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


                bool typeMatch = context.Document_Type.Any(x => x.Document_Type_ID == file.Document.Document_Type_ID);
                if (!typeMatch) throw new Exception("No Document Type Exists");
                else context.Document_Type.Remove(file.Document.Document_Type);


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

                
                context.Site_File.Remove(file);

                
                context.SaveChanges();
            }

        }

        

        #endregion

        
        #region UpdateFile

       
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void File_Update(Site_File file)
        {
            using (var context = new MockERKSDb())
            {
                context.Site_File.Attach(file);

                file.File_Status = string.IsNullOrEmpty(file.File_Status) ? null : file.File_Status;

                context.Entry(file).State = System.Data.Entity.EntityState.Modified;

                context.SaveChanges();
            }
        }


        #endregion

        #region LookupAllFiles
  
      [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Site_File> LookUpAllFiles()
        {
            using (var context = new MockERKSDb())
            {
                return context.Site_File.ToList();
            }
        }

        #endregion

        #region LookUpFilesTypeID



        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<FileTypePOCO> LookupFiletype(int typeId)
        {
            using (var context = new MockERKSDb())
            {
                var files = from x in context.Site_File
                            where x.File_Type.Type_ID == typeId
                            orderby x.Organization.Organization_Name ascending
                            select new FileTypePOCO
                            {
                                FileID = x.File_ID,
                                CategoryName = x.Category.Category_Name,
                                DocumentType = x.Document.Document_Type.Type_Description,
                                operationName = x.Operation.Operation_Name,
                                SecurityClassification = x.Security_Classification.Security_Classification_Name,
                                organizationName = x.Organization.Organization_Name,
                                OrganizationID = x.Organization.Organization_ID,
                                FileStatus = x.File_Status

                            };

                return files.ToList();

            }
        }




        #endregion


        #region Site_FIle Get By FILEID
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Site_File> Site_FileGetById(int fileId)
        {
            using (var context = new MockERKSDb())
            {
                var results = from x in context.Site_File
                              where x.File_ID==fileId
                              select x;
                return results.ToList();
            }
        }
        #endregion

        #region List OF file types
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<File_Type> File_TypeList()
        {
            using (var context = new MockERKSDb())
            {

                return context.File_Type.ToList();
            }

        }

        #endregion

        


        //TODO Create and Delete An Employee File Function For the Admin.
        #region getOfficerLsit


        [DataObjectMethod(DataObjectMethodType.Select, false)]

        public List<Officer> ListAll_Officer()
        {
            using (var context = new MockERKSDb())
            {
                return context.Officers.ToList();
            }
        }
        #endregion

        #region getOfficerByID
        public Officer Officer_Get(int officerid)
        {
            using (var context = new MockERKSDb())
            {
                return context.Officers.Find(officerid);
            }
        }
        #endregion

        #region AddOfficer
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Officer_Add(Officer item)
        {

            using (var context = new MockERKSDb())
            {
                //any business rules
                context.Officers.Add(item);
                context.SaveChanges();
            }
        }


        #endregion

        #region Remove Officer
        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void Officer_Delete(Officer item)
        {
            Officer_Delete(item.Officer_ID);
        }
        public void Officer_Delete(int Officerid)
        {
            using (var context = new MockERKSDb())
            {

                var existing = context.Officers.Find(Officerid);

                if (existing == null)
                {
                    throw new Exception("Officer does not exists on database.");
                }
                
                context.Officers.Remove(existing);
                
                context.SaveChanges();
            }
        }

        #endregion

        #region Update Officer
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Officer_Update(Officer item)
        {
            using (var context = new MockERKSDb())
            {

                context.Entry(item).State =
                    System.Data.Entity.EntityState.Modified;



                context.SaveChanges();
            }
        }
        #endregion




//TODO Create and Delete An Client File Function For the Admin.
        #region GetClientByID

        public Organization Client_Get(int organizationId)
        {
            using (var context = new MockERKSDb())
            {
                return context.Organizations.Find(organizationId);
            }
        }

        #endregion

        #region getallClients

        [DataObjectMethod(DataObjectMethodType.Select, false)]

        public List<Organization> ListAll_Organizations()
        {
            using (var context = new MockERKSDb())
            {
                return context.Organizations.ToList();
            }
        }
        #endregion

        #region AddClient

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Client_Add(Organization item)
        {

            using (var context = new MockERKSDb())
            {
                //any business rules
                context.Organizations.Add(item);
                context.SaveChanges();
            }
        }


        #endregion


        #region RemoveClient
    
        [DataObjectMethod(DataObjectMethodType.Delete, false)]

        public void Client_Delete(Organization item)
        {
            Client_Delete(item.Organization_ID);

        }

        public void Client_Delete(int organizationId)
        {
            using (var context = new MockERKSDb())
            {

               

                var existing = context.Organizations.Find(organizationId);

                if (existing == null)
                {
                    throw new Exception("Client/Organization does not exists on database.");
                }

                context.Organizations.Remove(existing);

                context.SaveChanges();
            }
        }


        #endregion

        #region updateClient
        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Client_Update(Organization item)
        {
            using (var context = new MockERKSDb())
            {
                
                context.Entry(item).State =
                    System.Data.Entity.EntityState.Modified;

                

                context.SaveChanges();
            }
        }

        #endregion

     

    }
}
