using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using BLL;
using ClassLibrary;

namespace DataAccess
{
    public class SignatureProcess
    {
      static string SP = "dbo.EPA_Appr_AppraisalProcess_SignOffSignature";
      public SignatureProcess()
        { }
        public static string SignOffAction(string RoleType,string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_SignOffAction";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);

        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.SignOffName(parameter);
        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter,string action)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.SignOffNameSave(parameter);
        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter,string action,string action2)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.SignOffNameEnforce(parameter);
        }

        public static string SignOffName(string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole)
        {
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);

        }
        public static string SignOffName(string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole,string signOffName, string signOffDate, string signOffAction)
        {
             MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[12];
            SetupThisParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 50, "@SignOffName", signOffName);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 30, "@SignOffDate", signOffDate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 30, "@SignOffAction", signOffAction);
            return SetSQLParameter.getMyDataValue(SP, myPara);

        }
        public static string SignOffName(string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole, string signOffName, string signOffDate, string signOffAction,string enforceSignoff)
        {
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[13];
            SetupThisParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 50, "@SignOffName", signOffName);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 30, "@SignOffDate", signOffDate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 30, "@SignOffAction", signOffAction);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 10, "@EnforceSignOff", enforceSignoff);
            return SetSQLParameter.getMyDataValue(SP, myPara);

        }

        public static string SignOffDate(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.SignOffDate(parameter);
        }
        public static string SignOffDate(string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode,   string userRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_SignOffDate";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
             return SetSQLParameter.getMyDataValue(SP, myPara);

        }
        public static string SignOffComplete(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.SignOffComplete(parameter);
        }
        public static string SignOffComplete(string CheckType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_SignOffComplete";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[9];
            SetupThisParameters(ref myPara, CheckType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, itemCode, userRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string NoticeDate(string RoleType, AppraisalCommentNoticeDate parameter)
        {
            parameter.Operate = RoleType;
            return AppraisalSignOff.NoticeDate(parameter);
        }
        public static string NoticeDate(string CheckType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string noticeType, string noticeArea )
        {
            string SP = "dbo.EPA_Appr_AppraisalProcess_NoticeDate";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[8];
            myBaseParameters.SetupBaseParameters(ref myPara, CheckType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 30, "@NoticeType", noticeType);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@NoticeArea", noticeArea); 
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string DigitalSignature(string Operate, string userID,  string employeeID )
        {
            string SP = "dbo.EPA_sys_UserDigitalSignature";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[3];
            myBaseParameters.SetupBaseParameters(ref myPara, Operate, userID );
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 10, "@EmployeeID", employeeID);
            return SetSQLParameter.getMyDataValue(SP, myPara);


        }

        public static string DigitalSignature(string Operate, string userID, string employeeID, string createtime, string digitalKey)
        {
            string SP = "dbo.EPA_sys_UserDigitalSignature";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[5];
            myBaseParameters.SetupBaseParameters(ref myPara, Operate, userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 10, "@EmployeeID", employeeID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 30, "@CreateTime", createtime);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 250, "@DigitalKey", digitalKey);
            return SetSQLParameter.getMyDataValue(SP, myPara);


        }
 
        private static void SetupThisParameters(ref MyCommon.MyParameterDB[] myPara, string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, RoleType, userID, appraisalYear, appraisalschool, employeeID, appraisalSession);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@Category", category);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 10, "@ItemCode", itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 10, "@UserRole", userRole);

        }
    }
}
