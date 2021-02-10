using ServiceMonitoring.Core.Response;
using ServiceMonitoring.Model.Entity;
using System;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service.Contracts
{
    public interface IWriteService : IBaseService
    {
        Task<SingleResponse<ServiceStatusLog>> CreateStatusLogAsync(ServiceStatusLog entity, Guid serviceEnvironmentId);
    }
}
