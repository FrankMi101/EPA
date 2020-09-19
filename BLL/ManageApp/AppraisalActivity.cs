using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
   
    public class AppraisalActivity 
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalActivity");
                default:
                    return GetSPInClass(action);
            }
        }
        public static List<T> CommonList<T>(string action,object parameter)
        {            
            try
            {
                string sp =  GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }

        }
        public static T CommonValue<T>(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }

        }
        public static string CommonString(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action);
                return CommonExecute<string>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                return "Failed";
            }
        }
        public static int CommonInt(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action);
                return CommonExecute<int>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                return 0;
            }
        }
       

        public static List<AppraisalDefinition> CheckCompleteStatus(object parameter)
        {
            return CommonList<AppraisalDefinition>("CheckCompleteStatus", parameter);
        }
        public static List<AppraisalDefinition> AppraisalMenuItem(object parameter)
        {
            return CommonList<AppraisalDefinition>("AppraisalMenuItem", parameter);           
        }
        public static List<AppraisalComptency> CompentencyList(object parameter)
        {
            return CommonList<AppraisalComptency>("CompentencyList", parameter);
        }
        public static List<AppraisalComptency> CompentencyListForLOG(object parameter)
        {
            return CommonList<AppraisalComptency>("CompentencyListForLOG", parameter);
        }
        public static string AppraisalAreaTitle(object parameter)
        {
            return CommonString("AppraisalAreaTitle", parameter);
        }
        public static string AppraisalAreaCodeTitle(object parameter)
        {
            return CommonString("AppraisalAreaCodeTitle", parameter);
        }
        public static string AppraisalPageItem(object parameter)
        {return AppraisalPageHelp.PageItem(parameter);
             
        }
        public static string CheckPageViewPermission(object parameter)
        {
            return CommonString("CheckPageViewPermission", parameter);
  
        }
        public static string CheckPageViewPermissionSave(object parameter)
        {
            return CommonString("CheckPageViewPermissionSave", parameter);
         
        }
        public static string CheckPDFViewPermission(object parameter)
        {
            return CommonString("CheckPDFViewPermission", parameter);
  
        }
        public static string CheckPageViewStepsGo(object parameter)
        {
            return CommonString("CheckPageViewStepsGo", parameter);
   
        }
        public static string CheckAppraiseeAdmin(object parameter)
        {
            return CommonString("CheckAppraiseeAdmin", parameter);
  
        }
        public static int CompentencyListCount(object parameter)
        {
            return CommonInt("CompentencyListCount", parameter);
  
        }
        public static string PDFReportName(object parameter)
        {
            return CommonString("PDFReportName", parameter);

        }
        private static string GetSPInClass(string action)
        {

            string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category";
            string parameters1 = parameters + ",@Area,@ItemCode";

            switch (action)
            {
                case "CheckCompleteStatus":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckSteps" + parameters1;
                case "AppraisalMenuItem":
                    return "dbo.EPA_Appr_AppraisalProcess_StepMenu" + parameters1 + ",@AppraisalRole";
                case "AppraisalMenuItem2":
                    return "dbo.EPA_Appr_AppraisalProcess_StepMenu" + parameters1 + ",@AppraisalRole";
                case "CompentencyList":
                    return "dbo.EPA_Appr_AppraisalProcess_CompentencyList" + parameters + ",@Domain";
                case "CompentencyListForLOG":
                    return "dbo.EPA_Appr_AppraisalProcess_CompentencyListForLOG" + parameters + ",@Domain";
                case "AppraisalAreaTitle":
                    return "dbo.EPA_Appr_AppraisalProcess_AreaTitle" + " @Operate,@UserID,@Category,@Area";
                case "AppraisalAreaCodeTitle":
                    return "dbo.EPA_Appr_AppraisalProcess_AreaTitle" + " @Operate,@UserID,@Category,@Area,@Code";
                case "CheckPageViewPermission":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission" + parameters1 + ",@AppraisalRole";
                case "CheckPageViewPermissionSave":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission" + parameters1 + ",@AppraisalRole,@Value";
                case "CheckPDFViewPermission":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewPDF" + parameters1 + ",@UserRole";
                case "CheckPageViewStepsGo":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewStepsGo" + parameters1;
                case "CheckAppraiseeAdmin":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckAppraiseeAdmin" + parameters + "@Area,@UserRole";
                case "CompentencyListCount":
                    return "dbo.EPA_Appr_AppraisalProcess_CompentencyList" + parameters + ",@Domain";
                case "AppraisalTextbyPageSave":
                    return "dbo.EPA_Appr_AppraisalData_byPage" + parameters1 + ",@SeqNo,@GoalItem,@Value";
                case "CheckALP":
                    return "dbo.EPA_Appr_AppraisalData_byPage" + parameters1 + ",@SeqNo,@GoalItem,@Value";
                case "CheckSummary":
                    return "dbo.EPA_Appr_AppraisalProcess_Summary" + parameters + ",@Phase,@AppraisalRole";

                default:
                    return action;

            }
        }

        public static string AppraisalActionRole(string category, string userRole, string workingUserID, string LoginUserID)
        {
            string aRole = "Appraisee";
            switch (userRole)
            {
                case "Teacher":
                    aRole = "Appraisee";
                    break;
                case "Admin":
                    aRole = "Appraiser";
                    break;
                case "Principal":
                    if (category == "PPA")
                    {
                        if (LoginUserID == workingUserID)
                        { aRole = "Appraisee"; }
                        else
                        { aRole = "Appraiser"; }
                    }
                    else
                    { aRole = "Appraiser"; }
                    break;
                case "VP":
                    if (category == "PPA")
                    { aRole = "Appraisee"; }
                    else
                    { aRole = "Appraiser"; }
                    break;
                case "SO":
                    if (category == "PPA")
                    {
                        aRole = "Appraiser";
                    }
                    else
                    { aRole = "Supervisory"; }
                    break;


                default:
                    aRole = "Appraisee";
                    break;
            }
            return aRole;
        }

    }
 
}

