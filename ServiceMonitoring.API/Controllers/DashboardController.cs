using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
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
    public class DashboardController : ControllerBase
    {
        protected readonly ILogger Logger;
        protected readonly IReadService ReadService;

        public DashboardController(ILogger<DashboardController> logger, IReadService readService)
        {
            Logger = logger;
            ReadService = readService;
        }
        [HttpGet("GetEnvironment")]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> GetEnvironment()
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetEnvironment));

            var response = await ReadService.GetAllEnvironment();

            return response.ToHttpResponse();
        }
        [HttpGet("{categoryName}/{environmentId}/GetServiceData")]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> GetServiceData(string categoryName, Guid environmentId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(GetEnvironment));

            var response = await ReadService.GetServiceDataAsync(categoryName, environmentId);

            return response.ToHttpResponse();
        }
        [HttpGet("{environmentId}/LoadDatabaseData")]
        [ProducesResponseType(200)]
        [ProducesResponseType(500)]
        public async Task<IActionResult> LoadDatabaseData(Guid environmentId)
        {
            Logger?.LogDebug("'{0}' has been invoked", nameof(LoadDatabaseData));

            var response = await ReadService.LoadDatabaseDataAsync(environmentId);
            return response.ToHttpResponse();
        }
        [HttpGet(Name = "GetServiceLogs")]
        [HttpHead]
        public async Task<IActionResult> GetServiceLogs(
            [FromQuery] ServiceRequest serviceRequestParameters)
        {
            var serviceLogFromRepo = await ReadService.GetServiceLogs(serviceRequestParameters);
            if (serviceLogFromRepo.HasError || serviceLogFromRepo.Model == null)
                return serviceLogFromRepo.ToHttpResponse();
            var paginationMetadata = new
            {
                totalCount = serviceLogFromRepo.Model.TotalCount,
                pageSize = serviceLogFromRepo.Model.PageSize,
                currentPage = serviceLogFromRepo.Model.CurrentPage,
                totalPages = serviceLogFromRepo.Model.TotalPages
            };
            //Response.Headers.Add("X-Pagination",
            //    JsonSerializer.Serialize(paginationMetadata));
            return serviceLogFromRepo.ToHttpResponse();
        }
    }
}
