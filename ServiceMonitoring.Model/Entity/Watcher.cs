using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class Watcher : BaseEntity
    {
        [Column(Order = 2)]

        public string Name { get; set; }
        [Column(Order = 3)]


        public string Description { get; set; }
        [Column(Order = 4)]


        public string AssemblyQualifiedName { get; set; }
        public ICollection<ServiceWatcher> ServiceWatchers { get; set; }

    }
}
