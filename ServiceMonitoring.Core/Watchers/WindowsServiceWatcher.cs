using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System;
using System.Management;
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
                response = await Task.Factory.StartNew(() => GetServiceStatus(parameter));
            }
            catch (Exception ex)
            {
                response.Message = "Error on Validating Service";
                response.Description = ex.Message;
            }
            return response;
        }

        private static WatchResponse GetServiceStatus(WatcherParameter parameter)
        {
            var response = new WatchResponse();
            var connection = new ConnectionOptions
            {
                Username = Environment.GetEnvironmentVariable(parameter.Values["UsernameKey"]),
                Password = Environment.GetEnvironmentVariable(parameter.Values["PasswordKey"]),
                Authority = $"ntlmdomain:{parameter.Values["Authority"]}"
            };
            var scope = new ManagementScope($"\\\\{parameter.Values["ServerName"]}\\root\\CIMV2", connection);
            scope.Connect();
            if (!scope.IsConnected) return response;
            var query = new ObjectQuery($"SELECT Name,State,StartName FROM Win32_Service WHERE Name='{parameter.Values["WindowsServiceName"]}'");
            var searcher = new ManagementObjectSearcher(scope, query);
            var services = searcher.Get();
            foreach (var queryObj in services)
            {
                response.SuccessfulStatus =
                    Convert.ToString(queryObj["State"])?.ToUpperInvariant() == "RUNNING";
                response.Message = "No Issues on Service";
                response.AccessedUser = Convert.ToString(queryObj["StartName"]);
            }
            return response;
        }
    }
}
