using ServiceMonitoring.Core.Response;
using ServiceMonitoring.Model.Models;
using System;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service.Contracts
{
    public interface IReadService : IBaseService
    {
        Task<ListResponse<ServiceWatcherItemInfo>> GetActiveServiceWatcherItemsAsync();

        Task<ListResponse<ServiceStatusDetailInfo>> GetServiceStatusesAsync(Guid userId);
    }
}
