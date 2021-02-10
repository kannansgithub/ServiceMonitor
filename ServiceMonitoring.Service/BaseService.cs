using Microsoft.Extensions.Logging;
using ServiceMonitoring.Model;
using ServiceMonitoring.Service.Contracts;
using System;

namespace ServiceMonitoring.Service
{
    public class BaseService : IBaseService
    {
        protected readonly ILogger Logger;
        protected readonly ServiceMonitoringDbContext DbContext;
        protected bool Disposed;

        public BaseService(ServiceMonitoringDbContext dbContext, ILogger logger)
        {
            DbContext = dbContext;
            Logger = logger;
        }

        public virtual void Dispose()
        {
            if (Disposed)
                return;
            DbContext.Dispose();
            GC.SuppressFinalize(this);
            Disposed = true;
        }
    }
}
