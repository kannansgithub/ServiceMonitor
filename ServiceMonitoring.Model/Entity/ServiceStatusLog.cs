using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceStatusLog : BaseEntity
    {
        [Column(Order = 2)]
        public string Target { get; set; }
        [Column(Order = 3)]

        public string ActionName { get; set; }
        [Column(Order = 4)]

        public bool SuccessfulStatus { get; set; }
        [Column(Order = 5)]

        public string Message { get; set; }
        [Column(Order = 6)]

        public string Description { get; set; }
        [Column(Order = 7)]
        public Guid ServiceStatusId { get; set; }
        public ServiceStatus ServiceStatus { get; set; }
    }
}
