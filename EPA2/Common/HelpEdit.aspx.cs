using System;
using System.Web.UI;
namespace EPA2.Common
{
    public partial class HelpEdit : System.Web.UI.Page
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
            hfArea.Value = Page.Request.QueryString["aID"];
            hfCode.Value = Page.Request.QueryString["iCode"];
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfRunningModel.Value = WebConfig.RunningModel();

        }
    }
}