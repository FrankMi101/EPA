
using ClassLibrary;
using System;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
    public partial class ActionNotification : System.Web.UI.Page
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
            hfPageID.Value = "Notice";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

            string actionRole = Page.Request.QueryString["aRole"];
            string action = Page.Request.QueryString["action"];
            string categoryId = Page.Request.QueryString["category"];
            string areaId = Page.Request.QueryString["areaID"];
            string itemCode = Page.Request.QueryString["itemCode"];

            hfCategory.Value = categoryId;
            hfApprYear.Value = WorkingAppraisee.AppraisalYear;
            hfApprSchool.Value = WorkingAppraisee.AppraisalSchoolCode;
            hfApprEmployeeID.Value = WorkingAppraisee.EmployeeID;

            hfApprSession.Value = WorkingAppraisee.SessionID;
            hfApprName.Value = WorkingAppraisee.AppraiseeName;
            GetNoticeForUserInforamtion(actionRole, action, categoryId, areaId);


        }
        //private string GetTitle(string action)
        //{
        //    string rVal = "";
        //    switch (action)
        //    {
        //        case "SignOff":
        //            rVal = "Sign Off ";
        //            break;
        //        case "UndoSignOff":
        //            rVal = "Undo Sign Off";
        //            break;
        //        case "DemandUndoSignOff":
        //            rVal = "Demand Undo Sign Off";
        //            break;
        //        case "AuthorizeUndoSignOff":
        //            rVal = "Authorize Undo Sign Off";
        //            break;
        //        case "AppraisalAction":
        //            rVal = "Review Permission";
        //            break;
        //        case "AppraisalStart":
        //            rVal = "Appraisal Start Notification";
        //            break;
        //        default:
        //            rVal = "Sign Off ";
        //            break;
        //    }
        //    return rVal;
        //}
        private void GetNoticeForUserInforamtion(string actionRole, string action, string categoryId, string areaId)
        {

            TextAppraisalYear.Text = WorkingAppraisee.AppraisalYear;
            TextAppraisalSession.Text = WorkingAppraisee.AppraisalWorkingSession;
            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                Category = categoryId,
                Area = areaId
            };
            LabelNoticeType.Text = AppraisalProcess.AppraisalAreaTitle(parameter) + " " + GetNoticeFile.GetTitle(action);

            string noticeType = Page.Request.QueryString["action"];
            var apprBase = new EmailNoticePara()
            {
                Operate = Page.Request.QueryString["action"],
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = categoryId,
                NoticeRole = actionRole,
                NoticeType = noticeType,
                NoticeArea = areaId, 
            };
            string signOffDate = Page.Request.QueryString["signOffDate"];
            string permission = Page.Request.QueryString["permission"];
            string subject = GetNoticeFile.GetEmailBodyInfo("GetSubject", noticeType, signOffDate, permission, apprBase);
            string cBody = GetNoticeFile.GetEmailBodyInfo("GetBody", noticeType, signOffDate, permission, apprBase);

            TextSubject.Text = subject;//  GetDefaultSubjectbyNoticeType();
            myText.Text = cBody; // GetBodyByType();



        }

        //private string GetDefaultSubjectbyNoticeType()
        //{
        //    string category = hfCategory.Value;
        //    string actionRole = Page.Request.QueryString["aRole"];
        //    string noticeType = Page.Request.QueryString["action"];
        //    string noticeArea = Page.Request.QueryString["areaID"];
        //    string noticeGo = "Appraisee";
        //    string noticeFrom = "Appraiser";
        //    string purpose = "Notice";
        //    if (actionRole == "Appraisee")
        //    {
        //        noticeGo = "Appraiser";
        //        noticeFrom = "Appraisee";
        //    }
        //    string templateArea = noticeArea;
        //    string templateAction = noticeType;
        //    if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
        //    {
        //        templateAction = "SignOff";
        //        templateArea = (category == "PPA") ? "PPA" : "EPA";
        //    }

        //    string subject = GetNoticeFile.EMailContentByType("GetSubject", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);
        //    subject = subject.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
        //    subject = subject.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.EMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));

        //    return subject;
        //}

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string noticeType = Page.Request.QueryString["action"];
            string noticeArea = Page.Request.QueryString["areaID"];
            string actionRole = Page.Request.QueryString["aRole"];

            var parameter = new EmailNoticePara()
            {
                Operate = actionRole,
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                NoticeType = noticeType,
                NoticeArea = noticeArea,
                NoticeDate = DateTime.Now.ToString("yyyy/MM/dd"),
                DeadLineDate = DateTime.Now.ToString("yyyy/MM/dd"),
                NoticeSubject = TextSubject.Text,
                Comments = ""
            };
            string result = MailNotification.NotificationeMailSave(parameter);// (actionRole, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea,noticeDate,  noticeDate, eMailSubject, eMailBody);


            var emailPara = new EmailNotice()
            {
                EmailTo = MailNotification.NotificationeMailUser("NoticeUser", parameter),
                EmailCC = MailNotification.NotificationeMailUser("CCUser", parameter),
                EmailFrom = MailNotification.NotificationeMailUser("OperateUser", parameter),
                EmailBcc = "",
                EmailSubject = TextSubject.Text,
                EmailBody = myText.Text, // GetEmailBody(),
                EmailFormat = "HTML"
            };

            result = MailNotification.SendMail(emailPara);

            ShowMessage(result, "Send Email Notification");

        }

        private string GetEmailBody()
        {
            string htmlfile = GetNoticeFile.FileContentByType("EPA");
            htmlfile = htmlfile.Replace("{{HTMLeMailBodyPlaceHolder}}", myText.Text);
            return htmlfile;
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


        //private string GetBodyByType()
        //{
        //    string actionRole = Page.Request.QueryString["aRole"];
        //    string noticeType = Page.Request.QueryString["action"];
        //    string noticeArea = Page.Request.QueryString["areaID"];
        //    string permission = Page.Request.QueryString["permission"];
        //    string signOffDate = Page.Request.QueryString["signOffDate"];
        //    string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
        //    if (signOffDate == "")
        //    { signOffDate = noticeDate; }
        //    string category = hfCategory.Value;
        //    string purpose = "Notice";
        //    string noticeGo = "Appraisee";
        //    string noticeFrom = "Appraiser";
        //    if (actionRole == "Appraisee")
        //    {
        //        noticeGo = "Appraiser";
        //        noticeFrom = "Appraisee";
        //    }
        //    string templateArea = noticeArea;
        //    string templateAction = noticeType;
        //    if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
        //    {
        //        templateAction = "SignOff";
        //        templateArea = (category == "PPA") ? "PPA" : "EPA";
        //    }
        //    string cBody = GetNoticeFile.EMailContentByType("GetBody", User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);
        //    cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
        //    cBody = cBody.Replace("{{PlaceHolder:AppraisalSession}}", WorkingAppraisee.SessionID);
        //    cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", GetNoticeFile.EMailContentAppCategory("AppCategory", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
        //    cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
        //    cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
        //    cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", signOffDate);
        //    cBody = cBody.Replace("{{PlaceHolder:ActionDate}}", signOffDate);
        //    cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
        //    cBody = cBody.Replace("{{PlaceHolder:ReviewSignOff}}", permission);
        //    cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
        //    cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.EMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));


        //    if (actionRole == "Appraisee")
        //    {
        //        cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiserName);
        //        cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiseeName);
        //        cBody = cBody.Replace("{{PlaceHolder:Whom}}", "my");
        //    }
        //    else
        //    {
        //        cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiseeName);
        //        cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiserName);
        //        cBody = cBody.Replace("{{PlaceHolder:Whom}}", "your");
        //    }
        //    // cBody = cBody.Replace("{{PlaceHolderDeadLineDate}}", dateDeadline.Value);
        //    //  cBody = cBody.Replace("{{PlaceHolderWebSite}}", applicationWebSite);
        //    // cBody = cBody.Replace("{{PlaceHolderAdditionInformation}}", myText.Text);


        //    if (WebConfig.getValuebyKey("eMailTry") == "Test")
        //    {
        //        string eMailTo = MailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
        //        string eMailCc = MailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);

        //        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
        //        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCc);
        //    }
        //    else
        //    {
        //        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
        //        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
        //    }
        //    return cBody;
        //}


    }
}