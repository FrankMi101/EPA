using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public  class AppraisalContentsCompetency
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action,  "AppraisalContentsCompetency");
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
            string parameters = "  @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode, @DomainID, @CompetencyID";
   

            switch (action)
            {
                case "Notes":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + parameters  ;
                case "Rate":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + parameters;
                case "NotesRate":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + parameters;
                case "Save":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + parameters + ",@Rate,@Value";
                case "SaveComments":
                    return "dbo.EPA_Appr_AppraisalData_TextCompetency" + parameters + ",@Rate,@Value";
                case "GetLog":
                return "dbo.EPA_Appr_AppraisalData_TextDomainLOG" + parameters + ",@ActionRole";
                case "SaveLog":
                    return "dbo.EPA_Appr_AppraisalData_TextDomainLOG" + parameters + ",@ActionRole,@Value";

                default:
                    return action;

            }
        }
  
    }
 
}
