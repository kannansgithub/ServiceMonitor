using System;

namespace ServiceMonitoring.Worker.Models
{
    public class ServiceStatusLogRequest
    {
        public Guid ServiceId { get; set; }

        public Guid ServiceEnvironmentId { get; set; }

        public string Target { get; set; }

        public string ActionName { get; set; }

        public bool SuccessfulStatus { get; set; }

        public string Message { get; set; }

        public string Description { get; set; }
    }
}
