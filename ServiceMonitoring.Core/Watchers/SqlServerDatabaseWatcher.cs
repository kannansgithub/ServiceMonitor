using Microsoft.Data.SqlClient;
using ServiceMonitoring.Core.Contracts;
using ServiceMonitoring.Core.Request;
using ServiceMonitoring.Core.Response;
using System;
using System.Threading.Tasks;

namespace ServiceMonitoring.Core.Watchers
{
    public class SqlServerDatabaseWatcher : IWatcher
    {
        public string ActionName
            => "OpenDatabaseConnection";

        public async Task<WatchResponse> WatchAsync(WatcherParameter parameter)
        {
            var response = new WatchResponse();

            await using var connection = new SqlConnection(parameter.Values["ConnectionString"]);
            try
            {
                await connection.OpenAsync();
                response.SuccessfulStatus = true;
            }
            catch (Exception ex)
            {
                response.Message = ex.Message;
                response.Description = ex.ToString();
            }
            return response;
        }
    }
}
