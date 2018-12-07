using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Text;
using DataAccess;

namespace EPA2  
{
    public class GetNoticeFile
    {
       
        public static string FileContentByType(string noticeType)
        {
            string bodyFile = "";
            string bodyContent = "";
            string fileName = getHTMLFileName(noticeType);
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
        private static string getHTMLFileName(string noticeType)
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

        public static string eMailContentAppCategory(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose)
        {
           return  eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose);
        }
        public static string eMailContentByType(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom,string purpose)
        {
            return eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom,purpose);
        }
        public static string eMailContentByType(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string noticdePurpose)
        {
            return eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose, noticdePurpose);
        }
        public static string eMailContentByType(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose,  string subject, string template)
        {
            return eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom,purpose,subject,template);
        }
        public static string eMailContentByTemplate(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose  )
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose );
        }
        public static string eMailContentByTemplate(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType)
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, templateType);
        }
        public static string eMailContentByTemplate(string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string purpose, string templateType, string subject, string template, string AutoNotice)
        {
            return eMailNotification.NotificationeTemplatePersonal(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose, templateType, subject, template, AutoNotice);
        }
    }
}
 