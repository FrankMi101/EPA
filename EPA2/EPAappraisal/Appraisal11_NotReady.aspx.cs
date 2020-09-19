using System;
using System.Web.UI;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11NotReady : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                SetPageAttribution();
                AssemblingPageTitle();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "NotReady";
            hfArea.Value = "NAP";
            hfCode.Value = "NAP12";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }
    }
}