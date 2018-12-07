using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.IO;
using System.Net.Mail;
using System.Globalization;
using System.Text;
//using System.IO;
//using System.Text;
namespace EPA2.EPAappraisal
{
    public partial class ActionNotificationPerference : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {            
                setPageAttribution();
            }
        }
        private void setPageAttribution()
        {
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel(); 

            hfCategory.Value =  WorkingAppraisee.AppraisalCategory;
            hfApprYear.Value = WorkingAppraisee.AppraisalYear;
            hfApprSchool.Value = WorkingAppraisee.AppraisalSchoolCode;
            hfApprEmployeeID.Value = WorkingAppraisee.EmployeeID;

            hfApprSession.Value = WorkingAppraisee.SessionID;
            hfApprName.Value = WorkingAppraisee.AppraiseeName;
            RadioButtonList1.SelectedIndex = 0;
            checkNoticePersonalSetup();
            GetNoticeForUserInforamtion();

    
        }
        private void checkNoticePersonalSetup()
        {
            string category = hfCategory.Value;
             string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
            if (WorkingProfile.UserAppraisalRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string templateArea = WorkingAppraisee.AppraisalArea;
            string templateAction = "SignOff";

            templateArea = (category == "PPA") ? "PPA" : "EPA";
            string autoNotice  = GetNoticeFile.eMailContentByTemplate("AutoNotice", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose );
            if (autoNotice == "Yes")
            {
                chbAuto.Checked = true;
            }
            string templateType = GetNoticeFile.eMailContentByTemplate("TemplateType", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);
            if (templateType == "Personal")
            { RadioButtonList1.SelectedIndex = 1; }

        }
        private string getTitle(string action )
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
            return   rVal; 
        }
        private void GetNoticeForUserInforamtion( )
        {
            string templateType = RadioButtonList1.SelectedValue;
            LabelNoticeType.Text =   AppraisalProcess.AppraisalAreaTitle("Get", User.Identity.Name, "EPA", WorkingAppraisee.AppraisalArea) + " " + getTitle("Signature");
            TextSubject.Text = getDefaultSubjectbyNoticeType();
             myText.Text = getBodyByType();

        }
        
        private string getDefaultSubjectbyNoticeType()
        {
            string category = hfCategory.Value;
            string templateType = RadioButtonList1.SelectedValue;
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
          if (WorkingProfile.UserAppraisalRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string templateArea = WorkingAppraisee.AppraisalArea;
            string templateAction = "SignOff";

            templateArea = (category == "PPA") ? "PPA" : "EPA";
      
            string subject = GetNoticeFile.eMailContentByTemplate("GetSubject", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose, templateType);
             return subject;
        }
 
        private string getEmailBody()
        {
            string htmlfile = GetNoticeFile.FileContentByType("EPA");
            htmlfile = htmlfile.Replace("{{HTMLeMailBodyPlaceHolder}}", myText.Text);
            return htmlfile;
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

      
        private string getBodyByType()
        {
            string templateType = RadioButtonList1.SelectedValue;
            string category = hfCategory.Value;
            string purpose = "Notice";
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            if (WorkingProfile.UserAppraisalRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string templateArea = WorkingAppraisee.AppraisalArea;
            string templateAction = "SignOff";
            templateArea = (category == "PPA") ? "PPA":"EPA";
            string cBody = GetNoticeFile.eMailContentByTemplate("GetBody", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose, templateType);
 
            return cBody;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetNoticeForUserInforamtion();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string autoNotice = (chbAuto.Checked) ? "Yes":"No";
            string templateType = RadioButtonList1.SelectedValue;
            string templateArea = WorkingAppraisee.AppraisalArea;
            string templateAction = "SignOff";
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
            string subject = TextSubject.Text;
            string template = myText.Text;
            if (WorkingProfile.UserAppraisalRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            templateArea = (category == "PPA") ? "PPA" : "EPA";
            GetNoticeFile.eMailContentByTemplate("SaveTemplate", User.Identity.Name, category,templateAction, templateArea, noticeGo, noticeFrom, purpose, templateType,subject,template,autoNotice);
        }
    }
}