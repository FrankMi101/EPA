using ClassLibrary;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class AppraisalContents
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


        public static List<Appraisee> Appraisee(object parameter)
        {
            return CommonList<Appraisee>("Appraisee", parameter);
        }



        public static string AppraisalRate(object parameter)
        {
            return CommonValue<string>("AppraisalRate", parameter);
        }

        public static string ObservationDateSave(object parameter)
        {
            return CommonValue<string>("ObservationDateSave", parameter);
        }
        public static string ObservationDate(object parameter)
        {
            return CommonValue<string>("ObservationDate", parameter);
        }
        public static string AppraisalText(object parameter)
        {
            return CommonValue<string>("AppraisalText", parameter);
        }
        public static string AppraisalTextSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextSave", parameter);
        }
        public static string AppraisalTextBPA(object parameter)
        {
            return CommonValue<string>("AppraisalTextBPA", parameter);
        }
        public static string AppraisalTextBPASave(object parameter)
        {
            return CommonValue<string>("AppraisalTextBPASave", parameter);
        }

        public static string AppraisalTextbyPageSave(object parameter)
        {
            return CommonValue<string>("AppraisalTextbyPageSave", parameter);
        }
        public static string NotesContent(object parameter)
        {
            return CommonValue<string>("NotesContent", parameter);
        }
        public static string NotesContentSave(object parameter)
        {
            return CommonValue<string>("NotesContentSave", parameter);
        }
        public static string AppraisalNotes(object parameter)
        {
            return CommonValue<string>("AppraisalNotes", parameter);
        }
        public static string AppraisalNotesSave(object parameter)
        {
            return CommonValue<string>("AppraisalNotesSave", parameter);
        }
        public static string RatingListContent(object parameter)
        {
            return CommonValue<string>("RatingListContent", parameter);
        }
        public static string RatingListContentSave(object parameter)
        {
            return CommonValue<string>("RatingListContentSave", parameter);
        }
        public static string CheckALP(object parameter)
        {
            return CommonValue<string>("CheckALP", parameter);
        }
     
        public static string Rubrics(object parameter)
        {
            return CommonValue<string>("Rubrics", parameter);
        }




        private static string GetSPInClass(string action)
        {
            string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category";

            string parameters1 = parameters + ",@Area,@ItemCode";

            string parameters2 = parameters + ",@DomainID,@CompetencyID";
            switch (action)
            {
                case "ObservationDateSave":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate" + parameters1 + ",@Date,@Value";
                case "ObservationDate":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate" + parameters1;
                case "AppraisalText":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameters1;
                case "AppraisalTextSave":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameters1 + ",@Value";
                case "CheckALP":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameters1;
                case "AppraisalTextBPA":
                    return "dbo.EPA_Appr_AppraisalData_TextBPA" + parameters1 + ",@SeqNo";
                case "AppraisalTextBPASave":
                    return "dbo.EPA_Appr_AppraisalData_TextBPA" + parameters1 + ",@SeqNo,@Value";
                case "AppraisalRate":
                    return "dbo.EPA_Appr_AppraisalData_Rate" + parameters1;
                case "IsTwoSatisfactory":
                    return "dbo.EPA_Appr_AppraisalData_TwoSatisfactory" + parameters1;
                case "IsPrincipalInitialSTR":
                    return "dbo.EPA_Appr_AppraisalData_PrincipalInitialSTR" + parameters1;
                case "NotesContent":
                    return "dbo.EPA_Appr_AppraisalData_Notes" + parameters1;
                case "NotesContentSave":
                    return "dbo.EPA_Appr_AppraisalData_Notes" + parameters1 + ",@Value";
                case "AppraisalNotes":
                    return "dbo.EPA_Appr_AppraisalData_NotesComments" + parameters;
                case "AppraisalNotesSave":
                    return "dbo.EPA_Appr_AppraisalData_NotesComments" + parameters + ",@Value";

                case "RatingListContent":
                    return "dbo.EPA_Appr_AppraisalData_ListRate" + parameters1;
                case "RatingListContentSave":
                    return "dbo.EPA_Appr_AppraisalData_ListRate" + parameters1 + ",@Value";
                //case "RatingListRate":
                //    return "dbo.EPA_Appr_AppraisalData_ListRate" + parameters1;
                //case "RatingListRateSave":
                //    return "dbo.EPA_Appr_AppraisalData_ListRate" + parameters1 + ",@Value";
                 case "AppraisalTextbyPageSave":
                    return "dbo.EPA_Appr_AppraisalData_byPage" + parameters1 + ",@SeqNo,@GoalItem,@Value";
                case "Rubrics":
                    return "dbo.EPA_Appr_DomainCompetencyRubric" + parameters2;

                default:
                    return action;

            }
        }

    }

}
