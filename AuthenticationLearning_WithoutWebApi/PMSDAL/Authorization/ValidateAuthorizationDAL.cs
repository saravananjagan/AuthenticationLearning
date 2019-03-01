using PMSIDAL.Authorization;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PMSDAL.Authorization
{
    public class ValidateAuthorizationDAL : IValidateAuthorizationDAL
    {
        private readonly string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public DataSet ValidateAuthorization(string PrivilegeId, string UserId)
        {
            DataSet VaidationResult = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.USP_ValidatePrivilege", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    sqlCommand.Parameters.Add("@PrivilegeId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(PrivilegeId);
                    sqlCommand.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UserId);
                    sqlCommand.CommandTimeout = 120;
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                    adapter.Fill(VaidationResult);
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
