using System.Collections.Generic;

namespace ServiceMonitoring.Model.Models
{
    public class ServiceOverViewInfo
    {
        public string label { get; set; }
        public string date { get; set; }
        public int data { get; set; }

    }
    public class ChartResponse
    {
        public string label { get; set; }
        public List<int> data { get; set; }
    }
}