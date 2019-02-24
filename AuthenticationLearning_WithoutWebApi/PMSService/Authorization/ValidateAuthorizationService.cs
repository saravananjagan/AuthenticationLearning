using IPMSService.Authorization;
using PMSDAL.Authorization;
using PMSIDAL.Authorization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSService.Authorization
{
    public class ValidateAuthorizationService : IValidateAuthorizationService
    {
        public DataSet ValidateAuthorization(string PrivilegeId, string UserId)
        {
            DataSet VaidationResult = new DataSet();
            try
            {
                IValidateAuthorizationDAL validateAuthorizationDAL = new ValidateAuthorizationDAL();
                VaidationResult = validateAuthorizationDAL.ValidateAuthorization(PrivilegeId, UserId);
            }
            catch (Exception e)
            {

            }
            return VaidationResult;
        }
    }
}
