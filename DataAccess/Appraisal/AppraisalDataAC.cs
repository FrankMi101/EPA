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
    public class AppraisalDataAC
    {

        public AppraisalDataAC()
        { }
        public static string AppraisalRate(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_Rate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string NotesContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string AppraisalRole )
        {
            string SP = "dbo.EPA_Appr_AppraisalData_NotesComments";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, AppraisalRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string NotesContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string AppraisalRole,   string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_NotesComments";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, AppraisalRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string TextContent( string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode) 
        {
            string SP = "dbo.EPA_Appr_AppraisalData_Text";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID,appraisalSession, category, area, itemCode);
             return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string TextContent(string action, string userID, string appraisalYear, string appraisalschool,  string employeeID,string appraisalSession,string category, string area, string itemCode, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_Text";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 5000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string TextContentB(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode,string column)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextBPA";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 20, "@Column", column);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string TextContentB(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string column, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextBPA";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 20, "@Column", column);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static DataTable TextDateContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara).Tables[0];
        }

        public static string TextDateContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Value, string vDate)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 500, "@Value", HttpContext.Current.Server.HtmlDecode(Value));
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@vDate",  vDate);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string NotesContent(string action,string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_Notes";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string NotesContent(string action,string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_Notes";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 250, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string ListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_List";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode );
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string ListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_List";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode );
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@Value", Value);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string RatingListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ListRate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string RatingListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_ListRate";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
            myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 1, "@Value", Value);

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string ReportName(string operate, string userID,  string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_Report_ReportName";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID,  category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static DataSet TextContentHistory(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextHistory";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
             return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet TextContentHistoryAGP(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string seqNo, string actionItem)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextHistoryAGP";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[11];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 2, "@SeqNo", seqNo);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 20, "@ActionItem", actionItem);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
    }
}
 