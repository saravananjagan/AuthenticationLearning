using AuthenticationLearning_WithoutWebApi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using PMSProxy.FetchMetadata;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AuthenticationLearning_WithoutWebApi.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        [Authorize]
        public ActionResult Index()
        {
            string TenantId=TenantDetailsProxy.FetchTenantId();
            if (User.Identity.IsAuthenticated)
            {                
                
                //DataSet ModuleDisplayDetails=ModuleDisplayDetailsProxy.FetchModuleDisplayDetails(TenantId,User.Identity.)
                var user = User.Identity;
                ViewBag.Name = user.Name;

                ViewBag.displayMenu = "No";

                if (isAdminUser())
                {
                    ViewBag.displayMenu = "Yes";
                }
                return View();
            }
            else
            {
                ViewBag.Name = "Not Logged IN";
            }
            return View();
        }

        private Boolean isAdminUser()
        {
            if (User.Identity.IsAuthenticated)
            {                
                var user = User.Identity;
                ApplicationDbContext context = new ApplicationDbContext();
                var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                var s = UserManager.GetRoles(user.GetUserId());
                if (s[0].ToString() == "Admin")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }

    }
}