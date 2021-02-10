using System.Collections.Generic;

namespace ServiceMonitoring.Worker.Models
{
    public class ServiceWatchResponse
    {
        public string Message { get; set; }

        public bool HasError { get; set; }

        public string ErrorMessage { get; set; }

        public IEnumerable<ServiceWatchItem> Model { get; set; }
    }
}
