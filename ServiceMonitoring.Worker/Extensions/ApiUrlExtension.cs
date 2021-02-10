using ServiceMonitoring.Worker.Helpers;

namespace ServiceMonitoring.Worker.Extensions
{
    public static class ApiUrlExtension
    {
        public static ApiUrlBinder Controller(this ApiUrlBinder apiUrl, string controller)
        {
            apiUrl.Controller = controller;

            return apiUrl;
        }

        public static ApiUrlBinder Action(this ApiUrlBinder apiUrl, string action)
        {
            apiUrl.Action = action;

            return apiUrl;
        }

        public static ApiUrlBinder Id(this ApiUrlBinder apiUrl, string id)
        {
            apiUrl.Id = id;

            return apiUrl;
        }

        public static ApiUrlBinder Id(this ApiUrlBinder apiUrl, int id)
        {
            apiUrl.Id = id.ToString();

            return apiUrl;
        }
    }
}
