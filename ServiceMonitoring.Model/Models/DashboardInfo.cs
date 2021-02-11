using System.Collections.Generic;
using System.Linq;

namespace ServiceMonitoring.Model.Models
{
    public class DashboardInfo
    {
        public IQueryable<ServiceInfo> DashValues { get; set; }
        public IList<MonitoredServiceInfo> DashMonitoredServiceValues { get; set; }
        public IQueryable<ServiceOverViewInfo> DashOverviewServiceValues { get; set; }

    }
}
