using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class User : BaseEntity
    {
        [Column(Order = 2)]

        public string UserName { get; set; }
        [Column(Order = 3)]

        public string Password { get; set; }

        public ICollection<UserInRole> UserInRole { get; set; }

    }
}
