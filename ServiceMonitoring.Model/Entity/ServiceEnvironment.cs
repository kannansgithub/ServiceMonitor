using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceEnvironment : BaseEntity
    {

        [Column(Order = 2)]

        public string Url { get; set; }
        [Column(Order = 3)]
        public string Address { get; set; }
        [Column(Order = 4)]
        public string ConnectionString { get; set; }
        [Column(Order = 5)]
        public string TypeName { get; set; }
        [Column(Order = 6)]
        public string WindowsServiceName { get; set; }
        [Column(Order = 7)]
        public int Interval { get; set; }
        [Column(Order = 8)]
        public string Description { get; set; }
        [Column(Order = 9)]
        public Guid ServiceId { get; set; }
        [Column(Order = 10)]
        public Guid EnvironmentId { get; set; }
        public Service Service { get; set; }
        public Environment Environment { get; set; }
        public ICollection<ServiceStatus> ServiceStatuses { get; set; }

        public ICollection<ServiceOwner> ServiceOwners { get; set; }





    }
}
