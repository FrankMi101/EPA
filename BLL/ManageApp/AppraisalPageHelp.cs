using ClassLibrary;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class AppraisalPageHelp
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalPageHelp");
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


        public static string PageHelp(string action,TitleHelp parameter )
        { 
                parameter.Operate = action;
                return CommonValue<string>(action, parameter); 
        }


        public static string DocFile(object parameter)
        {
            return CommonValue<string>("DocFile", parameter);
        }
        public static string PageItem(object parameter)
        {
            return CommonValue<string>("PageItem", parameter);
        }
        public static string PageNext(object parameter)
        {
            return CommonValue<string>("PageNext", parameter);
        }

        public static string PagePrevious(object parameter)
        {
            return CommonValue<string>("PagePrevious", parameter);
        }
        public static string PageActiveFor(object parameter)
        {
            return CommonValue<string>("PageActiveFor", parameter);
        }
        public static string PageRecover(object parameter)
        {
            return CommonValue<string>("PageRecover", parameter);
        }
        public static string PageHelp(object parameter)
        {
            return CommonValue<string>("PageHelp", parameter);
        }
        public static string PageEP(object parameter)
        {
            return CommonValue<string>("PageEP", parameter);
        }

        public static string PDFReportName(object parameter)
        {
            return CommonValue<string>("PDFReportName", parameter);
        }
        public static string ReportName(object parameter)
        {
            return CommonValue<string>("ReportName", parameter);
        }
        private static string GetSPInClass(string action)
        {

            string parameters = " @Operate, @UserID, @Category, @Area, @Code";

            switch (action)
            {
                case "AppraisalPageTitle":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "AppraisalPageItem":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "DocFile":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageItem":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageNext":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PagePrevious":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageActiveFor":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageRecover":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageHelp":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PageEP":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "PDFReportName":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;
                case "ReportName":
                    return "dbo.EPA_Appr_AppraisalProcess_GoPage" + parameters;

                default:
                    return action;

            }
        }

    }
}
