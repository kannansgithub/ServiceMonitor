using System.Collections.Generic;

namespace ServiceMonitoring.Core.Contracts
{
    public interface IListResponse<TModel> : IResponse where TModel : class
    {
        public IEnumerable<TModel> Model { get; set; }
    }
}