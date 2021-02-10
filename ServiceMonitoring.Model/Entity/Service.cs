using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class Service : BaseEntity
    {
        [Column(Order = 2)]

        public string Name { get; set; }
        [Column(Order = 3)]

        public string Description { get; set; }
        [Column(Order = 4)]

        public Guid ServiceCategoryId { get; set; }


        public ServiceCategory ServiceCategory { get; set; }
        public ICollection<ServiceEnvironment> ServiceEnvironments { get; set; }
        public ICollection<ServiceWatcher> ServiceWatchers { get; set; }




    }
}
