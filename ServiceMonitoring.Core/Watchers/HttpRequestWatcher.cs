using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace ServiceMonitoring.Core.Watchers
{
    public class HttpRequestWatcher : IWatcher
    {
        public string ActionName => "HttpRequest";
        public async Task<WatchResponse> WatchAsync(WatcherParameter parameter)
        {
            var response = new WatchResponse();
            try
            {
                response.NotificationEmailIds = parameter.Values["NotificationMailIds"];
                response.NotificationRequired = Convert.ToBoolean(parameter.Values["FailedNotificationRequired"]);
                using var httpClient = new HttpClient();
                await httpClient.GetAsync(parameter.Values["Url"]);
                response.SuccessfulStatus = true;
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.Description = ex.ToString();
            }
            return response;
        }
    }
}
