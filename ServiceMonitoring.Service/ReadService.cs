using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.Core.Response;
using ServiceMonitoring.Model;
using ServiceMonitoring.Model.Models;
using ServiceMonitoring.Service.Contracts;
using ServiceMonitoring.Service.Extensions;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service
{
    public class ReadService : BaseService, IReadService
    {
        private readonly ServiceMonitoringDbContext _dbContext;

        public ReadService(ILogger logger, ServiceMonitoringDbContext dbContext)
            : base(dbContext, logger)
        {
            _dbContext = dbContext;
        }

        public async Task<ListResponse<ServiceWatcherItemInfo>> GetActiveServiceWatcherItemsAsync()
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetActiveServiceWatcherItemsAsync));
            var response = new ListResponse<ServiceWatcherItemInfo>();
            try
            {
                response.Model = await _dbContext.GetActiveServiceWatcherItems().ToListAsync();
                Logger?.LogInformation("The service watch items were loaded successfully");
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(GetActiveServiceWatcherItemsAsync), ex);
            }

            return response;
        }

        public async Task<ListResponse<ServiceStatusDetailInfo>> GetServiceStatusesAsync(Guid userId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetServiceStatusesAsync));

            var response = new ListResponse<ServiceStatusDetailInfo>();

            try
            {
                response.Model = await _dbContext.GetServiceStatuses(userId).ToListAsync();

                if (response.Model?.Count() == 0)
                    Logger?.LogInformation("There is no data for user with ID '{0}'", userId);
                else
                    Logger?.LogInformation("The service status details for user with ID '{0}' were loaded successfully", userId);
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(GetServiceStatusesAsync), ex);
            }

            return response;
        }
    }
}
