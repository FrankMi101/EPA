using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAsystem
{
    public partial class EmailTemplateEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
              
                setPageAttribution();
                GetNoticeForUserInforamtion();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Feedback";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            myList.SetLists(ddlNoticeType, "EmailTemplate", User.Identity.Name);
            myList.SetLists(ddlArea, "AppraisalAreaAll", User.Identity.Name);
            ddlNoticeType.SelectedIndex = 1;
            ddlArea.SelectedIndex = 1;
            ddlTo.SelectedIndex = 0;
            ddlFrom.SelectedIndex = 0;
           

            if (hfRunningModel.Value == "Design")
            { myPurpose.Enabled = true; }

        }
        private void GetNoticeForUserInforamtion()
        {                                                 
            myText.Text = getDefaultInfo("GetTemplate");
            TextSubject.Text = getDefaultInfo("GetSubject");
            myPurpose.Text = getDefaultInfo("GetPurpose");
        }
        private string getDefaultInfo(string contentType)
        {
            string category = hfCategory.Value;
            string noticeType = ddlNoticeType.SelectedValue;
            string noticeArea = ddlArea.SelectedValue;
            string noticeGo =  ddlTo.SelectedValue;
            string noticeFrom =ddlFrom.SelectedValue;
            string purpose =  ddlPurpose.SelectedValue;
            string content = GetNoticeFile.eMailContentByType(contentType, User.Identity.Name, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose);

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
        private void showMessage(string result, string action)
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
            string result = GetNoticeFile.eMailContentByType("Save", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, subject, body);
            showMessage(result, "Template Save");
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
            string result = GetNoticeFile.eMailContentByType("SavePurpose", User.Identity.Name, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose, noticePurpose);
            showMessage(result, "Template Purpose Save");
        }
    }
}