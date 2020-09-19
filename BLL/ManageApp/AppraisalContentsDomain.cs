using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public  class AppraisalContentsDomain
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action,  "AppraisalContentsDomain");
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

        public static List<BuildLookForsList> LookForsList(object parameter)
        {
            return CommonList<BuildLookForsList>("LookForsList", parameter);
        }
        public static List<LookFors> LookForsbyCompetency(object parameter)
        {
            return CommonList<LookFors>("LookForsbyCompetency", parameter);
        }

        public static string LookForsListSave(object parameter)
        {
            return CommonValue<string>("LookForsListSave", parameter);
        }
        public static List<Appraisee> Appraisee(object parameter)
        {
            return CommonList<Appraisee>("Appraisee", parameter);
        }
        public static List<AppraisalComptency> CompetencyList(object parameter)
        {
            return CommonList<AppraisalComptency>("CompetencyList", parameter);
        }
        public static List<AppraisalComptency> CompetencyListForLOG(object parameter)
        {
            return CommonList<AppraisalComptency>("CompetencyListForLOG", parameter);
        }
        public static int CompetencyListCount(object parameter)
        {
            return CommonValue<int>("CompetencyListCount", parameter);
        }
        public static string ObservationDateSave(object parameter)
        {
            return CommonValue<string>("ObservationDateSave", parameter);
        }
        public static string ObservationDate(object parameter)
        {
            return CommonValue<string>("ObservationDate", parameter);
         }
        

        private static string GetSPInClass(string action)
        {
            string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category";

            string parameters1 = parameters + ",@Area,@ItemCode";

            string parameters2 = parameters1 + ",@DomainID,@CompetencyID,@LookForsID,@ActionRole,@ObjRole";
            switch (action)
            {
                case "ObservationDateSave":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate" + parameters1 + ",@Date,@Value";
                case "ObservationDate":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate" + parameters1;
                case "AppraisalText":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameters1;
                case "CompetencyList":
                    return "dbo.EPA_Appr_AppraisalProcess_CompetencyList" + parameters + ",@DomainID";
                case "CompetencyListCount":
                    return "dbo.EPA_Appr_AppraisalProcess_CompetencyList" + parameters + ",@DomainID";
                case "CompetencyListForLOG":
                    return "dbo.EPA_Appr_AppraisalProcess_CompetencyListForLOG" + parameters + ",@DomainID";
                case "LookForsList":
                    return "dbo.EPA_Appr_AppraisalData_LookForsList" + parameters2  ;
                case "LookForsListSave":
                    return "dbo.EPA_Appr_AppraisalData_LookForsList" + parameters2 + ",@LogDate,@LogCheck,@AllowView,@Comments";
                 case "LookForsListGet":
                    return "dbo.EPA_Appr_AppraisalData_LookForsList" + parameters2 + ",@ActionRole,@ObjRole,@LogDate,@LogCheck,@AllowView";
                  case "LookForsbyCompetency":
                    return "dbo.EPA_Appr_AppraisalData_LookForsbyCompetency" + parameters2;

                case "TextDomainEvidenceLog":
                  return "dbo.dbo.EPA_Appr_AppraisalData_TextDomainEvidenceLog" + parameters2 + ",@ActionRole";

                case "Rubrics":
                    return "dbo.EPA_Appr_DomainCompetencyRubric" + parameters2;

                default:
                    return action;

            }
        }
  
    }
 
}
