using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.ConnectionDB
{
	public class SqlDataAccess
	{
		private readonly string _connectionString;

        public SqlDataAccess()
        {
            _connectionString = "Data Source=U20210444;Initial Catalog=CarHubDB;Integrated Security=True;Trust Server Certificate=True";
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
