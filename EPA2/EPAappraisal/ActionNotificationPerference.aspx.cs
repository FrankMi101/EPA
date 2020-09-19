using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class ActionNotificationPerference : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
            }
        }
        private void SetPageAttribution()
        {
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

            hfCategory.Value = Page.Request.QueryString["category"];
            hfArea.Value = Page.Request.QueryString["areaID"];
            hfActionRole.Value = Page.Request.QueryString["aRole"];
            hfAction.Value = Page.Request.QueryString["action"];
            hfNoticeType.Value = Page.Request.QueryString["itemCode"];
            if (hfNoticeType.Value == "Personal")
            { RadioButtonList1.SelectedIndex = 1; }

            hfApprName.Value = WorkingAppraisee.AppraiseeName;
            //RadioButtonList1.SelectedIndex = 0;
            //CheckNoticePersonalSetup();


            GetDefaultSubjectAndBody();
            EnableSaveButton();


        }
        private void CheckNoticePersonalSetup()
        {
            string category = hfCategory.Value;
            string templateArea = hfArea.Value;
            string noticeGo = hfActionRole.Value == "Appraisee" ? "Appraiser" : "Appraisee";
            string noticeFrom = hfActionRole.Value;
            string purpose = "Notice";

            string templateAction = hfNoticeType.Value;
            string autoNotice = GetNoticeFile.EMailContentByTemplate("AutoNotice", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);
            //if (autoNotice == "Yes")
            //{
            //    chbAuto.Checked = true;
            //}
            //string templateType = GetNoticeFile.EMailContentByTemplate("TemplateType", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);


        }
        private string GetTitle(string action)
        {
            string rVal = "";
            switch (action)
            {
                case "SignOff":
                    rVal = "Sign Off ";
                    break;
                case "UndoSignOff":
                    rVal = "Undo Sign Off";
                    break;
                case "DemandUndoSignOff":
                    rVal = "Demand Undo Sign Off";
                    break;
                case "AuthorizeUndoSignOff":
                    rVal = "Authorize Undo Sign Off";
                    break;
                case "AppraisalAction":
                    rVal = "Review Permission";
                    break;
                case "AppraisalStart":
                    rVal = "Appraisal Start Notification";
                    break;
                default:
                    rVal = "Sign Off ";
                    break;
            }
            return rVal;
        }


        private void GetDefaultSubjectAndBody()
        {

            var parameter = new SignOffAutoNotice
            {
                Operate = RadioButtonList1.SelectedValue,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ActionRole = hfActionRole.Value,
                Action = hfAction.Value

            };
            SignOffAutoNotice template = BaseData.GeneralList<SignOffAutoNotice>("AppraisalSignOff", "AutoNoticeTemplateEdit", parameter)[0];
            TextSubject.Text = template.Subject;
            myText.Text = template.Body;
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


        private void EnableSaveButton()
        {
            btnSave.Enabled = false;
            if (RadioButtonList1.SelectedValue == "System")
            {
                if (WorkingProfile.UserRoleLogin == "Admin") btnSave.Enabled = true;
            }
            else
            {
                btnSave.Enabled = true;
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetDefaultSubjectAndBody();
            EnableSaveButton();

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {

            var parameter = new SignOffAutoNotice
            {
                Operate = RadioButtonList1.SelectedValue,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Action = hfAction.Value,
                ActionRole = hfActionRole.Value,
                Subject = TextSubject.Text,
                Body = myText.Text

            };

            var result = BaseData.GeneralValue<string>("AppraisalSignOff", "AutoNoticeTemplateEditSave", parameter);
            ShowMessage(result, "Save");
        }
    }
}