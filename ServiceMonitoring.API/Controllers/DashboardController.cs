using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.API.Responses;
using ServiceMonitoring.Service.Contracts;
using System.Threading.Tasks;

namespace ServiceMonitoring.API.Controllers
{
#pragma warning disable CS1591
    [Route("api/v1/[controller]")]
    [ApiController]
    public class DashboardController : ControllerBase
    {
        protected readonly ILogger Logger;
        protected readonly IReadService Service;

        public DashboardController(ILogger<DashboardController> logger, IReadService service)
        {
            Logger = logger;
            Service = service;
        }
#pragma warning restore CS1591

        /// <summary>
        /// Gets service watcher items (registered services to watch with service monitor)
        /// </summary>
        /// <returns>A sequence of services to watch</returns>
        /// <response code="200">A list of services to watch</response>
        /// <response code="500">If there was an internal server error</response>
        [HttpGet("ServiceWatcherItem")]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> GetServiceWatcherItemsAsync()
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetServiceWatcherItemsAsync));

            var response = await Service.GetActiveServiceWatcherItemsAsync();

            return response.ToHttpResponse();
        }
    }
}
