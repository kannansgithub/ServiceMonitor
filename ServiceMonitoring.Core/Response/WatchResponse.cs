using ServiceMonitoring.Core.Contracts;

namespace ServiceMonitoring.Core.Response
{
    public class WatchResponse : IWatchResponse
    {
        public bool SuccessfulStatus { get; set; } = false;
        public string Message { get; set; }
        public string Description { get; set; }
        public string AccessedUser { get; set; }
    }
}
