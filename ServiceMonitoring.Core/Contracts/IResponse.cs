namespace ServiceMonitoring.Core.Contracts
{
    public interface IResponse
    {
        string Message { get; set; }
        bool HasError { get; set; }
        string ErrorMessage { get; set; }
    }
}
