
using System;
using System.Data;
using System.Web;

namespace DataAccess
{

    public class UserProfile
    {
        public UserProfile()
        { }
        static string SP = "dbo.EPA_sys_LoginUserProfile";
   
        public static string Role
        {
            get
            {
                return getProfile("Role");
            }       
        }
        public static string Position
        {
            get
            {
                return getProfile("Position");
            }
        }
        public static string LoginUserName
        {
            get
            {
                return getProfile("LoginUserName");
            }
        }
        public static string LoginUserRole
        {
            get
            {
                return getProfile("LoginUserRole");
            }
        }
        public static string CurrentSchoolYear
        {
            get
            {
                return getProfile("CurrentSchoolYear");
            }
        }

        public static string LoginUserEmployeeID
        {
            get
            {
                return getProfile("LoginUserEmployeeID");
            }
        }
        //public static string ClientScreen
        //{
        //    get
        //    {
        //        return getProfile("ClientScreen");
        //    }
        //}

        private static string getProfile(string pType)
        {
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[2];
            SetupBaseParameters(ref myPara, pType, HttpContext.Current.User.Identity.Name);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
 
        private static void SetupBaseParameters(ref MyCommon.MyParameterDB[] myPara , string operate,string userID)
        {
           SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
           SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID );
        }
        public static string UserLoginRole(string userId)
        {
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[2];
            SetupBaseParameters(ref myPara, "Role", userId);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        //public static string TrackInfo(string userID, string operate )
        //{
        //    try
        //    {
        //        string SP = "dbo.EPA_sys_UserWorkingTrack";
        //        MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[2];
        //        SetupBaseParameters(ref myPara, operate, userID);
        //        return SetSQLParameter.getMyDataValue(SP, myPara);
        //    }
        //    catch (Exception ex)
        //    {
        //        string myEx = ex.Message;
        //        return null;
        //    }
        //    finally
        //    { }
        //}
        //public static string TrackInfo(string userID, string operate, string value)
        //{
        //    try
        //    {
        //        string SP = "dbo.EPA_sys_UserWorkingTrack";
        //        MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[2];
        //        SetupBaseParameters(ref myPara, operate, userID);
        //        SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 50, "@Value", value);
        //        return SetSQLParameter.getMyDataValue(SP, myPara);
        //    }
        //    catch (Exception ex)
        //    {
        //        string myEx = ex.Message;
        //        return null;
        //    }
        //    finally
        //    { }
        //}
        //public static string LastValue(string userId, string operate)
        //{
        //    try
        //    {
        //        string SP = "dbo.EPA_sys_UserWorkingTrack";
        //        MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[2];
        //        SetupBaseParameters(ref myPara, operate, userId);
        //        return SetSQLParameter.getMyDataValue(SP, myPara);
        //    }
        //    catch (Exception ex)
        //    {
        //        string myEx = ex.Message;
        //        return null;
        //    }
        //    finally
        //    { }
        //}
        //public static string LastValue(string userId, string operate, string value)
        //{
        //    try
        //    {
        //        string SP = "dbo.EPA_sys_UserWorkingTrack";
        //        MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[3];
        //        SetupBaseParameters(ref myPara, operate, userId);
        //        SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 50, "@Value", value);
        //        return SetSQLParameter.getMyDataValue(SP, myPara);
        //    }
        //    catch (Exception ex)
        //    {
        //        string myEx = ex.Message;
        //        return null;
        //    }
        //    finally
        //    { }
        //}
    }
}


