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
    public class AppraisalDataAGP
    {

        public AppraisalDataAGP()
        { }
      
      
        //public static string AGPDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        //{
        //    string SP = "dbo.EPA_Appr_AppraisalData_AGPDate";
        //    MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
        //    myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
        //    return SetSQLParameter.getMyDataValue(SP, myPara);
        //}

        //public static string AGPDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date)
        //{
        //    string SP = "dbo.EPA_Appr_AppraisalData_AGPDate";
        //    MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[10];
        //    myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
 
        //    return SetSQLParameter.getMyDataValue(SP, myPara);
        //}
        //public static string AGPDate(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string Date, string Value)
        //{
        //    string SP = "dbo.EPA_Appr_AppraisalData_AGPDate";
        //    MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[11];
        //    myBaseParameters.SetupBaseParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@Date", Date);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

        //    return SetSQLParameter.getMyDataValue(SP, myPara);
        //}
       public static DataSet AGPWorkingList(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode )
        {
             string SP = "dbo.EPA_Appr_AppraisalData_AGPList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string AGPWorkingListContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_AGPList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string AGPWorkingListContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string SeqNo, string GoalItem, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_AGPList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[12];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@SeqNo", SeqNo);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 20, "@ActionItem", GoalItem);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 2500, "@Value", HttpContext.Current.Server.HtmlDecode(Value));
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
    }
}
 