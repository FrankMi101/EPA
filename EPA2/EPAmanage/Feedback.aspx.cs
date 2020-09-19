

using ClassLibrary;
using System;
using System.Web.UI;

namespace EPA2.EPAmanage
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // LabelName.Text = Page.Request.QueryString["tName"];
                SetPageAttribution();
                GetFeedUserInforamtion();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Feedback";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            if (WorkingProfile.UserRoleLogin == "Admin")
            { btnSave.Visible = true; }
        }
        private void GetFeedUserInforamtion()
        {
            TextSection.Text = AppraisalPage.ItemNamebyCode("", User.Identity.Name, WorkingProfile.PageCategory, WorkingProfile.PageArea);
            TextPage.Text = AppraisalPage.ItemNamebyCode("", User.Identity.Name, WorkingProfile.PageCategory, WorkingProfile.PageArea, WorkingProfile.PageItem);
            TextRole.Text = WorkingProfile.UserRole;
            TextName.Text = WorkingProfile.UserName;
            TextTopic.Text = "Page Layout / functions / message ";
        }
        protected void BtnSend_Click(object sender, EventArgs e)
        {

            try
            {
                string purpose = DropDownListPurpose.SelectedValue;
                string result1 = AppraisalProcess.FeedBackContent("Save", User.Identity.Name, WorkingProfile.PageCategory, WorkingProfile.PageArea, WorkingProfile.PageItem, WorkingProfile.UserRole, WorkingProfile.SchoolYear, this.TextTopic.Text, this.myText.Text , purpose);


                var emailPara = new EmailNotice()
                {
                    EmailTo = MailNotification.FeedBackeMail("Get", User.Identity.Name, "FeedBack"),
                    EmailCC = "",
                    EmailFrom = MailNotification.FeedBackeMail("Get", User.Identity.Name, "OperateUser"),
                    EmailBcc = "",
                    EmailSubject = TextTopic.Text,
                    EmailBody = myText.Text,
                    EmailFormat = "HTML"
                };

               string  result = MailNotification.SendMail(emailPara);
                ShowMessage(result, "Send Feedback");

            }
            catch (Exception)
            {

                ShowMessage("Failed", "Send Feedback");
            }

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string eMailTo = TextName.Text;
            if (eMailTo == "")
            {
                TextName.Text = MailNotification.FeedBackeMail("Add", User.Identity.Name, "FeedBack");
            }
            else
            {
                string result = MailNotification.FeedBackeMail("Add", User.Identity.Name, "FeedBack", eMailTo);
                ShowMessage(result, "Add Feedback to User");
            }
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


    }
}