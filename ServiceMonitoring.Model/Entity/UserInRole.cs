using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class UserInRole
    {
        [Column(Order = 1)]
        public Guid UserId { get; set; }
        [Column(Order = 2)]
        public Guid RoleId { get; set; }

        public User User { get; set; }
        public Role Role { get; set; }
    }
}
