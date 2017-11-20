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
    public class SatffInforController
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
    }
}
