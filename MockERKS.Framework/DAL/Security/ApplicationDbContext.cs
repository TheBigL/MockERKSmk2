using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.DAL.Security
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext() : base("name=MockERKSDb")
        { }
    }
}
