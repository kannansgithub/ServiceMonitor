using ServiceMonitoring.Model.Entity;

namespace ServiceMonitoring.API.Requests
{
#pragma warning disable CS1591
    public static class Extensions
    {
        public static ServiceStatusLog ToEntity(this PostServiceStatusLogRequest request)
            => RequestMapper.ConfigMapper.Map<PostServiceStatusLogRequest, ServiceStatusLog>(request);

        public static string GetIcon(this string name)
        {
            return name switch
            {
                "Windows Service" => "settings_applications",
                "Web Service" => "settings",
                "Server" => "settings_input_component",
                "Web API" => "wifi_tethering_error_rounded",
                "Database" => "storage",
                "URL" => "network_check",
                _ => "notification_important"
            };
        }
    }
#pragma warning restore CS1591
}
