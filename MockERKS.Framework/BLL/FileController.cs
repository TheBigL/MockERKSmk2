using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using MockERKS.Framework.DAL;
using MockERKS.Framework.Entities;
using System.ComponentModel;
using MockERKS.Framework.Entities.POCOs;
#endregion

namespace MockERKS.Framework.BLL
{
    [DataObject]
    public class FileController
    {
        /* Author: Wenyu Zhang */
        /* Function: Catch the list of File Type to show in the dropdown list */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public  List<FileTypeList> DropDownFileType()
        {
            using (var context = new MockERKSDb())
            {
                var fileTypes = from fileType in context.File_Type
                                select new FileTypeList
                                {
                                    typeID = fileType.Type_ID,
                                    typeDescription = fileType.Type_Description
                                };
                return fileTypes.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        /* Founction: Catch the list of Category to show in the dropdown list */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<CategoryList> DropDownCategory()
        {
            using (var context = new MockERKSDb())
            {
                var categories = from category in context.Categories
                               select new CategoryList
                               {
                                   categoryID = category.Category_ID,
                                   categoryName = category.Category_Name
                               };
                return categories.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        /* Founction: Catch the list of Security Classification to show in the dropdown list */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<SecurityClassificationList> DropDownSecurityClassification()
        {
            using (var context = new MockERKSDb())
            {
                var securityClassifications = from securityClassification in context.Security_Classification
                                              select new SecurityClassificationList
                                              {
                                                  securityClassificationID = securityClassification.Security_Classification_ID,
                                                  securityClassificationName = securityClassification.Security_Classification_Name
                                              };
                return securityClassifications.ToList();
            }
        }

        /* Author: Wenyu Zhang */
        /* Founction: Catch the list of Location to show in the dropdown list */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<LocationList> DropDownLocation()
        {
            using (var context = new MockERKSDb())
            {
                var locations = from location in context.Site_Address
                                              select new LocationList
                                              {
                                                  locationCode = location.Location_Code,
                                                  location = location.Location
                                              };
                return locations.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownMeridian()
        {
            using (var context = new MockERKSDb())
            {
                var merdians = from meridian in context.LLD_ATS
                               select new ATSList
                               {
                                   ATSID = meridian.ATS_ID,
                                   meridian = meridian.Meridian_Number
                               };
                return merdians.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownRange()
        {
            using (var context = new MockERKSDb())
            {
                var ranges = from range in context.LLD_ATS
                             select new ATSList
                             {
                                 ATSID = range.ATS_ID,
                                 range = range.Range_Number
                             };
                return ranges.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownTownship ()
        {
            using (var context = new MockERKSDb())
            {
                var townships = from township in context.LLD_ATS
                                select new ATSList
                                {
                                    ATSID = township.ATS_ID,
                                    township = township.Township_Number
                                };
                return townships.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownSection()
        {
            using (var context = new MockERKSDb())
            {
                var sections = from section in context.LLD_ATS
                                select new ATSList
                                {
                                    ATSID = section.ATS_ID,
                                    section = section.Section_Number
                                };
                return sections.ToList();
            }
        }



        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownQuarterSection()
        {
            using (var context = new MockERKSDb())
            {
                var quarterSections = from quarterSection in context.LLD_ATS
                               select new ATSList
                               {
                                   ATSID = quarterSection.ATS_ID,
                                   quarterSection = quarterSection.Quarter_Section_Number
                               };
                return quarterSections.ToList();
            }
        }


        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ATSList> DropDownLSD()
        {
            using (var context = new MockERKSDb())
            {
                var LSDS = from lsd in context.LLD_ATS
                                      select new ATSList
                                      {
                                          ATSID = lsd.ATS_ID,
                                          lsd = lsd.LSD
                                      };
                return LSDS.ToList();
            }
        }

        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<FileStatusList> DropDownStatus()
        {
            using (var context = new MockERKSDb())
            {
                var status = from fileStatus in context.Site_File
                             select new FileStatusList
                             {
                                 fileID = fileStatus.File_ID,
                                 fileStatus = fileStatus.File_Status
                             };
                foreach (FileStatusList li in status.Distinct().ToList())
                    System.Diagnostics.Debug.Write(li.fileStatus);
                return status.Distinct().ToList();
            }
        }

        /* Author: Wenyu Zhang */
        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void File_Add(Site_File item, int id)
        {
            using (var context = new MockERKSDb())
            {
                item.Organization_ID = id;
                context.Site_File.Add(item);
                context.SaveChanges();
            }
        }

        /* Author: Wenyu Zhang */
        public void file_update(int fileID, int organizationId)
        {
            using (var context = new MockERKSDb())
            {
                Site_File file = (from x in context.Site_File
                                  where x.File_ID == fileID
                                  select x).FirstOrDefault();
                file.Organization_ID = organizationId;
                context.Site_File.Attach(file);
                context.Entry(file).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        /* Author: Wenyu Zhang*/
        [DataObjectMethod(DataObjectMethodType.Select,false)]
        public int OrganizationId_get(string username)
        {
            using (var context = new MockERKSDb())
            {
                int id = (from x in context.Organizations
                          where x.User_Name == username
                          select x.Organization_ID).FirstOrDefault();
                return id;
            }
        }


        /* Author: Wenyu Zhang*/
        public Operation findOperation (string name)
        {
            using (var context
                 = new MockERKSDb())
            {
                Operation results = (from x in context.Operations
                                       where x.Operation_Name == name
                                       select x).FirstOrDefault();
                return results;
            }
            
        }

        /* Author: Wenyu Zhang*/
        public void createOperation (Operation oper)
        {
            using (var context = new MockERKSDb())
            {
                context.Operations.Add(oper);
                context.SaveChanges();
            }
        }

        /* Author: Wenyu Zhang*/
        public bool checkExist(string name)
        {
            using (var context
                 = new MockERKSDb())
            {
                Operation results = (from x in context.Operations
                                     where x.Operation_Name == name
                                     select x).FirstOrDefault();
                if (results != null)
                    return true;
                else
                    return false;
            }
        }

        /* Author: Wenyu Zhang*/
        public Organization getOrganzationById(int id)
        {
            using (var context = new MockERKSDb())
            {
                Organization results = (from x in context.Organizations
                                        where x.Organization_ID == id
                                        select x).FirstOrDefault();
                return results;
            }
        }

        /* Author: Wenyu Zhang*/
        public void createLocation(Site_Address address)
        {
            using (var context = new MockERKSDb())
            {
                context.Site_Address.Add(address);
                context.SaveChanges();
            }
        }

        /* Author: Wenyu Zhang*/
        public void createLLd_ATS(LLD_ATS ats)
        {
            using (var context = new MockERKSDb())
            {
                context.LLD_ATS.Add(ats);
                context.SaveChanges();
            }
        }

        /* Author: Wenyu Zhang*/
        public void createLLD_PBL(LLD_PBL pbl)
        {
            using (var context = new MockERKSDb())
            {
                context.LLD_PBL.Add(pbl);
                context.SaveChanges();
            }
        }
    }
}
