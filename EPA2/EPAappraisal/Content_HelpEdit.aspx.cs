using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
namespace EPA2.EPAappraisal
{
    public partial class ContentHelpEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
            }
        }
        private void SetPageAttribution()
        {

            hfSelectedTab.Value = "Help";
            hfCategory.Value = Page.Request.QueryString["type"];
            hfCode.Value = Page.Request.QueryString["iCode"];
            hfArea.Value = Page.Request.QueryString["aID"];
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfRunningModel.Value = WebConfig.RunningModel();


        }
    }
}