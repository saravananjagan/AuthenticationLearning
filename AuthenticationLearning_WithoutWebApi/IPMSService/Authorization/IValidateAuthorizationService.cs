using System.Data;

namespace IPMSService.Authorization
{
    public interface IValidateAuthorizationService
    {
        DataSet ValidateAuthorization(string PrivilegeId, string UserId);
    }
}
