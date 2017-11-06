using MockERKS.Framework.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.DAL
{
    internal partial class MockErksDbContext : DbContext
    {

        public MockErksDbContext() : base("name=MockERKSDb")
        {

        }

        //TODO: Add the Dbset here
        public virtual DbSet<Site_File> Site_Files { get; set; }
        public virtual DbSet<Site_Address> Site_Addresses { get; set; }
        public virtual DbSet<Record_Details> Record_Details { get; set; }
        public virtual DbSet<Organization> Organizations { get; set; }

        public virtual DbSet<Officer> Officer { get; set; }

        public virtual DbSet<Manager> Managers { get; set; }
    }
}
