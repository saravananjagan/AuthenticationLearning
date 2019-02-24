using IPMSService.Authorization;
using PMSService.Authorization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSProxy.Authorization
{
    public static class ValidateAuthorizationProxy
    {
        public static DataSet ValidateAuthorization(string PrivilegeId, string UserId)
        {
            IValidateAuthorizationService validateAuthorizationService = new ValidateAuthorizationService();
            return validateAuthorizationService.ValidateAuthorization(PrivilegeId, UserId);
        }
    }
}
