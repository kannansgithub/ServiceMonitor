using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace ServiceMonitoring.Model.Entity
{
    public class ServiceCategory : BaseEntity
    {
        [Column(Order = 2)]

        public string Name { get; set; }

        public ICollection<Service> Services { get; set; }
    }
}
