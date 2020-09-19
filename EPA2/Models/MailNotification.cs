using BLL;
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPA2
{
    public class MailNotification : BaseData
    {
        public static string SendMail(EmailNotice eNotice)
        {

            return eMailNotification.SendMail(eNotice);

        }
        public static string SendMailWithiCalendar(EmailNotice eNotice, System.Net.Mail.Attachment iCalendar)
        {
            return eMailNotification.SendMailWithiCalendar(eNotice, iCalendar );
        }
        public static string NoticeSave(EmailNoticePara eNorice)
        {
            return eMailNotification.NotificationeMailSave(eNorice);
        }
        public static string NoticeSave(string operate, string userID, string schoolyear, string schoolcode, string employeeID, string sessionID, string noticeType, string noticeArea, string noticeDate, string deadlineDate, string subject, string eBody)
        {
            try
            {
                var parameter = new EmailNoticePara()
                {
                    Operate = operate,
                    UserID = userID,
                    SchoolYear = schoolyear,
                    SchoolCode = schoolcode,
                    EmployeeID = employeeID,
                    SessionID = sessionID,
                    NoticeType = noticeType,
                    NoticeArea = noticeArea,
                    NoticeDate = noticeDate,
                    DeadLineDate = deadlineDate,

                };


                return NoticeSave(parameter);

 
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        public static string NotificationeMail(string operate, string userID, string schoolyear, string schoolcode, string employeeId, string sessionID, string noticeType, string noticeArea)
        {
            var parameter = new EmailNoticePara()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                EmployeeID = employeeId,
                SessionID = sessionID,
                NoticeType = noticeType,
                NoticeArea = noticeArea
            };           
            return eMailNotification.NotificationeMail( parameter);
        }

        public static string NotificationeMail(object parameter)
        {
            return eMailNotification.NotificationeMail(parameter);
        }
        public static string NotificationeMailUser(string objType, EmailNoticePara parameter)
        {  
                return eMailNotification.NotificationeMailUser(objType, parameter);
        }
        public static string NotificationeMailSave(object parameter)
        {
            return eMailNotification.NotificationeMailSave( parameter);
        }

        public static string FeedBackeMail(string operate, string userID, string noticeType)
        {
           
                return eMailNotification.FeedBackeMail(operate, userID, noticeType);
  
        }
        public static string FeedBackeMail(string operate, string userID, string noticeType, string emailAddress)
        {
            return eMailNotification.FeedBackeMail(operate, userID, noticeType, emailAddress);
        }


    }
}