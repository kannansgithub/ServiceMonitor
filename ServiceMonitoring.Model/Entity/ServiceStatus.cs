using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceStatus : BaseEntity
    {
        [Column(Order = 2)]
        public bool SuccessStatus { get; set; }
        [Column(Order = 3)]
        public int NumberOfWatch { get; set; }
        [Column(Order = 4)]
        public DateTime LastWatch { get; set; }
        [Column(Order = 5)]
        public Guid ServiceEnvironmentId { get; set; }
        public ServiceEnvironment ServiceEnvironment { get; set; }
        public ICollection<ServiceStatusLog> ServiceStatusLogs { get; set; }

    }
}
