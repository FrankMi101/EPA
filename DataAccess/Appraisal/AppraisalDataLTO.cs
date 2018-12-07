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
    public class AppraisalDataLTO
    {

        public AppraisalDataLTO()
        { }

        public static DataSet AssignmentData(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LTOAssignment";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet LTOAppraisalCompetencyList(string action, string userID, string category, string area, string itemCode,string aYear  )
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsbyCompetencyLTO";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            myBaseParametersB.SetupBaseParameters(ref myPara, action, userID, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 8, "@Year", aYear);
             return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet LTOAppraisalCompetencyList(string action, string userID, string category, string area, string itemCode, string aYear, string CompenencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsbyCompetencyLTO";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
            myBaseParametersB.SetupBaseParameters(ref myPara, action, userID, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 8, "@Year", aYear);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@Competency", CompenencyID);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string AssignmentData(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string DateS,string DateE, string Month,string Subject)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LTOAssignment";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[13];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@StartDate", DateS);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@EndDate", DateE);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 10, "@Month", Month);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 100, "@Subject", Subject);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string AssignmentText(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LTOAssignment";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string AssignmentText(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LTOAssignmentText";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 100, "@Value", value);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string AssignmentDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationDate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@CompetencyID", competencyID);
        }
    }
}
 