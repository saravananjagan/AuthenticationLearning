

using System.Data;

namespace AuthenticationLearning_WithoutWebApi.Constants
{
    public class MenuViewModel
    {
        public string ModuleId { get; set; }
        public string ModuleName { get; set; }
        public string ModuleDisplayName { get; set; }
        public string ModuleIconClass { get; set; }
        public string ModuleUrl { get; set; }
        public DataTable SubMenuDetails { get; set; }
    }
}