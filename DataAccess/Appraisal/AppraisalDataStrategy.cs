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
    public class AppraisalDataStrategy
    {

        public AppraisalDataStrategy()
        { }
     
        public static string LabelContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_StrategyLabel";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_StrategyCheck";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string CheckContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_StrategyCheck";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@Value",  Value );

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string TextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Column)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_StrategyText";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Column", Column);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string TextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Column, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_StrategyText";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Column", Column);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 500, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
   
     
    }
}
 