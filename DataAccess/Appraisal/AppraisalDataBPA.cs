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
    public class AppraisalDataBPA
    {

        public AppraisalDataBPA()
        { }

        public static DataSet AssignmentData(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_BPAInformation";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
      
        public static string AssignmentData(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string reviewDateFrom,string reviewDateTo, string reviewDateMid,string reviewDateFinal)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_BPAInformation";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[13];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@ReviewDateFrom", reviewDateFrom);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@ReviewDateTo", reviewDateTo);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 10, "@ReviewDateMid", reviewDateMid);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 10, "@ReviewDateFinal", reviewDateFinal);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
   
        public static string AssignmentDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ObservationDate";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        
        private static void SetupThisParameters(ref MyADO.MyParameterDB[] myPara, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@CompetencyID", competencyID);
        }
    }
}
 