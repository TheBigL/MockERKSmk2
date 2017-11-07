using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Microsoft.AspNet.Identity.EntityFramework;
using MockERKS.Framework.Entities.Security;
#endregion

namespace MockERKS.Framework.DAL.Security
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext() : base("name=MockERKSDb")
        { }
    }
}
