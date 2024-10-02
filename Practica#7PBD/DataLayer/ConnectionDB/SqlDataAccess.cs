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
            _connectionString = //Aqui va la cadena conexion ;
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
