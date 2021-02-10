using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceOwner
    {
        [Column(Order = 1)]
        public Guid RoleId { get; set; }
        [Column(Order = 2)]
        public Guid ServiceEnvironmentId { get; set; }
        public Role Role { get; set; }
        public ServiceEnvironment ServiceEnvironment { get; set; }


    }
}
