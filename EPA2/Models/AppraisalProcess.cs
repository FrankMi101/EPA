using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;
using ClassLibrary;

namespace EPA2
{
    public class AppraisalProcess : BaseData
    {

        public AppraisalProcess()
        { }
       


        public static string ViewALPButtonText(string action, object parameter)
        {
            return  GeneralValue<string>("AppraisalContents", action, parameter); // AppraisalDataAC.TextContent("CheckALP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea,"ALP51");

        }
        public static string ViewAGPButtonText(string action, object parameter)
        {
            return GeneralValue<string>("AppraisalContentsAGP", action, parameter); // AppraisalDataAC.TextContent("CheckALP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea,"ALP51");

        }
        public static string AppraisalActionRole(string category, string userRole, string workingUserID, string LoginUserID )
        {
            return AppraisalActivity.AppraisalActionRole(category, userRole, workingUserID, LoginUserID);
          
        }
       
        public static string AppraisalRate(string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string area, string itemCode)
        {
            var parameter = new AppraisalComment()
            {
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                Category = appraisalCategory,
                Area = area,
                ItemCode = itemCode
            };
            return AppraisalContents.AppraisalRate(parameter);
        }
        public static List<AppraisalDefinition> CheckCompleteStatus(object parameter)  //string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory, string area, string itemCode)
        {
            return AppraisalActivity.CheckCompleteStatus(parameter);

         }
        public static List<AppraisalDefinition> AppraisalMenuItem(object parameter) // (string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string appraisalCategory)
        {
            return AppraisalActivity.AppraisalMenuItem(parameter);
         }

        public static string AppraisalPageItem(string operate, string userID, string appraisalCategory, string appraisalArea, string appraisalCode)
        {
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = appraisalCategory,
                Area = appraisalArea,
                Code = appraisalCode
            };

            return AppraisalPageHelp.PageItem(parameter);
        }

        public static string AppraisalAreaTitle(object parameter)
        {
            return AppraisalActivity.AppraisalAreaTitle(parameter);
        }
        public static string AppraisalAreaCodeTitle(object parameter)
        {
            return AppraisalActivity.AppraisalAreaCodeTitle(parameter);
        }
        public static string CheckSummary(string action, AppraisalComment parameter)
        {
            string sp = "dbo.EPA_Appr_AppraisalProcess_Summary @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Phase,@AppraisalRole";
            parameter.Operate = action;
            return GeneralValue<string>(sp, parameter);
        }
        public static string CheckPageViewPermission(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string code, string userAppraisalRole)
        {
            string sp = "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission";
            var parameter = new AppraisalCommentSignOff()
            {
                UserID = userID,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                Category = category,
                Area = area,
                ItemCode = code,
                AppraisalRole = userAppraisalRole

            };
            return AppraisalActivity.CheckPageViewPermission(parameter);
        }
        public static string CheckPageViewPermission(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string code, string userAppraisalRole, string value)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission";
            var parameter = new AppraisalCommentSignOff()
            {
                UserID = userID,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                Category = category,
                Area = area,
                ItemCode = code,
                AppraisalRole = userAppraisalRole,
                Value = value

            };
            return AppraisalActivity.CheckPageViewPermissionSave(parameter);
        }
        public static string CheckPDFViewPermission(string CheckType, string userID, string schoolyear, string schoolcode, string employeeID, string sessionID, string category, string area, string itemCode, string userRole)
        {
            var parameter = new AppraisalCommentSignOff()
            {   Operate = CheckType,
                UserID = userID,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                UserRole = userRole 
            };
            return AppraisalActivity.CheckPDFViewPermission(parameter);
        }
        public static string CheckPageViewStepsGo(object parameter)
        {
            return AppraisalActivity.CheckPageViewStepsGo(parameter);
        }
        public static string CheckPageViewStepsGo(string operate, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_CheckViewStepsGo";
            var parameter = new AppraisalCommentSignOff()
            { Operate ="Get",
                UserID = userID,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                Category = category,
                Area = area,
                ItemCode = itemCode
            };
            return AppraisalActivity.CheckPageViewStepsGo(parameter);
 
        }
    
      
        public static string LookForsList( object parameter )
        {
             return AppraisalContentsDomain.CommonValue<string>("LookForsListSave", parameter);
        }

        public static string LookForsListLogSave(string operate,  BuildLookForsList parameter)
        {
            return AppraisalContentsDomain.CommonValue<string>("LookForsListSave", parameter);
        }

        public static string LookForsList(string operate, string userId, string schoolYear, string schoolCode, string employeeId, string sessionID, string category, string area, string itemCode, string domainId, string competencyId, string actionRole, string lookForID, bool check, string logDate, string allowview)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsList";

            var parameter = new BuildLookForsList()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionID,
                Category = category,
                Area =area,
                ItemCode = itemCode,
                DomainID = domainId,
                CompetencyID = competencyId,
                ActionRole = actionRole,
                LookForsID = lookForID,
                LogCheck =  check  ,
                LogDate = logDate,
                AllowView = allowview

            };

            return AppraisalContentsDomain.CommonValue<string>("LookForsListSave",parameter);
        }
        public static string LookForsList(string operate, string userId, string schoolYear, string schoolCode, string employeeId, string sessionId, string category, string area, string itemCode, string domainId, string competencyId, string actionRole, string lookForID, bool check, string logDate, string allowview, string comments)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsList";
            var parameter = new BuildLookForsList()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeId,
                SessionID = sessionId,
                Category = category,
                Area = area,
                ItemCode  = itemCode,
                DomainID = domainId,
                CompetencyID = competencyId,
                ActionRole = actionRole,
                LookForsID = lookForID,
                LogCheck = check  ,
                LogDate = logDate,
                AllowView = allowview,
                Comments = comments

            };

            return AppraisalContentsDomain.CommonValue<string>("LookForsListSave", parameter);
        }


        public static string FeedBackContent(string operate, string userID, string categoryID, string areaID, string itemCode, string userRole, string schoolyear, string subject, string feedBack)
        {
            
            return  FeedBack.Content( operate,  userID,  categoryID,  areaID,  itemCode,  userRole,  schoolyear,  subject,  feedBack);
        }
        public static string FeedBackContent(string operate, string userID, string categoryID, string areaID, string itemCode, string userRole, string schoolyear, string subject, string feedBack, string purpose)
        {
            return FeedBack.Content(operate, userID, categoryID, areaID, itemCode, userRole, schoolyear, subject, feedBack, purpose);
        }
    }
}
