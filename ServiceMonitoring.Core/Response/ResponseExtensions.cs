using Microsoft.Extensions.Logging;
using ServiceMonitoring.Core.Contracts;
using System;

namespace ServiceMonitoring.Core.Response
{
    public static class ResponseExtensions
    {
        public static void SetError(this IResponse response, ILogger logger, string methodName, Exception ex)
        {
            response.HasError = true;
            response.ErrorMessage = ex.Message;
            logger?.LogCritical("Error on '{0}': {1}", methodName, ex);
        }
    }
}
