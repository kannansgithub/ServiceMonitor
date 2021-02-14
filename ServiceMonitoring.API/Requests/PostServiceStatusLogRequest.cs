using System;

namespace ServiceMonitoring.API.Requests
{
    public class PostServiceStatusLogRequest
    {
        public Guid ServiceEnvironmentStatusLogId { get; set; }

        public Guid ServiceEnvironmentStatusId { get; set; }

        public Guid ServiceEnvironmentId { get; set; }

        public string Target { get; set; }

        public string ActionName { get; set; }

        public bool SuccessfulStatus { get; set; }

        public string Message { get; set; }

        public string Description { get; set; }
        public string Category { get; set; }
        public string ServiceName { get; set; }
        public string EnvironmentName { get; set; }
        public bool NotificationRequired { get; set; }
        public string NotificationEmailIds { get; set; }
    }
}
