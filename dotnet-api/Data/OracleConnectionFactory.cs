using Oracle.ManagedDataAccess.Client;

namespace DotnetApi.Data;

public class OracleConnectionFactory
{
    private readonly string _connectionString;

    public OracleConnectionFactory(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("OracleDb")
            ?? throw new InvalidOperationException("OracleDb connection string is missing.");
    }

    public OracleConnection CreateConnection()
    {
        return new OracleConnection(_connectionString);
    }
}