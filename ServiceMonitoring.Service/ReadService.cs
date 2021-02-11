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

        public async Task<ListResponse<ServiceWatcherItemInfo>> GetWatcherItem()
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetWatcherItem));
            var response = new ListResponse<ServiceWatcherItemInfo>();
            try
            {
                response.Model = await _dbContext.GetWatcherItem().ToListAsync();
                Logger?.LogInformation("The service watch items were loaded successfully");
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(GetWatcherItem), ex);
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
                Logger?.LogInformation(
                    response.Model?.Count() == 0
                        ? "There is no data for user with ID '{0}'"
                        : "The service status details for user with ID '{0}' were loaded successfully", userId);
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(GetServiceStatusesAsync), ex);
            }

            return response;
        }
        public async Task<SingleResponse<DashboardInfo>> LoadDatabaseDataAsync(Guid? environmentId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(LoadDatabaseDataAsync));
            var response = new SingleResponse<DashboardInfo>();
            try
            {
                response.Model = await Task.Factory.StartNew(() => _dbContext.GetDashboardData(environmentId));
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(LoadDatabaseDataAsync), ex);
            }

            return response;
        }
        public async Task<ListResponse<ServiceResponse>> GetServiceDataAsync(string categoryName, Guid? environmentId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(LoadDatabaseDataAsync));
            var response = new ListResponse<ServiceResponse>();
            try
            {
                response.Model = await _dbContext.GetServiceData(categoryName, environmentId).ToListAsync();
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(LoadDatabaseDataAsync), ex);
            }

            return response;
        }
        public async Task<ListResponse<DropdownValue>> GetAllEnvironment()
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(LoadDatabaseDataAsync));
            var response = new ListResponse<DropdownValue>();
            try
            {
                response.Model = await _dbContext.GetAllEnvironment().ToListAsync();
            }
            catch (Exception ex)
            {
                response.SetError(Logger, nameof(LoadDatabaseDataAsync), ex);
            }
            return response;
        }
    }
}
