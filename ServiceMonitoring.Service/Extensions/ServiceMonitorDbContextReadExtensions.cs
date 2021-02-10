using Microsoft.EntityFrameworkCore;
using ServiceMonitoring.Model;
using ServiceMonitoring.Model.Entity;
using ServiceMonitoring.Model.Models;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service.Extensions
{
    public static class ServiceMonitorDbContextReadExtensions
    {
        public static IQueryable<ServiceWatcherItemInfo> GetActiveServiceWatcherItems(this ServiceMonitoringDbContext dbContext)
        {
            return
                from serviceEnvironment in dbContext.ServiceEnvironments
                join service in dbContext.Services
                    on serviceEnvironment.ServiceId equals service.Id
                join serviceWatcher in dbContext.ServiceWatchers
                    on serviceEnvironment.ServiceId equals serviceWatcher.ServiceId
                join watcher in dbContext.Watchers
                    on serviceWatcher.WatcherId equals watcher.Id
                join environment in dbContext.Environments
                    on serviceEnvironment.EnvironmentId equals environment.Id
                select new ServiceWatcherItemInfo
                {
                    ServiceEnvironmentId = serviceEnvironment.Id,
                    ServiceId = service.Id,
                    Environment = environment.Name,
                    ServiceName = service.Name,
                    Interval = serviceEnvironment.Interval,
                    Url = serviceEnvironment.Url,
                    Address = serviceEnvironment.Address,
                    ConnectionString = serviceEnvironment.ConnectionString,
                    WindowsServiceName = serviceEnvironment.WindowsServiceName,
                    TypeName = watcher.AssemblyQualifiedName
                };
        }

        public static IQueryable<ServiceStatusDetailInfo> GetServiceStatuses(this ServiceMonitoringDbContext dbContext, Guid userId)
        {

            var servicesToWatch = (from usr in dbContext.UserInRoles
                                   join srvOwn in dbContext.ServiceOwners on usr.RoleId equals srvOwn.RoleId
                                   join srv in dbContext.ServiceEnvironments on srvOwn.ServiceEnvironmentId equals srv.Id
                                   where usr.UserId == userId
                                   select srv.ServiceId).ToList();



            var query = from svcEnvStatus in dbContext.ServiceStatuses
                        join svcEnv in dbContext.ServiceEnvironments
                            on svcEnvStatus.ServiceEnvironmentId equals svcEnv.Id
                        join svc in dbContext.Services
                            on svcEnv.ServiceId equals svc.Id
                        join env in dbContext.Environments
                            on svcEnv.EnvironmentId equals env.Id
                        where
                            svcEnv.IsActive
                        select new ServiceStatusDetailInfo
                        {
                            ServiceEnvironmentStatusId = svcEnvStatus.Id,
                            ServiceEnvironmentId = svcEnvStatus.ServiceEnvironmentId,
                            ServiceId = svc.Id,
                            ServiceName = svc.Name,
                            EnvironmentName = env.Name,
                            SuccessfulStatus = svcEnvStatus.SuccessStatus,
                            WatchCount = svcEnvStatus.NumberOfWatch,
                            LastWatch = svcEnvStatus.LastWatch
                        };

            query = query
                .OrderBy(item => item.ServiceName)
                .ThenBy(item => item.EnvironmentName);

            return query
                .Where(item => servicesToWatch.Contains(item.ServiceId));
        }

        public static async Task<ServiceStatus> GetServiceEnvironmentStatusByServiceEnvironmentAsync(this ServiceMonitoringDbContext dbContext, ServiceEnvironment entity)
            => await dbContext.ServiceStatuses.FirstOrDefaultAsync(item => item.ServiceEnvironmentId == entity.Id);
    }
}
