using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AppraisalContentsStrategy
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalContentsStrategy");
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
        public static string ContentLabel(object parameter)
        {    return CommonValue<string>("ContentLabel", parameter);
         }
        public static string ContentText(object parameter)
        {
            return CommonValue<string>("ContentText", parameter);
        }
        public static string ContentTextSave(object parameter)
        {
            return CommonValue<string>("ContentTextSave", parameter);
         }
        public static string ContentCheckBox(object parameter)
        {
            return CommonValue<string>("ContentCheckBox", parameter);
        }
        public static string ContentCheckBoxSave(object parameter)
        {
            return CommonValue<string>("ContentCheckBoxSave", parameter);          
        }
  

        private static string GetSPInClass(string action)
        {
            string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category,@Area,@ItemCode";

           

            string parameters1 = parameters + ",@Area,@ItemCode";

            string parameters2 = parameters + ",@DomainID,@CompetencyID";
            switch (action)
            {
                case "ContentLabel":
                    return "dbo.EPA_Appr_AppraisalData_StrategyLabel" + parameters  ;
                case "ContentText":
                    return "dbo.EPA_Appr_AppraisalData_StrategyText" + parameters + ",@Column";
                case "ContentTextSave":
                    return "dbo.EPA_Appr_AppraisalData_StrategyText" + parameters + ",@Column,@Value";
                case "ContentCheckBox":
                    return "dbo.EPA_Appr_AppraisalData_StrategyCheck" + parameters;
                case "ContentCheckBoxSave":
                    return "dbo.EPA_Appr_AppraisalData_StrategyCheck" + parameters + ",@Value";

                case "Rubrics":
                    return "dbo.EPA_Appr_DomainCompetencyRubric" + parameters2;

                default:
                    return action;

            }
        }
  
    }
  
}
