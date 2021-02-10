using System;

namespace ServiceMonitoring.Model.Models
{
    public class ServiceWatcherItemInfo
    {
        public Guid ServiceId { get; set; }
        public string Service { get; set; }
        public Guid ServiceEnvironmentId { get; set; }
        public string ServiceEnvironment { get; set; }
        public string Environment { get; set; }
        public string ServiceName { get; set; }
        public int Interval { get; set; }
        public string Url { get; set; }
        public string Address { get; set; }
        public string ConnectionString { get; set; }
        public string WindowsServiceName { get; set; }

        public string TypeName { get; set; }

    }
}
