﻿using Microsoft.EntityFrameworkCore;
using ServiceMonitoring.Model;
using ServiceMonitoring.Model.Entity;
using ServiceMonitoring.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service.Extensions
{
    public static class ServiceMonitorDbContextReadExtensions
    {
        public static IQueryable<ServiceWatcherItemInfo> GetWatcherItem(this ServiceMonitoringDbContext dbContext)
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
                join srvCat in dbContext.ServiceCategories
                    on service.ServiceCategoryId equals srvCat.Id
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
                    TypeName = watcher.AssemblyQualifiedName,
                    FailedNotificationRequired = serviceEnvironment.FailedNotificationRequired,
                    NotificationMailIds = serviceEnvironment.NotificationMailIds,
                    PasswordKey = serviceEnvironment.PasswordKey,
                    ServerName = serviceEnvironment.ServerName,
                    UsernameKey = serviceEnvironment.UsernameKey,
                    Category = srvCat.Name

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
        public static IQueryable<DropdownValue> GetAllEnvironment(this ServiceMonitoringDbContext dbContext)
        {
            var query = dbContext.Environments.Where(x => x.IsActive).Select(s => new DropdownValue
            {
                Id = s.Id,
                Name = s.Name
            }).OrderBy(x => x.Name);
            return query;
        }
        public static DashboardInfo GetDashboardData(this ServiceMonitoringDbContext dbContext, Guid? environmentId)
        {
            if (environmentId == null || environmentId == Guid.Empty)
            {
                environmentId = dbContext.Environments.FirstOrDefault(x => x.Name.Contains("Dev"))?.Id;
            }
            return new DashboardInfo
            {
                DashValues = GetDashValues(dbContext, environmentId).ToList(),
                DashMonitoredServiceValues = GetDashMonitoredServiceValues(dbContext, environmentId),
                DashOverviewServiceValues = GetDashOverviewServiceValues(dbContext, environmentId)
            };
        }

        public static IQueryable<ServiceResponse> GetServiceData(this ServiceMonitoringDbContext dbContext, string categoryName, Guid? environmentId)
        {
            if (environmentId == null || environmentId == Guid.Empty)
            {
                environmentId = dbContext.Environments.FirstOrDefault(x => x.Name.Contains("Dev"))?.Id;
            }

            var query =
                        from srv in dbContext.Services
                        join srvCat in dbContext.ServiceCategories on srv.ServiceCategoryId equals srvCat.Id
                        join srvEnv in dbContext.ServiceEnvironments on srv.Id equals srvEnv.ServiceId
                        join env in dbContext.Environments on srvEnv.EnvironmentId equals env.Id
                        join srvStatus in dbContext.ServiceStatuses on srvEnv.Id equals srvStatus.ServiceEnvironmentId
                        where srvEnv.EnvironmentId == environmentId && srvCat.Name == categoryName && srv.IsActive
                        select new ServiceResponse
                        {
                            CurrentStatus = srvStatus.SuccessStatus,
                            LastMonitored = srvStatus.LastWatch.ToString("dd MMMM yyyy"),
                            NumberOfTimeMonitored = srvStatus.NumberOfWatch,
                            ServiceName = srv.Name,
                            Description = srv.Description,
                            ServiceId = srv.Id,
                            Environment = env.Name,

                        };
            return query.OrderBy(x => x.ServiceName);
        }

        public static async Task<ServiceStatus> GetServiceEnvironmentStatusByServiceEnvironmentAsync(this ServiceMonitoringDbContext dbContext, ServiceEnvironment entity)
            => await dbContext.ServiceStatuses.FirstOrDefaultAsync(item => item.ServiceEnvironmentId == entity.Id);

        public static IQueryable<ServiceLogResponse> GetServiceLogData(this ServiceMonitoringDbContext dbContext, Guid serviceId, Guid? environmentId)
        {
            if (environmentId == null || environmentId == Guid.Empty)
            {
                environmentId = dbContext.Environments.FirstOrDefault(x => x.Name.Contains("Dev"))?.Id;
            }
            if (serviceId == null || serviceId == Guid.Empty)
                throw new ArgumentNullException(nameof(serviceId));
            var query = from srv in dbContext.Services
                        join srvCtg in dbContext.ServiceCategories on srv.ServiceCategoryId equals srvCtg.Id
                        join srvEnv in dbContext.ServiceEnvironments on srv.Id equals srvEnv.ServiceId
                        join env in dbContext.Environments on srvEnv.EnvironmentId equals env.Id
                        join srvSta in dbContext.ServiceStatuses on srvEnv.Id equals srvSta.ServiceEnvironmentId
                        join srvLogs in dbContext.ServiceStatusLogs on srvSta.Id equals srvLogs.ServiceStatusId
                        where srv.IsActive == true && srv.Id == serviceId && srvEnv.EnvironmentId == environmentId
                        select new ServiceLogResponse
                        {
                            Category = srvCtg.Name,
                            Description = srv.Description,
                            Environment = env.Name,
                            LoggedDate = srvLogs.CreatedOn,
                            Message = srvLogs.Message,
                            Status = srvLogs.SuccessfulStatus,
                            ServiceId = srv.Id,
                            ServiceName = srv.Name
                        };
            return query;
        }





        private static IQueryable<ServiceInfo> GetDashValues(ServiceMonitoringDbContext dbContext, Guid? environmentId)
        {
            var query = from svcCategory in dbContext.ServiceCategories
                        join srv in dbContext.Services on svcCategory.Id equals srv.ServiceCategoryId
                        join svcEnv in dbContext.ServiceEnvironments on srv.Id equals svcEnv.ServiceId
                        where svcEnv.IsActive && svcEnv.EnvironmentId == environmentId
                        select new ServiceInfo
                        {
                            ServiceType = svcCategory.Name,
                            Count = 1
                        };
            var groupedData = query.GroupBy(data => data.ServiceType).Select(gr => new ServiceInfo
            {
                ServiceType = gr.Key,
                Count = gr.Count()
            });
            return groupedData;
        }
        private static IList<MonitoredServiceInfo> GetDashMonitoredServiceValues(ServiceMonitoringDbContext dbContext, Guid? environmentI)
        {
            var data = GetDashValues(dbContext, environmentI).ToList();
            var totalServices = data.Sum(x => x.Count);
            var monitored = new List<MonitoredServiceInfo>();
            foreach (var srv in data)
            {
                monitored.Add(
                    new MonitoredServiceInfo
                    {
                        ServiceType = srv.ServiceType,
                        Count = GetPercentage(totalServices, srv.Count)
                    });
            }

            return monitored;
        }

        private static List<ChartResponse> GetDashOverviewServiceValues(ServiceMonitoringDbContext dbContext, Guid? environmentId)
        {
            var query =
                from srvStatusLog in dbContext.ServiceStatusLogs
                join srvStatus in dbContext.ServiceStatuses on srvStatusLog.ServiceStatusId equals srvStatus.Id
                join srvEnv in dbContext.ServiceEnvironments on srvStatus.ServiceEnvironmentId equals srvEnv.Id
                where srvStatus.IsActive && srvEnv.EnvironmentId == environmentId
                select new
                {
                    srvStatusLog.SuccessfulStatus,
                    Target = srvStatusLog.SuccessfulStatus ? "Working Services" : "Not-Working Services"
                };
            var groupedData = query.GroupBy(grp => new { grp.Target }).Select(data => new ServiceOverViewInfo
            {
                label = data.Key.Target,
                data = data.Count()
            }).ToList();
            var response = new List<ChartResponse>();
            groupedData.ForEach(x =>
            {
                var existingData = response.FirstOrDefault(chartResponse => chartResponse.label == x.label);
                if (existingData == null)
                {
                    response.Add(new ChartResponse
                    {
                        label = x.label,
                        data = new List<int> { x.data }
                    });
                }
                else
                {
                    existingData.data.Add(x.data);
                }
            });
            var random = new Random();
            for (var i = 0; i < 50; i++)
            {
                response.ForEach(x => x.data.Add(random.Next(1000)));

            }
            return response;
        }
        private static decimal GetPercentage(decimal total, decimal serviceCount)
        {
            return (serviceCount / total) * 100;
        }

    }
}
