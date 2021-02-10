using ServiceMonitoring.Model.Entity;

namespace ServiceMonitoring.API.Requests
{
#pragma warning disable CS1591
    public static class Extensions
    {
        public static ServiceStatusLog ToEntity(this PostServiceStatusLogRequest request)
            => RequestMapper.ConfigMapper.Map<PostServiceStatusLogRequest, ServiceStatusLog>(request);
    }
#pragma warning restore CS1591
}
