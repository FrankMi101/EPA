using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Web.Configuration;

namespace DataAccess
{
    public class eMailNotification
    {
        public eMailNotification()
        { }
        public static string SendeMail(string eMailTo, string eMailCC, string eMailBcc, string eMailForm, string eMailSubject, string eMailBody, string eMailFormat, System.Net.Mail.Attachment iCal)
        {
            try
            {
                if (WebConfig.eMailGo() == "Test")
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCC);
                    eMailTo = eMailForm;
                    eMailCC = "frank_ml@hotmail.com";
                    eMailBcc = "";
                }
                else
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
                }

                if (eMailFormat == "HTML")
                {

                    //  string pageHeader = "<!DOCTYPE> <html xmlns='http://www.w3.org/1999/xhtml'> < head > < style > body {width: 800px;} </ style > </ head > < body > < div > ";
                   // string pageHeader = "< !DOCTYPE html >  < html >  < head >  < title ></ title >    </ head >   < body > <div> ";
                   // string pageFooter = "</ div> </ body > </ html > ";

                    string appUrl = " <a href=' " + WebConfig.getValuebyKey("ApplicationSite") + "' target='_blank'>  Teacher Performance Appraisal </a>";
                    eMailBody = eMailBody.Replace("{{PlaceHolder:WebSite}}", appUrl);
                    eMailBody = eMailBody.Replace("{{PlaceHolder:OneLine}}", "<br />");
                    //   eMailBody = pageHeader +  eMailBody + pageFooter;
                }
                else
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:WebSite}}", WebConfig.getValuebyKey("ApplicationSite"));
                    eMailBody = eMailBody.Replace("{{PlaceHolder:OneLine}}", "");
                }



                //   NotificationeMail("Save", userID, schoolyear, schoolcode, employeeID, noticeType, noticeDate, deadlineDate, deadlineDate, eMailSubject, eMailBody);
                string result = AssemblingeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat,iCal);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        public static string SendeMail(string eMailTo, string eMailCC, string eMailBcc, string eMailForm, string eMailSubject, string eMailBody, string eMailFormat)
        {
            try
            {
                if (WebConfig.eMailGo() == "Test")
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCC);
                    eMailTo = eMailForm;
                    eMailCC = "frank_ml@hotmail.com";
                    eMailBcc = "";
                }
                else
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                    eMailBody = eMailBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
                }

                if (eMailFormat == "HTML")
                {
                 
                    //  string pageHeader = "<!DOCTYPE> <html xmlns='http://www.w3.org/1999/xhtml'> < head > < style > body {width: 800px;} </ style > </ head > < body > < div > ";
                    string pageHeader = "< !DOCTYPE html >  < html >  < head >  < title ></ title >    </ head >   < body > <div> ";
                    string pageFooter = "</ div> </ body > </ html > ";

                    string appUrl = " <a href=' " + WebConfig.getValuebyKey("ApplicationSite") + "' target='_blank'>  Teacher Performance Appraisal </a>";
                    eMailBody =  eMailBody.Replace("{{PlaceHolder:WebSite}}", appUrl) ;
                    eMailBody = eMailBody.Replace("{{PlaceHolder:OneLine}}", "<br />");
                    eMailBody = pageHeader +  eMailBody + pageFooter;
                }
                else
                {
                    eMailBody = eMailBody.Replace("{{PlaceHolder:WebSite}}", WebConfig.getValuebyKey("ApplicationSite"));
                    eMailBody = eMailBody.Replace("{{PlaceHolder:OneLine}}", "");
                }



                //   NotificationeMail("Save", userID, schoolyear, schoolcode, employeeID, noticeType, noticeDate, deadlineDate, deadlineDate, eMailSubject, eMailBody);
                string result = AssemblingeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        public static string SendeMail(string operate, string userID, string schoolyear, string schoolcode, string employeeID, string sessionID, string noticeType, string noticeArea, string noticeDate, string deadlineDate, string subject, string eBody)
        {
            try
            {
                string eMailTo = NotificationeMail("Get", userID, schoolyear, schoolcode, employeeID, sessionID, "NoticeUser", noticeArea);
                string eMailCC = NotificationeMail("Get", userID, schoolyear, schoolcode, employeeID, sessionID, "CCUser", noticeArea);
                string eMailBcc = "";
                string eMailForm = NotificationeMail("Get", userID, schoolyear, schoolcode, employeeID, sessionID, "OperateUser", noticeArea);
                string eMailSubject = subject; // getEmailSubjectByType(  operate,   userID,   schoolyear,   schoolcode, employeeID,   noticeType);
                string eMailBody = eBody; // getEmailBodyByType(operate, userID, schoolyear, schoolcode, employeeID, noticeType);
                string eMailFormat = "HTML";
                NotificationeMail("Save", userID, schoolyear, schoolcode, employeeID, sessionID, noticeType, noticeArea, noticeDate, deadlineDate, eMailSubject, eMailBody);
                string result = SendeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        private static string AssemblingeMail(string eMailTo, string eMailCC, string eMailBCC, string eMailForm, string eMailSubject, string eMailBody, string eMailFormat)
        {
            string result = "Failed";
            try
            {
                System.Net.Mail.SmtpClient myMail = new System.Net.Mail.SmtpClient();
                myMail.Host = WebConfigurationManager.AppSettings["SMTPServer"];

                System.Net.Mail.MailMessage Mailmsg = new System.Net.Mail.MailMessage();
                Mailmsg.To.Clear();
                LoopAddress("mailTo", eMailTo, ref Mailmsg);
                LoopAddress("mailCC", eMailCC, ref Mailmsg);
                LoopAddress("mailBcc", eMailBCC, ref Mailmsg);
                LoopAddress("mailFrom", eMailForm, ref Mailmsg);


                Mailmsg.Subject = eMailSubject;
                Mailmsg.Priority = MailPriority.High;
                if (eMailFormat == "HTML")
                { Mailmsg.IsBodyHtml = true; }
                Mailmsg.Body = eMailBody;
                try
                { myMail.Send(Mailmsg); }
                catch (Exception ex)
                {
                    string ms = ex.Message;
                }
                Mailmsg.Dispose();
                result = "Successfully";
            }
            catch (Exception ex)
            {
                string ms = ex.Message;
                result = "Failed";
            }
            return result;
        }
        private static string AssemblingeMail(string eMailTo, string eMailCC, string eMailBCC, string eMailForm, string eMailSubject, string eMailBody, string eMailFormat, System.Net.Mail.Attachment iCalendar)
        {
            string result = "Failed";
            try
            {
                System.Net.Mail.SmtpClient myMail = new System.Net.Mail.SmtpClient();
                myMail.Host = WebConfigurationManager.AppSettings["SMTPServer"];

                System.Net.Mail.MailMessage Mailmsg = new System.Net.Mail.MailMessage();
                Mailmsg.To.Clear();
                LoopAddress("mailTo", eMailTo, ref Mailmsg);
                LoopAddress("mailCC", eMailCC, ref Mailmsg);
                LoopAddress("mailBcc", eMailBCC, ref Mailmsg);
                LoopAddress("mailFrom", eMailForm, ref Mailmsg);

                Mailmsg.Attachments.Add(iCalendar);

                Mailmsg.Subject = eMailSubject;
                Mailmsg.Priority = MailPriority.High;
                if (eMailFormat == "HTML")
                { Mailmsg.IsBodyHtml = true; }
                Mailmsg.Body = eMailBody;
                try
                { myMail.Send(Mailmsg); }
                catch (Exception ex)
                {
                    string ms = ex.Message;
                }
                Mailmsg.Dispose();
                result = "Successfully";
            }
            catch 
            {
                result = "Failed";
            }
            return result;
        }
        private static string AssemblingeMail(string eMailTo, string eMailCC, string eMailBCC, string eMailForm, string eMailSubject, string eMailBody, string eMailFormat, string attachement1, string attachement2)
        {
            string result = "Failed";
            try
            {
                System.Net.Mail.SmtpClient myMail = new System.Net.Mail.SmtpClient();
                myMail.Host = WebConfigurationManager.AppSettings["SMTPServer"];

                System.Net.Mail.MailMessage Mailmsg = new System.Net.Mail.MailMessage();
                Mailmsg.To.Clear();
                LoopAddress("mailTo", eMailTo, ref Mailmsg);
                LoopAddress("mailCC", eMailCC, ref Mailmsg);
                LoopAddress("mailBCC", eMailBCC, ref Mailmsg);
                LoopAddress("mailFrom", eMailForm, ref Mailmsg);


                Mailmsg.Subject = eMailSubject;
                Mailmsg.Priority = MailPriority.High;
                if (eMailFormat == "HTML")
                { Mailmsg.IsBodyHtml = true; }
                Mailmsg.Body = eMailBody;
                if (attachement1 != "")
                {
                    System.Net.Mail.Attachment myAttachment1 = new System.Net.Mail.Attachment(attachement1);
                    Mailmsg.Attachments.Add(myAttachment1);
                }
                if (attachement2 != "")
                {
                    System.Net.Mail.Attachment myAttachment2 = new System.Net.Mail.Attachment(attachement2);
                    Mailmsg.Attachments.Add(myAttachment2);
                }
                try
                { myMail.Send(Mailmsg); }
                catch
                { }
                Mailmsg.Dispose();
                result = "Successfully";
            }
            catch  
            {
                result = "Failed";
            }
            return result;
        }


        private static void LoopAddress(string Type, string eMailADD, ref System.Net.Mail.MailMessage Mailmsg)
        {
            if (eMailADD.IndexOf("@") > 0)
            {
                string[] myArray = eMailADD.Split(';');
                for (int x = 0; x < myArray.Length; x++)
                {
                    try
                    {
                        AddAddress(Type, myArray[x], ref Mailmsg);
                    }
                    catch
                    { }

                }


                //if (eMailADD.IndexOf(";") > 0)
                //{ string[] myArray = eMailADD.Split(';');
                //    for (int x = 0; x < myArray.Length - 1; x++)
                //    {  AddAddress(Type, myArray[x], ref Mailmsg);
                //    }
                //}
                //else
                //{  AddAddress(Type, eMailADD, ref Mailmsg);
                //}
            }
            else
            { }
        }
        private static void AddAddress(string addType, string eMailADD, ref System.Net.Mail.MailMessage Mailmsg)
        {
            try
            {
                if (eMailADD.IndexOf("@") > 0)
                {

                    switch (addType)
                    {
                        case "mailTo":
                            Mailmsg.To.Add(new System.Net.Mail.MailAddress(eMailADD));
                            break;
                        case "mailCC":
                            Mailmsg.CC.Add(new System.Net.Mail.MailAddress(eMailADD));
                            break;
                        case "mailBcc":
                            Mailmsg.Bcc.Add(new System.Net.Mail.MailAddress(eMailADD));
                            break;
                        default:
                            Mailmsg.From = new System.Net.Mail.MailAddress(eMailADD);
                            break;
                    }
                }

            }
            catch { }

        }
        private static string getEmailBodyByType(string operate, string userID, string schoolyear, string schoolcode, string employeeid, string noticeType)
        {
            string ebody = "";
            switch (noticeType)
            {
                case "ALP":
                    ebody = "Annual Learning Plan notification";
                    break;
                case "EPA":
                    ebody = "Performance Appraisal Notification";
                    break;
                case "STR":
                    ebody = "NTIP Strategy Form Sign Off Notification";
                    break;
                default:
                    ebody = "EPA email Notification";
                    break;
            }
            return ebody;
        }
        private static string getEmailSubjectByType(string operate, string userID, string schoolyear, string schoolcode, string employeeid, string noticeType)
        {
            string ebody = "";
            switch (noticeType)
            {
                case "ALP":
                    ebody = "Annual Learning Plan notification";
                    break;
                case "EPA":
                    ebody = "Performance Appraisal Notification";
                    break;
                case "STR":
                    ebody = "NTIP Strategy Form Sign Off Notification";
                    break;
                default:
                    ebody = "EPA email Notification";
                    break;
            }
            return ebody;
        }
        static string sp = "dbo.EPA_sys_EmailFeedBack";
        public static string FeedBackeMail(string operate, string userID, string noticType)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[3];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 2, 30, "@NoticeType", noticType);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string FeedBackeMail(string operate, string userID, string noticeType, string emailAddress)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 2, 30, "@NoticeType", noticeType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 3, 250, "@eMailAddress", emailAddress);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeMail(string operate, string userID, string schoolyear, string schoolcode, string employeeid, string sessionID, string noticeType, string noticeArea)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_Notification";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[8];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolyear, schoolcode, employeeid, sessionID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 30, "@NoticeType", noticeType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@NoticeArea", noticeArea);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeMail(string operate, string userID, string schoolyear, string schoolcode, string employeeid, string sessionID, string noticeType,string noticeArea, string noticeDate, string deadlineDate, string subject, string Comments)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_Notification";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[12];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, schoolyear, schoolcode, employeeid, sessionID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 30, "@NoticeType", noticeType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@NoticeArea", noticeArea);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 10, "@NoticeDate", noticeDate);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 10, "@DeadlineDate", deadlineDate);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 10, 250, "@NoticeSubject", subject);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 11, 1000, "@Comments", Comments);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplate(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplate";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[8];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                return SetSQLParameter.getMyDataValue(sp, myPara);


            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplate(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string subject)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplate";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 250, "@Subject", subject);
                return SetSQLParameter.getMyDataValue(sp, myPara);


            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplate(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string subject, string template)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplate";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 250, "@Subject", subject);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 1000, "@Template", template);
                return SetSQLParameter.getMyDataValue(sp, myPara);


            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplatePersonal(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplatePersonal";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[8];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                 return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplatePersonal(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplatePersonal";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 20, "@TemplateType", templateType);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string NotificationeTemplatePersonal(string operate, string userID, string category, string noticType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType, string subject, string template,string autoNotice)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_NotificationTemplatePersonal";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[12];
                SetupThisParameters(ref myPara, operate, userID, category, noticType, noticeArea, noticeGo, noticeFrom, purpose);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 20, "@TemplateType", templateType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 250, "@Subject", subject);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 10, 1000, "@Template", template);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 11, 10, "@AutoNotice", autoNotice);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string category, string noticType, string noticArea, string noticeGo, string noticeFrom, string purpose)
        {

            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 2, 10, "@Category", category);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 3, 30, "@NoticeType", noticType);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 10, "@NoticeArea", noticArea);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 15, "@NoticeGo", noticeGo);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 15, "@NoticeFrom", noticeFrom);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@Purpose", purpose);

        }
    }
}
