using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
namespace EPA2.EPAappraisal
{
    public partial class Content_Snippet : System.Web.UI.Page
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

             
            hfCategory.Value = Page.Request.QueryString["type"];
            hfCode.Value = Page.Request.QueryString["iCode"];
            hfArea.Value = Page.Request.QueryString["aID"];
            hfDomainID.Value = Page.Request.QueryString["domainID"];
            hfCompetencyID.Value = Page.Request.QueryString["competencyID"]; 

            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfRunningModel.Value = WebConfig.RunningModel();


        }
    }
}