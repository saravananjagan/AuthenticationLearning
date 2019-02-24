using PMSIDAL.Authorization;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PMSDAL.Authorization
{
    public class ValidateAuthorizationDAL : IValidateAuthorizationDAL
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public DataSet ValidateAuthorization(string PrivilegeId, string UserId)
        {
            DataSet VaidationResult = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.USP_ValidatePrivilege", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.Add("@PrivilegeId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(PrivilegeId);
                    sqlCommand.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UserId);
                    connection.Open();
                    sqlCommand.CommandTimeout = 120;
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                    adapter.Fill(VaidationResult);
                    connection.Close();
                    adapter.Dispose();
                }
                return VaidationResult;
            }
            finally
            {
                VaidationResult = null;
            }
        }
    }
}
