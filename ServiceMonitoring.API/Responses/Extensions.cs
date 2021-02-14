using Microsoft.AspNetCore.Mvc;
using ServiceMonitoring.Core.Contracts;
using System.Net;

namespace ServiceMonitoring.API.Responses
{
    public static class Extensions
    {
        public static IActionResult ToHttpResponse<TModel>(this IListResponse<TModel> response) where TModel : class
        {
            var status = HttpStatusCode.OK;

            if (response.HasError)
                status = HttpStatusCode.InternalServerError;
            else if (response.Model == null)
                status = HttpStatusCode.NoContent;

            return new ObjectResult(response)
            {
                StatusCode = (int)status
            };
        }

        public static IActionResult ToHttpCreatedResponse<TModel>(this ISingleResponse<TModel> response) where TModel : class
        {
            var status = response.HasError ? HttpStatusCode.InternalServerError : HttpStatusCode.Created;

            return new ObjectResult(response)
            {
                StatusCode = (int)status
            };
        }
        public static IActionResult ToHttpResponse<TModel>(this ISingleResponse<TModel> response) where TModel : class
        {
            var status = HttpStatusCode.OK;

            if (response.HasError)
                status = HttpStatusCode.InternalServerError;
            else if (response.Model == null)
                status = HttpStatusCode.NoContent;

            return new ObjectResult(response)
            {
                StatusCode = (int)status
            };
        }
    }
}
