namespace ServiceMonitoring.Core.Contracts
{
    public interface ISerializer
    {
        string Serialize<T>(T obj);
        T Deserialize<T>(string source);
    }
}
