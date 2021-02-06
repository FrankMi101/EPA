using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Text;
using BLL;
using ClassLibrary;

namespace EPA2
{
    public class GetNoticeFile : BaseData
    {

        public static string FileContentByType(string noticeType)
        {
            string bodyFile = "";
            string bodyContent = "";
            string fileName = GetHtmlFileName(noticeType);
            bodyFile = HttpContext.Current.Server.MapPath("..") + fileName;
            try
            {
                if (File.Exists(HttpContext.Current.Server.MapPath(fileName)))
                {
                    bodyContent = File.ReadAllText(bodyFile, Encoding.UTF8);
                }
            }

            catch
            {

            }
            return bodyContent;
        }
        private static string GetHtmlFileName(string noticeType)
        {
            string fileName = "";
            try
            {
                switch (noticeType)
                {
                    case "ALP":
                        fileName = "\\Template\\NoticeALP.htm";
                        break;
                    case "OBS":
                        fileName = "\\Template\\NoticeALP.htm";
                        break;
                    case "EPA":
                        fileName = "\\Template\\HtmlPage.html";
                        break;
                    default:
                        fileName = "\\Template\\NoticeALP.htm";
                        break;
                }
            }
            catch { }

            return fileName;
        }

        public static string EMailContentAppCategory(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
            return eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose);
        }
        public static string EMailContentByType(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
            return eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose);
        }
        public static string EMailContentByType(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string noticdePurpose)
        {
            return eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, noticdePurpose);
        }
        public static string EMailContentByType(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string subject, string template)
        {
            return eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, subject, template);
        }
        public static string EMailContentByTemplate(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose);
        }
        public static string EMailContentByTemplate(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType)
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, templateType);
        }
        public static string EMailContentByTemplate(string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType, string subject, string template, string autoNotice)
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, templateType, subject, template, autoNotice);
        }
        public static string GetEmailBodyInfo(string contentType,  string noticeAction, string signOffDate,string permission, EmailNoticePara apprBase)
        {
            try
            {
                string category = apprBase.Category;
                string noticeArea = apprBase.NoticeArea;
                string userID = apprBase.UserID;
                string noticeRole = apprBase.NoticeRole;
                string noticeType = "SignOff";
                if (noticeAction == "Undo Sign Off")
                {
                    noticeType = "UndoSignOff";
                }
                if (noticeAction == "Demand Undo Sign Off")
                {
                    noticeType = "DemandUndoSignOff";
                }
                if (noticeAction == "Authorize Undo Sign Off")
                {
                    noticeType = "AuthorizeUndoSignOff";
                }

                // string permission = Page.Request.QueryString["permission"];
             
                string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
                if (signOffDate == "")
                {
                    signOffDate = noticeDate;
                }

                string purpose = "Notice";
                string noticeGo = "Appraisee";
                string noticeFrom = "Appraiser";
                if (noticeRole == "Appraisee")
                {
                    noticeGo = "Appraiser";
                    noticeFrom = "Appraisee";
                }
                string templateArea = apprBase.NoticeArea;
                string templateAction = noticeType;
                if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
                {
                    templateAction = "SignOff";
                    //   templateArea = (category == "PPA") ? "PPA" : "EPA";
                }
                string cBody = EMailContentByType(contentType, userID, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);

                if (contentType == "GetSubject" || contentType == "GetSubjectHR")
                {
                    cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", EMailContentAppCategory("AppAreaTitle", userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                }
                else
                {
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalSession}}", WorkingAppraisee.SessionID);
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", EMailContentAppCategory("AppCategory", userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                    cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
                    cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
                    cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", signOffDate);
                    cBody = cBody.Replace("{{PlaceHolder:ActionDate}}", signOffDate);
                    cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
                    cBody = cBody.Replace("{{PlaceHolder:ReviewSignOff}}", permission);
                    cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", EMailContentAppCategory("AppAreaTitle", userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                    if (noticeRole == "Appraisee")
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
                    if (WebConfig.getValuebyKey("eMailTry") == "Test")
                    {
                        //string eMailTo = MailNotification.NotificationeMail("Get", userID, apprBase.SchoolYear, apprBase.SchoolCode, apprBase.EmployeeID,apprBase.SessionID, "NoticeUser", noticeArea);
                        //string eMailCc = MailNotification.NotificationeMail("Get", userID, apprBase.SchoolYear, apprBase.SchoolCode, apprBase.EmployeeID, apprBase.SessionID, "CCUser", noticeArea);
                        string eMailTo = MailNotification.NotificationeMailUser(  "NoticeUser", apprBase);
                        string eMailCc = MailNotification.NotificationeMailUser("CCUser", apprBase);
 
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCc);
                    }
                    else
                    {
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
                    }
                }
                string appPara = "GoPage=SignOff&UserID=" + apprBase.ToUserID + "&type=" + apprBase.Category + "&Area=" + apprBase.NoticeArea + "&Action=" + noticeAction + "&NoticeType=" + noticeType + "&yID=" + apprBase.SchoolYear + "&cID=" + apprBase.SchoolCode + "&sID=" + apprBase.SessionID + "&tID=" + apprBase.EmployeeID + "&phase=" + apprBase.Phase + "&tName=" + apprBase.AppraiseeName ;
                string encryptionPara = GetMySymetricEncryption.GetMyEncryptedValue(appPara);
                string appSiteLink = WebConfig.getValuebyKey("AppSiteLink") + "?appPara=" + encryptionPara;

                cBody = cBody.Replace("{{PlaceHolder:AppSiteLink}}", appSiteLink);

                return cBody;
            }
            catch
            {
                return "";
            }

        }
        public static string GetTitle(string action)
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
    }
}
