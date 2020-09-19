using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public  class AppraisalSignOff
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalSignOff");
                default:
                    return GetSPInClass(action);
            }
        }

        public static List<T> CommonList<T>(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action);
                string para = AppraisalCommon.GetParamerters(sp, parameter);
                return CommonExecute<T>.ListOfT(para, parameter);
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
                string para = AppraisalCommon.GetParamerters(sp, parameter);
                return CommonExecute<T>.ValueOfT(para, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }

    
        public static string SignOffName(object parameter)
        {
            return CommonValue<string>("SignOffName", parameter);
        }
        public static string SignOffNameSave(object parameter)
        {
            return CommonValue<string>("SignOffNameSave", parameter);
        }
        public static string SignOffNameEnforce(object parameter)
        {
            return CommonValue<string>("SignOffNameEnforce", parameter);
        }
        public static string SignOffDate(object parameter)
        {
            return CommonValue<string>("SignOffDate", parameter);
        }
        public static string SignOffComplete(object parameter)
        {
            return CommonValue<string>("SignOffComplete", parameter);
        }
        public static string NoticeDate(object parameter)
        {
            return CommonValue<string>("NoticeDate", parameter);
        }
        public static string DigitalSignature(object parameter)
        {
            return CommonValue<string>("DigitalSignature", parameter);
        }
        public static string DigitalSignatureSave(object parameter)
        {
            return CommonValue<string>("DigitalSignatureSave", parameter);
        }
        public static string CheckViewPermission(object parameter)
        {
            return CommonValue<string>("CheckViewPermission", parameter);
        }
        public static string CheckViewPermissionSave(object parameter)
        {
            return CommonValue<string>("CheckViewPermissionSave", parameter);
        }
        public static string CheckAutoNotice(object parameter)
        {
            return CommonValue<string>("CheckAutoNotice", parameter);
        }
        public static string CheckAutoNoticeSave(object parameter)
        {
            return CommonValue<string>("CheckAutoNoticeSave", parameter);
        }


        private static string GetSPInClass(string action)
        {
            string parameter0 = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID";
            string parameters = parameter0 + ",@Category,@ItemCode,@UserRole,@SignOffType";
            string parameters2 = parameter0 + ",@Category,@Area,@ItemCode,@AppraisalRole";

            string parameters1 = parameters + ",@SignOffName,@SignOffDate,@SignOffAction";
             
 
            switch (action)
            {
                case "SignOffContents":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffContent" + parameters;
                case "SignOffAction":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffAction" + parameters;
                case "SignOffName":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffName" + parameters ;
                case "SignOffDate":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffDate"   + parameters;
                case "SignOffComplete":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffComplete"  + parameters;
                case "SignOffNameSave":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffSignature"  + parameters1;
                case "SignOffNameEnforce":
                    return "dbo.EPA_Appr_AppraisalProcess_SignOffSignature"   + parameters1 + ",@EnforceSignOff";
                case "NoticeDate":
                    return "dbo.EPA_Appr_AppraisalProcess_NoticeDate" + parameter0 + ",@NoticeType,@NoticeArea";
                case "DigitalSignature":
                    return "dbo.EPA_sys_UserDigitalSignature" + " @Operate,@UserID,@EmployeeID";
                case "DigitalSignatureSave":
                    return "dbo.EPA_sys_UserDigitalSignature" + " @Operate,@UserID,@EmployeeID,@CreateTime, @DigitalKey";
                case "CheckViewPermission":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission" + parameters2;
                case "CheckViewPermissionSave":
                    return "dbo.EPA_Appr_AppraisalProcess_CheckViewPermission" + parameters2 + ",@Value";
                case "CheckAutoNotice":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffActionAutoNotice" + parameters2;
                case "CheckAutoNoticeSave":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffActionAutoNotice" + parameters2 + ",@Value";
                case "AutoNotice":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffAutoNotice" + " @Operate,@UserID,@EmployeeID,@Category,@Area,@ActionRole";
                case "AutoNoticeSave":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffAutoNotice" + " @Operate,@UserID,@EmployeeID,@Category,@Area,@ActionRole,@Value,@Template";

                case "AutoNoticeTemplate":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffAutoNoticeTemplate" + " @Operate,@UserID,@Category,@Area,@Action,@ActionRole";
                case "AutoNoticeTemplateEdit":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffAutoNoticeTemplateEdit" + " @Operate,@UserID,@Category,@Area,@Action,@ActionRole";
                case "AutoNoticeTemplateEditSave":
                    return "dbo.EPA_Appr_AppraisalProcess_SigeOffAutoNoticeTemplateEdit" + " @Operate,@UserID,@Category,@Area,@Action,@ActionRole,@Subject,@Body";

                default:
                    return action;

            }
        }
  
    }
   
}
