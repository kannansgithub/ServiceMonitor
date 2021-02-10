using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System;
using System.ServiceProcess;
using System.Threading.Tasks;

namespace ServiceMonitoring.Core.Watchers
{
    public class WindowsServiceWatcher : IWatcher
    {
        public string ActionName => "WindowsService";

        public async Task<WatchResponse> WatchAsync(WatcherParameter parameter)
        {
            var response = new WatchResponse();
            try
            {
                response = await Task.Factory.StartNew(() => GetServiceStatus(parameter.Values["WindowsServiceName"]));
            }
            catch (Exception ex)
            {
                response.Message = "Error on Validating Service";
                response.Description = ex.Message;
            }
            return response;
        }

        private static WatchResponse GetServiceStatus(string serviceName)
        {
            var response = new WatchResponse();
            using var sc = new ServiceController(serviceName);
            response.SuccessfulStatus = sc.Status.Equals(ServiceControllerStatus.Running);
            response.Message = $"Current Status of the Service is {sc.Status}";
            return response;
        }
    }
}
