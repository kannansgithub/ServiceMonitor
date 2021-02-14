using System;

namespace ServiceMonitoring.Model.Models
{
    public class ServiceRequest
    {
        private int _pageSize = 10;


        private const int MaxPageSize = 20;
        public Guid ServiceId { get; set; }
        public Guid EnvironmentId { get; set; }
        public string SearchQuery { get; set; }
        public int PageNumber { get; set; } = 1;
        public string OrderBy { get; set; } = "Name";
        public string Fields { get; set; }
        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > MaxPageSize) ? MaxPageSize : value;
        }
    }
}
