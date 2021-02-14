using System.Collections.Generic;

namespace ServiceMonitoring.Model.Models
{
    public class DashboardInfo
    {
        public IList<ServiceInfo> DashValues { get; set; }
        public IList<MonitoredServiceInfo> DashMonitoredServiceValues { get; set; }
        public IList<ChartResponse> DashOverviewServiceValues { get; set; }

    }
}
