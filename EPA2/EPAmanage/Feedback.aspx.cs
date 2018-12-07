using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // LabelName.Text = Page.Request.QueryString["tName"];
                setPageAttribution();
                GetFeedUserInforamtion();
            }
        }
        private void setPageAttribution()
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
            TextSection.Text = Menus.ItemNamebyCode("", User.Identity.Name, WorkingProfile.PageCategory, WorkingProfile.PageArea);
            TextPage.Text =  Menus.ItemNamebyCode("",User.Identity.Name, WorkingProfile.PageCategory,WorkingProfile.PageArea,WorkingProfile.PageItem);
            TextRole.Text = WorkingProfile.UserRole;
            TextName.Text = WorkingProfile.UserName;
            TextTopic.Text = "Page Layout / functions / message ";
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {   string eMailTo = eMailNotification.FeedBackeMail("Get",User.Identity.Name,"FeedBack");
            string eMailCC = "";
            string eMailBcc = "";
            string eMailForm = eMailNotification.FeedBackeMail("Get", User.Identity.Name, "OperateUser");
            string eMailSubject =  TextTopic.Text;
            string eMailBody =     myText.Text;
            string eMailFormat = "HTML";
            string purpose = DropDownListPurpose.SelectedValue;
            FeedBack.Content("Save", User.Identity.Name, WorkingProfile.PageCategory, WorkingProfile.PageArea, WorkingProfile.PageItem, WorkingProfile.UserRole, WorkingProfile.SchoolYear, eMailSubject, eMailBody, purpose);
            string result =  eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc,eMailForm, eMailSubject, eMailBody, eMailFormat);
            showMessage(result, "Send Feedback");

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string eMailTo = TextName.Text;
            if (eMailTo == "")
            {
                TextName.Text = eMailNotification.FeedBackeMail("Add", User.Identity.Name, "FeedBack");
            }
            else
            {
            string result =  eMailNotification.FeedBackeMail("Add", User.Identity.Name, "FeedBack", eMailTo);
            showMessage(result, "Add Feedback to User");
            }
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

     
    }
}