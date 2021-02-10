namespace ServiceMonitoring.Core.Contracts
{
    public interface ISingleResponse<TModel> : IResponse where TModel : class
    {
        TModel Model { get; set; }
    }
}
