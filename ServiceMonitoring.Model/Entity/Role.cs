using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class Role : BaseEntity
    {
        [Column(Order = 2)]
        public string Name { get; set; }
        public ICollection<UserInRole> UserInRole { get; set; }

    }
}
