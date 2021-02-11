using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.API.Requests;
using ServiceMonitoring.API.Responses;
using ServiceMonitoring.Service.Contracts;
using System.Threading.Tasks;

namespace ServiceMonitoring.API.Controllers
{
#pragma warning disable CS1591
    [Route("api/v1/[controller]")]
    [ApiController]
    public class AdministrationController : ControllerBase
    {
        readonly ILogger _logger;
        readonly IWriteService _writeService;
        readonly IReadService _readService;


        public AdministrationController(ILogger<AdministrationController> logger, IWriteService writeservice, IReadService readService)
        {
            _logger = logger;
            _writeService = writeservice;
            _readService = readService;
        }
#pragma warning restore CS1591

        /// <summary>
        /// Saves a result from service watch action
        /// </summary>
        /// <param name="request">Service status result</param>
        /// <returns>Ok if save it was successfully, Not found if service not exists else server internal error</returns>
        /// <response code="201">If service log was created successful</response>
        /// <response code="500">If there was an internal server error</response>
        [HttpPost("CreateStatusLog")]
        [ProducesResponseType(201)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> CreateStatusLog([FromBody] PostServiceStatusLogRequest request)
        {
            _logger?.LogDebug("'{0}' has been invoked", nameof(CreateStatusLog));
            var response = await _writeService
                .CreateStatusLogAsync(request.ToEntity(), request.ServiceEnvironmentId);
            return response.ToHttpCreatedResponse();
        }
        /// <summary>
        /// Gets service watcher items (registered services to watch with service monitor)
        /// </summary>
        /// <returns>A sequence of services to watch</returns>
        /// <response code="200">A list of services to watch</response>
        /// <response code="500">If there was an internal server error</response>
        [HttpGet("GetWatcherItem")]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> GetWatcherItem()
        {
            _logger?.LogDebug("'{0}' has been invoked", nameof(GetWatcherItem));

            var response = await _readService.GetWatcherItem();

            return response.ToHttpResponse();
        }
    }
}
