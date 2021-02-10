using System.Collections.Generic;

namespace ServiceMonitoring.Worker.Helpers
{
    public class ApiUrlBinder
    {
        public ApiUrlBinder()
        {
        }

        public ApiUrlBinder(string baseUrl = "http://localhost", string apiSuffix = "api", string apiVersion = "v1")
        {
            BaseUrl = baseUrl;
            ApiSuffix = apiSuffix;
            ApiVersion = apiVersion;
        }

        public string BaseUrl { get; set; }

        public string ApiSuffix { get; set; }

        public string ApiVersion { get; set; }

        public string Controller { get; set; }

        public string Action { get; set; }

        public string Id { get; set; }

        public override string ToString()
        {
            var output = new List<string>
            {
                BaseUrl
            };

            if (!string.IsNullOrEmpty(ApiSuffix))
                output.Add(ApiSuffix);

            if (!string.IsNullOrEmpty(ApiVersion))
                output.Add(ApiVersion);

            output.Add(Controller);

            if (!string.IsNullOrEmpty(Action))
                output.Add(Action);

            if (!string.IsNullOrEmpty(Id))
                output.Add(Id);

            Controller = "";
            Action = "";
            Id = "";

            return string.Join("/", output);
        }
    }
}
