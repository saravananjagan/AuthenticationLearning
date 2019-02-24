using AuthenticationLearning_WithoutWebApi.Constants;
using Microsoft.AspNet.Identity;
using PMSProxy.Authorization;
using PMSProxy.FetchMetadata;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace AuthenticationLearning_WithoutWebApi.Controllers.Examination
{
    public class ExaminationController : Controller
    {
        // GET: Examination
        [Authorize]
        public ActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                string UserId = User.Identity.GetUserId();
                DataSet validationResult = new DataSet();
                validationResult=ValidateAuthorizationProxy.ValidateAuthorization(Privileges.View_Examination, UserId);
                DataTable ValidityTable = validationResult.Tables[0].DefaultView.ToTable();
                bool.TryParse(ValidityTable.Rows[0].ItemArray[0].ToString(),out bool result);
                if (result)
                {
                    DataSet ModuleListDataSet = ModuleDisplayDetailsProxy.FetchModuleDisplayDetailsByParent(ModuleConstants.ExaminationModuleId, UserId);
                    DataTable ModuleDataTable = ModuleListDataSet.Tables[0].DefaultView.ToTable();                    
                    return View(ModuleDataTable);
                }
                else
                {
                    ViewBag.ErrorMessage = SuccessAndErrorMsgs.AuthorizationError;
                    return View();
                }
            }
            
                return RedirectToAction("../User/Index");
        }
    }
}