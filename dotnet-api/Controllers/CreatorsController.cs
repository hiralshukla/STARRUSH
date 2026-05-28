using Microsoft.AspNetCore.Mvc;
using Oracle.ManagedDataAccess.Client;
using DotnetApi.Data;
using DotnetApi.Models;

namespace DotnetApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class CreatorsController : ControllerBase
{
    private readonly OracleConnectionFactory _connectionFactory;

    public CreatorsController(OracleConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    [HttpGet]
    public async Task<ActionResult<List<Creator>>> GetCreators()
    {
        var creators = new List<Creator>();

        await using var connection = _connectionFactory.CreateConnection();
        await connection.OpenAsync();

        const string sql = @"
            SELECT
                CreatorID,
                FirstName,
                LastName,
                Email,
                HeadShotImage,
                ProfileImage,
                AboutMe,
                WorkExperience,
                CreatorRole
            FROM CREATORS
            ORDER BY CreatorID";

        await using var command = new OracleCommand(sql, connection);
        await using var reader = await command.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            creators.Add(new Creator
            {
                CreatorId = Convert.ToInt32(reader["CREATORID"]),
                FirstName = reader["FIRSTNAME"] as string,
                LastName = reader["LASTNAME"] as string,
                Email = reader["EMAIL"] as string,
                HeadShotImage = reader["HEADSHOTIMAGE"] as string,
                ProfileImage = reader["PROFILEIMAGE"] as string,
                AboutMe = reader["ABOUTME"] as string,
                WorkExperience = reader["WORKEXPERIENCE"] as string,
                CreatorRole = reader["CREATORROLE"] as string
            });
        }

        return Ok(creators);
    }
}