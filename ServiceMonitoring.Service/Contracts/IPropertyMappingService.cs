using ServiceMonitoring.Model.Models;
using System.Collections.Generic;

namespace ServiceMonitoring.Service.Contracts
{
    public interface IPropertyMappingService
    {
        Dictionary<string, PropertyMappingValue> GetPropertyMapping<TSource, TDestination>();
        bool ValidMappingExistsFor<TSource, TDestination>(string fields);
    }
}
