using ServiceMonitoring.Core.Contracts;

namespace ServiceMonitoring.Core.Response
{
    public class SingleResponse<TModel> : Response, ISingleResponse<TModel> where TModel : class
    {
        public TModel Model { get; set; }
    }
}
