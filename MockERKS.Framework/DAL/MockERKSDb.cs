namespace MockERKS.Framework.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MockERKSDb : DbContext
    {
        public MockERKSDb()
            : base("name=MockERKSDb")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Document_Type> Document_Type { get; set; }
        public virtual DbSet<File_Type> File_Type { get; set; }
        public virtual DbSet<LLD_ATS> LLD_ATS { get; set; }
        public virtual DbSet<LLD_PBL> LLD_PBL { get; set; }
        public virtual DbSet<Manager> Managers { get; set; }
        public virtual DbSet<Manager_Group> Manager_Group { get; set; }
        public virtual DbSet<Officer> Officers { get; set; }
        public virtual DbSet<Operation> Operations { get; set; }
        public virtual DbSet<Organization> Organizations { get; set; }
        public virtual DbSet<Record_Details> Record_Details { get; set; }
        public virtual DbSet<Security_Classification> Security_Classification { get; set; }
        public virtual DbSet<Site_Address> Site_Address { get; set; }
        public virtual DbSet<Site_File> Site_File { get; set; }
        public virtual DbSet<SPIN_II> SPIN_II { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .Property(e => e.Category_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Document_Type>()
                .Property(e => e.Document_Type_Description)
                .IsUnicode(false);

            modelBuilder.Entity<File_Type>()
                .Property(e => e.Type_Description)
                .IsUnicode(false);

            modelBuilder.Entity<Manager>()
                .Property(e => e.First_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Manager>()
                .Property(e => e.Last_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Manager>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Manager_Group>()
                .Property(e => e.Manager_Group_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Manager_Group>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Officer>()
                .Property(e => e.First_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Officer>()
                .Property(e => e.Last_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Officer>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Operation>()
                .Property(e => e.Operation_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Organization>()
                .Property(e => e.Organization_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Organization>()
                .Property(e => e.Organization_Description)
                .IsUnicode(false);

            modelBuilder.Entity<Organization>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.Offcial)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.Accession)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.Update_Cycle_Period)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.RM_Classification)
                .IsUnicode(false);

            modelBuilder.Entity<Record_Details>()
                .Property(e => e.RSI)
                .IsUnicode(false);

            modelBuilder.Entity<Security_Classification>()
                .Property(e => e.Security_Classification_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Security_Classification>()
                .Property(e => e.Security_Classification_Description)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.Location)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.Street)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.Province)
                .IsUnicode(false);

            modelBuilder.Entity<Site_Address>()
                .Property(e => e.Postal_Code)
                .IsUnicode(false);

            modelBuilder.Entity<Site_File>()
                .Property(e => e.File_Status)
                .IsUnicode(false);

            modelBuilder.Entity<SPIN_II>()
                .Property(e => e.Street_Range)
                .IsUnicode(false);

            modelBuilder.Entity<SPIN_II>()
                .Property(e => e.Avenue_Range)
                .IsUnicode(false);
        }
    }
}
