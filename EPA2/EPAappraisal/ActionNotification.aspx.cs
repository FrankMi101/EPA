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
    public partial class ActionNotification : System.Web.UI.Page
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
            hfPageID.Value = "Notice";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

            string actionRole = Page.Request.QueryString["aRole"];
            string action = Page.Request.QueryString["action"];
            string categoryID = Page.Request.QueryString["category"];
            string areaID = Page.Request.QueryString["areaID"];
            string itemCode = Page.Request.QueryString["itemCode"];

            hfCategory.Value = categoryID;
            hfApprYear.Value = WorkingAppraisee.AppraisalYear;
            hfApprSchool.Value = WorkingAppraisee.AppraisalSchoolCode;
            hfApprEmployeeID.Value = WorkingAppraisee.EmployeeID;

            hfApprSession.Value = WorkingAppraisee.SessionID;
            hfApprName.Value = WorkingAppraisee.AppraiseeName;
            GetNoticeForUserInforamtion(actionRole,action, categoryID, areaID);

    
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
        private void GetNoticeForUserInforamtion(string actionRole,string action, string categoryID, string areaID)
        {
          
            TextAppraisalYear.Text = WorkingAppraisee.AppraisalYear;
            TextAppraisalSession.Text = WorkingAppraisee.AppraisalWorkingSession;
            LabelNoticeType.Text =   AppraisalProcess.AppraisalAreaTitle("Get", User.Identity.Name, categoryID, areaID) + " " + getTitle(action);
            TextSubject.Text = getDefaultSubjectbyNoticeType();
          myText.Text = getBodyByType();

        }
        
        private string getDefaultSubjectbyNoticeType()
        {
            string category = hfCategory.Value;
            string actionRole = Page.Request.QueryString["aRole"];
            string noticeType = Page.Request.QueryString["action"];
            string noticeArea = Page.Request.QueryString["areaID"];
              string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
          if (actionRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string templateArea = noticeArea;
            string templateAction = noticeType;
            if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
            {
                templateAction = "SignOff";
                templateArea = (category == "PPA") ? "PPA" : "EPA";
            }

            string subject = GetNoticeFile.eMailContentByType("GetSubject", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);
            subject = subject.Replace("{{PlaceHolder:SignOffAction}}", getTitle(noticeType));
            subject = subject.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.eMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));

            return subject;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string noticeType = Page.Request.QueryString["action"];
            string noticeArea = Page.Request.QueryString["areaID"];
            string actionRole = Page.Request.QueryString["aRole"];
            string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser",noticeArea);
            string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);
            string eMailBcc = "";
            string eMailForm = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "OperateUser", noticeArea);
            string eMailSubject = TextSubject.Text;
            string eMailBody = getEmailBody(); //  myText.Text;
            string eMailFormat = "HTML";
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            eMailNotification.NotificationeMail(actionRole, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea,noticeDate,  noticeDate, eMailSubject, eMailBody);
            string result = "";
            
                result = eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat);
                
            showMessage(result, "Send Email Notification");

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

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {

        }
        private string getBodyByType()
        {
            string actionRole = Page.Request.QueryString["aRole"];
            string noticeType = Page.Request.QueryString["action"];
            string noticeArea = Page.Request.QueryString["areaID"];
            string permission = Page.Request.QueryString["permission"];  
            string signOffDate = Page.Request.QueryString["signOffDate"] ;
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            if (signOffDate == "")
            { signOffDate = noticeDate; }
            string category = hfCategory.Value;
            string purpose = "Notice";
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            if (actionRole == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string templateArea = noticeArea;
            string templateAction = noticeType;
            if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
            {
                templateAction = "SignOff";
                templateArea = (category == "PPA") ? "PPA":"EPA";
            }
            string cBody = GetNoticeFile.eMailContentByType("GetBody", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);

            cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
            cBody = cBody.Replace("{{PlaceHolder:AppraisalSession}}", WorkingAppraisee.SessionID);
            cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", GetNoticeFile.eMailContentAppCategory("AppCategory", User.Identity.Name, category, noticeType,noticeArea, noticeGo, noticeFrom, purpose));
            cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
            cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
            cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", signOffDate);
            cBody = cBody.Replace("{{PlaceHolder:ActionDate}}", signOffDate);
            cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
            cBody = cBody.Replace("{{PlaceHolder:ReviewSignOff}}", permission);
            cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", getTitle(noticeType));
            cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.eMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));


            if (actionRole == "Appraisee")
            {
                cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiserName);
                cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiseeName);
                cBody = cBody.Replace("{{PlaceHolder:Whom}}", "my");
            }
            else
            {
                cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiseeName);
                cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiserName);
                cBody = cBody.Replace("{{PlaceHolder:Whom}}", "your");
            }
            // cBody = cBody.Replace("{{PlaceHolderDeadLineDate}}", dateDeadline.Value);
            //  cBody = cBody.Replace("{{PlaceHolderWebSite}}", applicationWebSite);
            // cBody = cBody.Replace("{{PlaceHolderAdditionInformation}}", myText.Text);


            if (WebConfig.getValuebyKey("eMailTry") == "Test")
            {
                string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser",noticeArea);
                string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);

                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCC);
            }
            else
            {
                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
            }
            return cBody;
        }

    
    }
}