using ServiceMonitoring.Worker.Contracts;
using ServiceMonitoring.Worker.Extensions;
using ServiceMonitoring.Worker.Helpers;
using ServiceMonitoring.Worker.Models;
using System.Net.Http;
using System.Threading.Tasks;

namespace ServiceMonitoring.Worker
{
    public class ServiceMonitorClient : IServiceMonitorClient
    {
        private readonly HttpClient _client;
        private readonly ApiUrlBinder _url;

        public ServiceMonitorClient(string baseUrl)
        {
            _client = new HttpClient();
            _url = new ApiUrlBinder(baseUrl: baseUrl);
        }

        public async Task<ServiceWatchResponse> GetWatcherItemsAsync()
        {
            var url = _url
                .Controller("Administration")
                .Action("GetWatcherItem")
                .ToString();

            var response = await _client.GetAsync(url);
            var content = await response.Content.ReadAsStringAsync();
            return SerializationHelper.Deserialize<ServiceWatchResponse>(content);
        }

        public async Task<HttpResponseMessage> PostServiceStatusLog(ServiceStatusLogRequest request)
        {
            var url = _url
                .Controller("Administration")
                .Action("CreateStatusLog")
                .ToString();

            return await _client.PostAsync(url, ContentHelper.GetStringContent(request));
        }
    }
}
