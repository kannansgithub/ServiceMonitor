using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System;
using System.Net.NetworkInformation;
using System.Threading.Tasks;

namespace ServiceMonitoring.Core.Watchers
{
    public class PingWatcher : IWatcher
    {
        public string ActionName
            => "Ping";

        public async Task<WatchResponse> WatchAsync(WatcherParameter parameter)
        {
            using var ping = new Ping();
            var reply = await ping.SendPingAsync(parameter.Values["Address"]);
            return new WatchResponse
            {
                SuccessfulStatus = reply.Status == IPStatus.Success,
                Message = reply.Status == IPStatus.Success ? "Successful ping" : "Failed ping",
                NotificationEmailIds = parameter.Values["NotificationMailIds"],
                NotificationRequired = Convert.ToBoolean(parameter.Values["FailedNotificationRequired"])
            };
        }
    }
}
