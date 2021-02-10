using ServiceMonitoring.Worker.Models;
using System.Net.Http;
using System.Threading.Tasks;

namespace ServiceMonitoring.Worker.Contracts
{
    public interface IServiceMonitorClient
    {
        Task<ServiceWatchResponse> GetServiceWatcherItemsAsync();

        Task<HttpResponseMessage> PostServiceStatusLog(ServiceStatusLogRequest request);
    }
}
