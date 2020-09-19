using System;
using System.Collections.Generic;

namespace BLL
{
    public class AppraisalContentsLTO
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalContents");
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
        private static string GetSPInClass(string action)
        {
            string parameters = " @Operate,@UserID,@Category,@Area,@Code";
            string parameters1 = parameters + ",@SchoolYear,@SchoolCode,@EmployeeID,@SessionID";
            string parameters2 = parameters1 + ",@StartDate,@EndDate,@Month,@Subject";



            switch (action)
            {
                case "LTOAppraisalCompetencyList":
                    return "dbo.EPA_Appr_AppraisalData_LookForsbyCompetencyLTO" + parameters;
                case "LTOAppraisalLookingForList":
                    return "dbo.EPA_Appr_AppraisalData_LookForsbyCompetencyLTO" + parameters + ",@Competency";
                case "AssignmentDataList":
                    return "dbo.EPA_Appr_AppraisalData_LTOAssignment" + parameters1;
                 case "AssignmentDataListSave":
                    return "dbo.EPA_Appr_AppraisalData_LTOAssignment" + parameters2;
               case "AssignmentData":
                    return "dbo.EPA_Appr_AppraisalData_LTOAssignment" + parameters1;
                case "AssignmentDataText":
                    return "dbo.EPA_Appr_AppraisalData_LTOAssignmentText" + parameters1 + ",@Value";

                case "AssignmentDate":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate" + parameters1 + ",@Date,@Value";


                default:
                    return action;

            }
        }
    }



}
