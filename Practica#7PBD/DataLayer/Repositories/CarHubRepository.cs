using DataLayer.ConnectionDB;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Repositories
{
	public class CarHubRepository
	{
		private SqlDataAccess _dbConnection;

        public CarHubRepository()
        {
            _dbConnection = new SqlDataAccess();
        }

        public DataTable GetCars()
		{
			DataTable carsTable = new DataTable();

			using( var connection = _dbConnection.GetConnection())
			{
				string query = "SELECT * FROM carhub";

				SqlCommand cmd = new SqlCommand(query, connection);
				connection.Open();

				SqlDataReader reader = cmd.ExecuteReader();
				carsTable.Load(reader);
			}

				return carsTable;
		}
	}
}
