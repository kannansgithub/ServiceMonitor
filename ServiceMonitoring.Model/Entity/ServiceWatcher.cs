using System;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceWatcher : BaseEntity
    {
        public Guid ServiceId { get; set; }

        public Guid WatcherId { get; set; }

        public Watcher Watcher { get; set; }
        public Service Service { get; set; }
    }
}
