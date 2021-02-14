using Microsoft.Extensions.Logging;
using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Worker.Contracts;
using ServiceMonitoring.Worker.Models;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace ServiceMonitoring.Worker
{
    public class MonitorService
    {
        public MonitorService(ILogger logger, IWatcher watcher, IServiceMonitorClient client)
        {
            Logger = logger;
            Watcher = watcher;
            Client = client;
        }

        public ILogger Logger { get; }

        public IWatcher Watcher { get; }

        public IServiceMonitorClient Client { get; }

        public async Task ProcessAsync(ServiceWatchItem item, int delayTime)
        {
            while (true)
            {
                try
                {
                    Logger?.LogTrace("{0} - Watching '{1}' for '{2}' environment", DateTime.Now, item.ServiceName,
                        item.Environment);

                    var watchResponse = await Watcher.WatchAsync(new WatcherParameter(item.ToDictionary()));

                    if (watchResponse.SuccessfulStatus)
                        Logger?.LogInformation(" Success watch for '{0}' in '{1}' environment", item.ServiceName,
                            item.Environment);
                    else
                        Logger?.LogError(" Failed watch for '{0}' in '{1}' environment", item.ServiceName,
                            item.Environment);

                    var serviceStatusLog = new ServiceStatusLogRequest
                    {
                        ServiceId = item.ServiceId,
                        ServiceEnvironmentId = item.ServiceEnvironmentId,
                        Target = item.ServiceName,
                        ActionName = Watcher.ActionName,
                        SuccessfulStatus = watchResponse.SuccessfulStatus,
                        Message = watchResponse.Message,
                        Description = watchResponse.Description,
                        NotificationEmailIds = item.NotificationMailIds,
                        NotificationRequired = item.FailedNotificationRequired,
                        ServiceName = item.ServiceName,
                        EnvironmentName = item.Environment,
                        Category = item.Category
                    };

                    try
                    {
                        await Client.PostServiceStatusLog(serviceStatusLog);
                    }
                    catch (Exception ex)
                    {
                        Logger?.LogCritical(" Error on saving watch response ({0}): '{1}'", item.ServiceName,
                            ex.Message);
                    }
                }
                catch (Exception ex)
                {
                    Logger?.LogCritical(" Error watching service: '{0}': '{1}'", item.ServiceName, ex.Message);
                }
                Thread.Sleep(item.Interval ?? delayTime);
            }
            // ReSharper disable once FunctionNeverReturns
        }
    }
}
