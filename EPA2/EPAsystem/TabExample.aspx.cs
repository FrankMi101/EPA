using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DataAccess;
namespace EPA2.EPAsystem
{
    public partial class TabExample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                NavigationBuilding.Tab(ref GradeTab, "category", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.UserRole, "TPA");
            }
        }
    }
}