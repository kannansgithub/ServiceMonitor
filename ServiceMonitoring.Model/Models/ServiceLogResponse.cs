using System;

namespace ServiceMonitoring.Model.Models
{
    public class ServiceLogResponse
    {
        public Guid ServiceId { get; set; }
        public string ServiceName { get; set; }
        public string Category { get; set; }
        public bool Status { get; set; }
        public string Message { get; set; }
        public string Description { get; set; }
        public string Environment { get; set; }
        public DateTime LoggedDate { get; set; }
    }
}
