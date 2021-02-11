using ServiceMonitoring.Core.Response;
using ServiceMonitoring.Model.Models;
using System;
using System.Threading.Tasks;

namespace ServiceMonitoring.Service.Contracts
{
    public interface IReadService : IBaseService
    {
        Task<ListResponse<ServiceWatcherItemInfo>> GetWatcherItem();

        Task<ListResponse<ServiceStatusDetailInfo>> GetServiceStatusesAsync(Guid userId);
        Task<ListResponse<DropdownValue>> GetAllEnvironment();
        Task<ListResponse<ServiceResponse>> GetServiceDataAsync(string categoryName, Guid? environmentId);
        Task<SingleResponse<DashboardInfo>> LoadDatabaseDataAsync(Guid? environmentId);
    }
}
