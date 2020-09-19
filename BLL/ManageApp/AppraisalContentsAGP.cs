using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL 
{
   public  class AppraisalContentsAGP
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalContentsAGP");
                default:
                    return GetSPInClass(action);
            }

        }

        public static List<T> CommonList<T>(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action);
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


     
        public static string AppraisalTextIMP2Save(object parameter)
        {
            return CommonValue<string>("AppraisalTextIMP2Save", parameter);
        }
        public static List<AppraisalIMP> AppraisalTextIMP2List(object parameter)
        {
            return CommonList<AppraisalIMP>("AppraisalTextIMP2List", parameter);
        }
        public static string AppraisalTextIMP5Save(object parameter)
        {
            return CommonValue<string>("AppraisalTextIMP5Save", parameter);
        }
        public static List<AppraisalIMP5> AppraisalTextIMP5List(object parameter)
        {
            return CommonList<AppraisalIMP5>("AppraisalTextIMP5List", parameter);
        }
        public static string AppraisalTextAGPSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextAGPSave", parameter);
        }
        public static string AppraisalTextAGP(object parameter)
        {
            return CommonValue<string>("AppraisalTextAGP", parameter);
        }
        public static List<AppraisalCommentAGP> AppraisalTextAGPList(object parameter)
        {
            return CommonList<AppraisalCommentAGP>("AppraisalTextAGPList", parameter);
        }
        public static string AppraisalTextAPPSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextAPPSave", parameter);
        }
        public static List<AppraisalCommentAPP> AppraisalTextAPPList(object parameter)
        {
            return CommonList<AppraisalCommentAPP>("AppraisalTextAPPList", parameter);
        }
        public static string AppraisalTextAPMSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextAPMSave", parameter);
        }
        public static List<AppraisalCommentAPM> AppraisalTextAPMList(object parameter)
        {
            return CommonList<AppraisalCommentAPM>("AppraisalTextAPMList", parameter);
        }

        public static string AppraisalTextbyPageSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextbyPageSave", parameter);
        }
        public static string CheckAGP(object parameter)
        {
            return CommonValue<string>("CheckAGP", parameter);
        }

        private static string GetSPInClass(string action)
        {
            string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category";

            string parameters1 = parameters + ",@Area,@ItemCode";

            string parameters2 = parameters + ",@DomainID,@CompetencyID";
            switch (action)
            {
  

                case "AppraisalTextIMP2List":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameters1;
                case "AppraisalTextIMP2Save":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameters1 + ",@SeqNo,@ActionItem,@Value";
                case "AppraisalTextIMP5List":
                    return "dbo.EPA_Appr_AppraisalData_IMPList5" + parameters1;
                case "AppraisalTextIMP5Save":
                    return "dbo.EPA_Appr_AppraisalData_IMPList5" + parameters1 + ",@SeqNo,@ActionItem,@Value";
                case "AppraisalTextAGP":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + parameters1;
                case "CheckAGP":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + parameters1;
                case "AppraisalTextAGPList":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + parameters1;
                case "AppraisalTextAGPSave":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + parameters1 + ",@SeqNo,@ActionItem,@Value";

                case "AppraisalTextAPPList":
                    return "dbo.EPA_Appr_AppraisalData_APPList" + parameters1;
                case "AppraisalTextAPPSave":
                    return "dbo.EPA_Appr_AppraisalData_APPList" + parameters1 + ",@SeqNo,@ActionItem,@Value";

                case "AppraisalTextAPMList":
                    return "dbo.EPA_Appr_AppraisalData_APMList" + parameters1;
                case "AppraisalTextAPMSave":
                    return "dbo.EPA_Appr_AppraisalData_APMList" + parameters1 + ",@vDate,@Value";

             

                default:
                    return action;

            }
        }

    }

}
