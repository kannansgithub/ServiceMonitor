using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using ServiceMonitoring.API.HubConfig;
using ServiceMonitoring.API.Requests;
using ServiceMonitoring.API.Responses;
using ServiceMonitoring.Model.Models;
using ServiceMonitoring.Service.Contracts;
using System;
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
        private readonly IHubContext<NotificationHub> _hub;

        public AdministrationController(ILogger<AdministrationController> logger, IWriteService writeService, IReadService readService, IHubContext<NotificationHub> hub)
        {
            _logger = logger;
            _writeService = writeService;
            _readService = readService;
            _hub = hub;
        }
        [HttpPost("CreateStatusLog")]
        public async Task<IActionResult> CreateStatusLog([FromBody] PostServiceStatusLogRequest request)
        {
            var response = await _writeService
                .CreateStatusLogAsync(request.ToEntity(), request.ServiceEnvironmentId);
            //if (request.SuccessfulStatus || !request.NotificationRequired)
            //    return response.ToHttpCreatedResponse();
            var notification = new NotificationResponse
            {
                Environment = request.EnvironmentName,
                ServiceName = request.ServiceName
            };
            await _hub.Clients.All.SendAsync("GetNotify", $"{request.Category.GetIcon()}|{request.ServiceName}|{request.EnvironmentName}|{DateTime.Now.ToString("dd, MMMM yyyy hh:mm tt")}");
            //if (string.IsNullOrWhiteSpace(request.NotificationEmailIds))
            //{
            //var emailIds = request.NotificationEmailIds.Split(',');
            //TODO: Send an Email
            //}
            return response.ToHttpCreatedResponse();
        }
        [HttpGet("GetWatcherItem")]
        public async Task<IActionResult> GetWatcherItem()
        {
            var response = await _readService.GetWatcherItem();
            return response.ToHttpResponse();
        }


    }
}
