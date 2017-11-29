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
        /* Founction: Catch the list of File Type to show in the dropdown list */
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
                return status.ToList();
            }
        }
    }
}
