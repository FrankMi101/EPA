using BLL;
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPA2
{

    public class AppraisalDataGrid : BaseData
    {
        public AppraisalDataGrid()
        {

        }
  
        public static List<T> WorkingList<T>(string workingArea, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
           // string sp = GetSP(workingArea);
            AppraisalComment parameter = CommonParameters.GetCommentParameter(action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, itemCode, category, area);
            return AppraisalContentsAGP.CommonList<T>(workingArea, parameter);
        }
        public static string WorkingListContent(string workingArea, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
           // string sp = GetSP(workingArea);
            AppraisalComment parameter = CommonParameters.GetCommentParameter(action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, itemCode, category, area);
            return AppraisalContentsAGP.CommonValue<string>(workingArea, parameter);
        }
        public static string WorkingListContent(string workingArea, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string seqNo, string goalItem, string value)
        {
          //  string sp = GetSP(workingArea);
            AppraisalComment parameter = CommonParameters.GetCommentParameter(action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, itemCode, category, area, goalItem, seqNo, value);
               return AppraisalContentsAGP.CommonValue<string>(workingArea, parameter);

        }

        private static string GetSP(string action)
        {
            string para = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SeesionID,@Category,@Area,@ItemCode";
            string paraValue = ", @SeqNo, @GoalItem, @Value";
            switch (action)
            {
                case "AGP":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + para;
                case "AGPValue":
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + para + paraValue;
                case "APP":
                    return "dbo.EPA_Appr_AppraisalData_APPList" + para;
                case "APPValue":
                    return "dbo.EPA_Appr_AppraisalData_APPList" + para + paraValue;
                case "AIP":
                    return "dbo.EPA_Appr_AppraisalData_AIPList" + para;
                case "AIPValue":
                    return "dbo.EPA_Appr_AppraisalData_AIPList" + para + paraValue;
                case "AIP2":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + para;
                case "AIP2Value":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + para + paraValue;

                default:
                    return "dbo.EPA_Appr_AppraisalData_AGPList" + para;
            }

        }


    }
}
 