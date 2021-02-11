namespace ServiceMonitoring.Model.Models
{
    public class ServiceResponse
    {
        public string ServiceName { get; set; }
        public string Description { get; set; }

        public string LastMonitored { get; set; }
        public bool CurrentStatus { get; set; }
        public int NumberOfTimeMonitored { get; set; }
    }
}
