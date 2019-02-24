using System.Data;

namespace PMSIDAL.Authorization
{
    public interface IValidateAuthorizationDAL
    {
        DataSet ValidateAuthorization(string PrivilegeId, string UserId);
    }
}
