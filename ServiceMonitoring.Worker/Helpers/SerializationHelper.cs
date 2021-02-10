using Newtonsoft.Json;

namespace ServiceMonitoring.Worker.Helpers
{
    public static class SerializationHelper
    {
        public static string Serialize<T>(T obj)
            => JsonConvert.SerializeObject(obj);

        public static T Deserialize<T>(string source)
            => JsonConvert.DeserializeObject<T>(source);
    }
}
