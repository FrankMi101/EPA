using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace EPA2.EPAsystem
{
    public partial class EmailTemplateEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
              
                SetPageAttribution();
                GetNoticeForUserInforamtion();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Feedback";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            AppraisalPage.BuildingListControl(ddlNoticeType, "EmailTemplate", User.Identity.Name);
            AppraisalPage.BuildingListControl(ddlArea, "AppraisalAreaAll", User.Identity.Name);
            ddlNoticeType.SelectedIndex = 1;
            ddlArea.SelectedIndex = 1;
            ddlTo.SelectedIndex = 0;
            ddlFrom.SelectedIndex = 0;
           

            if (hfRunningModel.Value == "Design")
            { myPurpose.Enabled = true; }

        }
        private void GetNoticeForUserInforamtion()
        {                                                 
            myText.Text = GetDefaultInfo("GetTemplate");
            TextSubject.Text = GetDefaultInfo("GetSubject");
            myPurpose.Text = GetDefaultInfo("GetPurpose");
        }
        private string GetDefaultInfo(string contentType)
        {
            string category = hfCategory.Value;
            string noticeType = ddlNoticeType.SelectedValue;
            string noticeArea = ddlArea.SelectedValue;
            string noticeGo =  ddlTo.SelectedValue;
            string noticeFrom =ddlFrom.SelectedValue;
            string purpose =  ddlPurpose.SelectedValue;
            string content = GetNoticeFile.EMailContentByType(contentType, User.Identity.Name, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose);

            return content;
        }
        protected void ddlNoticeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetNoticeForUserInforamtion();
        }
        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetNoticeForUserInforamtion();
        }
        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            GetNoticeForUserInforamtion();
        }
        private void ShowMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
            }
            catch { }

        }
       
      
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string noticeType = ddlNoticeType.SelectedValue;
            string noticeArea = ddlArea.SelectedValue;
            string noticeGo = ddlTo.SelectedValue;
            string noticeFrom = ddlFrom.SelectedValue;
            string purpose = ddlPurpose.SelectedValue;
            string subject = TextSubject.Text;
            string body = HttpContext.Current.Server.HtmlDecode(myText.Text);
            string result = GetNoticeFile.EMailContentByType("Save", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, subject, body);
            ShowMessage(result, "Template Save");
        }

        protected void myPurpose_TextChanged(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string noticeType = ddlNoticeType.SelectedValue;
            string noticeArea = ddlArea.SelectedValue;
            string noticeGo = ddlTo.SelectedValue;
            string noticeFrom = ddlFrom.SelectedValue;
            string purpose = ddlPurpose.SelectedValue;
            string noticePurpose = myPurpose.Text;
            string result = GetNoticeFile.EMailContentByType("SavePurpose", User.Identity.Name, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose, noticePurpose);
            ShowMessage(result, "Template Purpose Save");
        }
    }
}