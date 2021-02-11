using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Worker.Models;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace ServiceMonitoring.Worker
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private readonly IConfiguration _configuration;
        public Worker(ILogger<Worker> logger, IConfiguration configuration)
        {
            _logger = logger;
            _configuration = configuration;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            while (!stoppingToken.IsCancellationRequested)
            {
                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
                await StartAsync();
                await Task.Delay(_configuration.GetValue<int>("appSettings:delayTime"), stoppingToken);
            }
        }

        private async Task StartAsync()
        {
            _logger.LogDebug("Starting service monitor...");

            var client = new ServiceMonitorClient(_configuration.GetValue<string>("appSettings:baseUrl"));

            ServiceWatchResponse serviceWatcherItemsResponse;

            try
            {
                serviceWatcherItemsResponse = await client.GetWatcherItemsAsync();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on retrieve watch items: {0}", ex);
                return;
            }

            foreach (var item in serviceWatcherItemsResponse.Model)
            {
                var watcherType = Type.GetType(item.TypeName, true);
                var watcherInstance = (IWatcher)Activator.CreateInstance(watcherType);
                await Task.Factory.StartNew(async () =>
                {
                    var controller = new MonitorService(_logger, watcherInstance, client);
                    await controller.ProcessAsync(item, _configuration.GetValue<int>("appSettings:delayTime"));
                });
            }
        }
    }
}
