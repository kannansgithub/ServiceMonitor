using ServiceMonitoring.Core.Contracts;
using System.Collections.Generic;

namespace ServiceMonitoring.Core.Response
{
    public class ListResponse<TModel> : Response, IListResponse<TModel> where TModel : class
    {
        public IEnumerable<TModel> Model { get; set; }
    }
}
