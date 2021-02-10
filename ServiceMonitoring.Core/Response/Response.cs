using ServiceMonitoring.Core.Contracts;

namespace ServiceMonitoring.Core.Response
{
    public class Response : IResponse
    {
        public string Message { get; set; }
        public bool HasError { get; set; }
        public string ErrorMessage { get; set; }
    }
}
