using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess 
{
   public class UserLastWorking
    {
        static string SP = "dbo.EPA_sys_UserWorkingTrack";
       public UserLastWorking()
        { }
        public static string EmployeeID
        {
            get
            {
                return LastValue("WorkingUser" );
            }
            set
            {
                LastValue("WorkingUser", value);  
            }
        }
        public static string SchoolYear
        {
            get
            {
                return LastValue("WorkYear");
            }
            set
            {
                LastValue("WorkYear", value);
            }
        }
        public static string OpenSchoolYear
        {
            get
            {
                return LastValue("OpenSchoolYear");
            }
            set
            {
                LastValue("OpenSchoolYear", value);
            }
        }
        public static string SchoolCode
        {
            get
            {
                return LastValue("WorkUnit");
            }
            set
            {
                LastValue("WorkUnit", value);
            }
        }
        public static string SchoolName
        {
            get
            {
                return LastValue("SchoolName");
            }

        }
        public static string AppraisalSession
        {
            get
            {
                return LastValue("WorkSession");
            }
            set
            {
                LastValue("WorkSession", value);
            }
        }
        public static string AppraisalType
        {
            get
            {
                return LastValue("AppraisalCategory");
            }
            set
            {
                LastValue("AppraisalCategory", value);
            }
        }
        public static string AppraisalArea
        {
            get
            {
                return LastValue("AppraisalArea");
            }
            set
            {
                LastValue("AppraisalArea", value);
            }
        }
        public static string AppraisalItem
        {
            get
            {
                return LastValue("AppraisalItem");
            }
            set
            {
                LastValue("AppraisalItem", value);
            }
        }
        public static string AppraisalItemName
        {
            get
            {
                return LastValue("AppraisalItemName");
            }

        }
        public static string EmployeeName
        {
            get
            {
                return LastValue("EmployeeName");
            }

        }
        public static string WorkingListName
        {
            get
            {
                return LastValue("WorkingListName");
            }
        }
        public static string WorkingListAreaName
        {
            get
            {
                return LastValue("WorkingListAreaName");
            }

        }
        public static string ClientScreen
        {
            get
            {
                return LastValue("ClientScreen");
            }

        }
        private static string LastValue(string operate )
        {
            try
            {              
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[2];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, HttpContext.Current.User.Identity.Name);
               return   SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message;
                return "";
            }
            finally
            { }
        }
        private static void LastValue(string operate,   string value)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[3];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, HttpContext.Current.User.Identity.Name);
                SetSQLParameter.setParameterArray(myPara,  DbType.String, 2, 50, "@Value", value);
                SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }
        public static string LastValue(string userId, string operate, string value, string machin_name, string sccreen, string browser_type, string browser_version)
        {
            try
            {
                string SP = "dbo.EPA_sys_UserWorkingTrack";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
                SetupBaseParameters(ref myPara, "LastValue", userId);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 50, "@Value", value);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 30, "@MachinName", machin_name);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 30, "@ScreenSize", sccreen);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 30, "@BrowerType", browser_type);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 30, "@BrowerVersion", browser_version);
                return SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            {
                string myEx = ex.Message;
                return null;
            }
            finally
            { }
        }
        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
        }
    }
}
