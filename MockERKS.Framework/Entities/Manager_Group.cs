using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockERKS.Framework.Entities
{
    [Table("Manager_Group")]
    public partial class Manager_Group
    {
        public int Manager_Group_ID { get; set; }

        public int Manager_ID { get; set; }

        [StringLength(25)]
        public string Manager_Group_Name { get; set; }

        public string Description { get; set; }

        public virtual ICollection<Manager_Group> ManagerGroup { get; set; }
    }
}
