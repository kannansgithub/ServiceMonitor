using System;
using System.Collections.Generic;

namespace ServiceMonitoring.Worker.Models
{
    public class ServiceWatchItem
    {
        public Guid ServiceId { get; set; }
        public Guid ServiceEnvironmentId { get; set; }
        public string Environment { get; set; }
        public string ServiceName { get; set; }
        public int? Interval { get; set; }
        public string Url { get; set; }
        public string Address { get; set; }
        public string ConnectionString { get; set; }
        public string TypeName { get; set; }
        public string WindowsServiceName { get; set; }
        public string UsernameKey { get; set; }
        public string PasswordKey { get; set; }
        public string ServerName { get; set; }
        public bool FailedNotificationRequired { get; set; }
        public string NotificationMailIds { get; set; }
        public string Authority { get; set; }
        public string Category { get; set; }
        public IDictionary<string, string> ToDictionary()
            => new Dictionary<string, string>
            {
                { "Url", Url },
                { "Address", Address },
                { "ConnectionString", ConnectionString },
                { "TypeName", TypeName },
                { "WindowsServiceName", WindowsServiceName },
                { "UsernameKey", GetUserInfo("UsernameKey",UsernameKey) },
                { "PasswordKey", PasswordKey },
                { "ServerName", ServerName },
                { "FailedNotificationRequired",Convert.ToString(FailedNotificationRequired) },
                { "NotificationMailIds", NotificationMailIds },
                { "Authority",GetUserInfo("Authority",UsernameKey)},
                {"Category",Category}
            };

        private string GetUserInfo(string type, string userName)
        {
            if (string.IsNullOrEmpty(userName)) return string.Empty;
            var userInfo = UsernameKey.Split('\\');
            if (userInfo.Length != 2) return string.Empty;
            return type switch
            {
                "UsernameKey" => userInfo[1],
                "Authority" => userInfo[0],
                _ => string.Empty
            };
        }
        //public string GetTarget()
        //{
        //    if (!string.IsNullOrEmpty(Url)) return Url;
        //    if (!string.IsNullOrEmpty(Address)) return Address;
        //    if (!string.IsNullOrEmpty(ConnectionString)) return ConnectionString;
        //    if (!string.IsNullOrEmpty(ConnectionString)) return ConnectionString;
        //    if (!string.IsNullOrEmpty(UsernameKey)) return UsernameKey;
        //    if (!string.IsNullOrEmpty(PasswordKey)) return PasswordKey;
        //    if (!string.IsNullOrEmpty(ServerName)) return ServerName;
        //    if (!string.IsNullOrEmpty(NotificationMailIds)) return NotificationMailIds;
        //    return string.IsNullOrEmpty(WindowsServiceName) ? WindowsServiceName : string.Empty;
        //}
    }
}
