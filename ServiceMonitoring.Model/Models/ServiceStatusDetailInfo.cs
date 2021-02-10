using System;

namespace ServiceMonitoring.Model.Models
{
    public class ServiceStatusDetailInfo
    {
        public Guid ServiceEnvironmentStatusId { get; set; }
        public string ServiceEnvironmentStatus { get; set; }
        public Guid ServiceEnvironmentId { get; set; }
        public string ServiceEnvironment { get; set; }
        public Guid ServiceId { get; set; }
        public string Service { get; set; }
        public string ServiceName { get; set; }
        public string EnvironmentName { get; set; }
        public bool SuccessfulStatus { get; set; }
        public int WatchCount { get; set; }
        public DateTime LastWatch { get; set; }
    }
}
