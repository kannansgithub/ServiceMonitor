using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.Core.Response;
using ServiceMonitoring.Model;
using ServiceMonitoring.Model.Entity;
using ServiceMonitoring.Service.Contracts;
using System;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service
{
    public class WriteService : BaseService, IWriteService
    {
        private readonly ServiceMonitoringDbContext _dbContext;
        public WriteService(ILogger logger, ServiceMonitoringDbContext dbContext)
            : base(dbContext, logger)
        {
            _dbContext = dbContext;
        }
        public async Task<SingleResponse<ServiceStatusLog>> CreateStatusLogAsync(ServiceStatusLog entity, Guid serviceEnvironmentId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(CreateStatusLogAsync));
            var response = new SingleResponse<ServiceStatusLog>();
            await using var txn = await _dbContext.Database.BeginTransactionAsync();
            try
            {
                var serviceEnvStatus = await _dbContext.ServiceStatuses
                    .FirstOrDefaultAsync(x => x.ServiceEnvironmentId == serviceEnvironmentId);
                if (serviceEnvStatus == null)
                {
                    serviceEnvStatus = new ServiceStatus
                    {
                        ServiceEnvironmentId = serviceEnvironmentId,
                        SuccessStatus = entity.SuccessfulStatus,
                        NumberOfWatch = 1,
                        LastWatch = DateTime.Now
                    };
                    await _dbContext.ServiceStatuses.AddAsync(serviceEnvStatus);
                    await _dbContext.SaveChangesAsync();
                    Logger?.LogInformation("The status for service environment was saved successfully");
                }
                else
                {
                    serviceEnvStatus.SuccessStatus = entity.SuccessfulStatus;
                    serviceEnvStatus.NumberOfWatch += 1;
                    serviceEnvStatus.LastWatch = DateTime.Now;
                    Logger?.LogInformation("The status for service environment was updated successfully");
                }
                entity.ServiceStatusId = serviceEnvStatus.Id;
                entity.CreatedOn = DateTime.Now;
                await _dbContext.ServiceStatusLogs.AddAsync(entity);
                await _dbContext.SaveChangesAsync();
                Logger?.LogInformation("The status details for service environment was created successfully");
                await txn.CommitAsync();
                response.Model = entity;

            }
            catch (Exception ex)
            {
                await txn.RollbackAsync();
                response.SetError(Logger, nameof(CreateStatusLogAsync), ex);
            }

            return response;
        }
    }
}
