using AutoMapper;
using ServiceMonitoring.Model.Entity;

namespace ServiceMonitoring.API.Requests
{
#pragma warning disable CS1591
    public static class RequestMapper
    {
        static RequestMapper()
        {
            ConfigMapper = new MapperConfiguration(config =>
            {
                config.CreateMap<ServiceStatusLog, PostServiceStatusLogRequest>();

                config.CreateMap<PostServiceStatusLogRequest, ServiceStatusLog>();
            }).CreateMapper();
        }

        public static IMapper ConfigMapper { get; }
    }
#pragma warning restore CS1591

}
