using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System.Threading.Tasks;

namespace ServiceMonitoring.Core.Contracts
{
    public interface IWatcher
    {
        string ActionName { get; }

        Task<WatchResponse> WatchAsync(WatcherParameter parameter);
    }
}
