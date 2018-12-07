using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DataAccess;
namespace EPA2.Models
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public string GetHelpContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode,string helpType)
        {
            try
            {
                return HelpContext.Content(operation, userID, CategoryID, AreaID, ItemCode, helpType);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveHelpContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string helpType, string value)
        {
            try
            {
                return HelpContext.Content(operation, userID, CategoryID, AreaID, ItemCode, helpType, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetTitleContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode)
        {
            try
            {
                return TitleContext.Content(operation, userID, CategoryID, AreaID, ItemCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveTitleContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string title, string subtitle)
        {
            try
            {
                return TitleContext.Content(operation, userID, CategoryID, AreaID, ItemCode, title, subtitle);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string GetMessageContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode)
        {
            try
            {
                return MessageContext.Content(operation, userID, CategoryID, AreaID, ItemCode);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveMessageContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string value)
        {
            try
            {
                return MessageContext.Content(operation, userID, CategoryID, AreaID, ItemCode, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetMessageContent2(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string UserRole)
        {
            try
            {
                return MessageContext.Message(operation, userID, CategoryID, AreaID, ItemCode, UserRole);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveMessageContent2(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string UserRole, string value)
        {
            try
            {
                return MessageContext.Message(operation, userID, CategoryID, AreaID, ItemCode, UserRole,value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string VerifyUser(string operation, string domain, string userID, string password )
        {
            try
            {
                if (Authentication.IsAuthenticated(domain, userID, password))
                {
                    return "Pass";
                }
                else
                {
                    return "Failed";
                }
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "Failed";
            }

        }

        [WebMethod]
        public string GetRubricHelpContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID)
        {
            try
            {
                return AppraisalProcess.Rubrics(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, CategoryID, domainID, competencyID);
             }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID )
        {
            try
            {   //  string rVal = AppraisalDataDomain.CompetencyTextContent(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode,domainID, competencyID);
                string rVal = AppraisalData.ITextContentDomain(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,"","");

                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyContent(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string rate, string value)
        {
            try
            {
              //  return AppraisalDataDomain.CompetencyTextContent(operation,User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,rate,value);
                return AppraisalData.ITextContentDomain(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, rate, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyContentLOG(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string ActionRole)
        {
            try
            {
                 string rVal = AppraisalDataDomain.DomainTextContentLOG(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID,ActionRole);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyEvidenceLog(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string ActionRole)
        {
            try
            {
                string rVal = AppraisalDataDomain.DomainTextEvidenceLog( User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionRole);
 
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyContentLOG(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID,  string ActionRole, string value)
        {
            try
            {
                return AppraisalDataDomain.DomainTextContentLOG(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionRole, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveLookForsChoseLOG(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string lookForsID, string ActionRole, string ObjRole, string mydate, string mycheck, string allowview)
        {
            try
            {
                return AppraisalProcess.LookForsList(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionRole, lookForsID, mycheck, mydate, allowview);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveLookForsChoseLOG(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string lookForsID, string ActionRole, string ObjRole, string mydate, string mycheck, string allowview,string comments)
        {
            try
            {
                return AppraisalProcess.LookForsList(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionRole, lookForsID, mycheck, mydate, allowview, comments);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveObseverationSelect(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string check, string value)
        {
            try
            {
                return AppraisalDataObservation.ObservationList(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, check, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAppraisalNotes(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string value)
        {
            try
            {
                return AppraisalDataAC.NotesContent(operation, User.Identity.Name,  WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode,  value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string GetCompetencyNoteEnrichment(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string ActionItem)
        {
            try
            {
                string rVal = AppraisalDataDomain.DomainTextContentEnrichment(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionItem);
                return rVal;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveCompetencyNoteEnrichment(string operation, string userID, string CategoryID, string AreaID, string ItemCode, string domainID, string competencyID, string ActionItem, string value)
        {
            try
            {
                return AppraisalDataDomain.DomainTextContentEnrichment(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, domainID, competencyID, ActionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAGPText(string operation, string UserID, string CategoryID, string AreaID, string ItemCode, string SeqNo,  string ActionItem, string value)
        {
            try
            {
                return AppraisalDataAGP.AGPWorkingListContent(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode,SeqNo, ActionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveAPPText(string operation, string UserID, string CategoryID, string AreaID, string ItemCode, string SeqNo, string ActionItem, string value)
        {
            try
            {
                return AppraisalDataAPP.APPWorkingListContent(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, SeqNo, ActionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveIMPText(string operation, string UserID, string CategoryID, string AreaID, string ItemCode, string SeqNo, string ActionItem, string value)
        {
            try
            {
                return AppraisalDataAIP.WorkingListContent(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, SeqNo, ActionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string SaveIMPText2(string operation, string UserID, string CategoryID, string AreaID, string ItemCode, string SeqNo, string ActionItem, string value)
        {
            try
            {
                return AppraisalDataAIP.WorkingListContent2(operation, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, CategoryID, AreaID, ItemCode, SeqNo, ActionItem, value);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SendNotification(string eMailTo,   string eMailCC, string eMailBcc, string eMailFrom, string eMailSubject, string eMailBody)
        {
            try
            {
  
                string result = eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc, eMailFrom, eMailSubject, eMailBody, "HTML");
                 return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        [WebMethod]
        public string SaveNotification(string operation, string schoolyear, string schoolcode, string employeeID, string noticeType, string noticeArea, string deadlineDate, string subject, string emailBody)
        {
            try
            {
                string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
                emailBody = emailBody.Replace("{{PlaceHolder:OneLine}}", "");
                string result = eMailNotification.NotificationeMail(operation, User.Identity.Name, schoolyear, schoolcode, employeeID,"", noticeType, noticeArea, noticeDate, deadlineDate, subject, emailBody);
                return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        [WebMethod]
        public string GetEmailTemplate(string operation, string noticeType, string noticeArea, string category)
        {
            try
            {
                 string result = GetNoticeFile.eMailContentByType(operation, User.Identity.Name, category, noticeType, noticeArea, "Appraisee", "Appraiser","Notice");
                  return result;
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }

        [WebMethod]
        public string SaveApplicationRole(string operation, string userID, string CategoryID, string AreaID, string IDs, string roleCode, string roleName, string comments, string active)
        {
            try
            {
                return ApplicationSetupData.UserRoleManagement(operation, userID, CategoryID, AreaID, IDs, roleCode, roleName, comments, active);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "failed";
            }

        }
    }
}
