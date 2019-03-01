using PMSIDAL.FetchMetadata;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSDAL.FetchMetadata
{
    public class ModuleDisplayDetailsDAL : IModuleDisplayDetailsDAL
    {
        private readonly string ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public DataSet FetchModuleDisplayDetails(string TenantId, string UserId)
        {
            DataSet ModuleDisplayDetails = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.USP_FetchModuleDisplayDetails", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    sqlCommand.Parameters.Add("@TenantId",SqlDbType.UniqueIdentifier).Value=Guid.Parse(TenantId);
                    sqlCommand.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UserId);
                    sqlCommand.CommandTimeout = 120;
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                    adapter.Fill(ModuleDisplayDetails);
                    adapter.Dispose();
                }
                    return ModuleDisplayDetails;
            }
            finally
            {
                ModuleDisplayDetails = null;
            }
        }

        public DataSet FetchModuleDisplayDetailsByParent(string ParentModuleId, string UserId)
        {
            DataSet ModuleDisplayDetails = new DataSet();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.USP_FetchModuleDetailsByParent", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    sqlCommand.Parameters.Add("@ParentModuleId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(ParentModuleId);
                    sqlCommand.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = Guid.Parse(UserId);
                    sqlCommand.CommandTimeout = 120;
                    SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                    adapter.Fill(ModuleDisplayDetails);
                    adapter.Dispose();
                }
                return ModuleDisplayDetails;
            }
            finally
            {
                ModuleDisplayDetails = null;
            }
        }
    }
}
