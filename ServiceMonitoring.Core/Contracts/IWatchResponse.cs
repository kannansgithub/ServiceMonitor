namespace ServiceMonitoring.Core.Contracts
{
    public interface IWatchResponse
    {
        bool SuccessfulStatus { get; set; }

        string Message { get; set; }

        string Description { get; set; }
    }
}
