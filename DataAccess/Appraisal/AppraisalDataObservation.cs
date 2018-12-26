using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Web;

namespace DataAccess
{
    public class AppraisalDataObservation
    {

        public AppraisalDataObservation()
        { }
      
      
        public static string ObservationDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationDate";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string ObservationDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationDate";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
 
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string ObservationDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationDate";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataSet ObservationList(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode )
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string ObservationList(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[11];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        
        public static string ObservationList(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID,string check,  string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[13];
            SetupThisParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 1, "@Check", check);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 250, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        private static void SetupThisParameters(ref MyCommon.MyParameterDB[] myPara, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@CompetencyID", competencyID);
        }
    }
}
 