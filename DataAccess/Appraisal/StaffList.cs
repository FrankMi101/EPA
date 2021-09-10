using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class StaffList
    {
        static string  sp = "dbo.EPA_Appr_AppraisalStaffList";
        public StaffList()
        { }

        public static DataSet AppraisalStaff(string userRole, string userID, string schoolYear, string schoolCode, string searchby,string searchValue )
        {
            try
            {
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[6];
                SetupThisParameters(ref myPara, userRole, userID, schoolYear, schoolCode, searchby, searchValue);
               // myBaseParameters.SetupBaseParameters(ref myPara, userRole, userID,schoolYear,schoolCode);
               // SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 30, "@Searchby", searchby);
               // SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 30, "@SearchValue", searchValue); 
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static DataSet AppraisalNoticeStaff(string userRole, string userID, string schoolYear, string schoolCode, string searchby, string searchValue, string noticeType,string noticeArea)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalStaffListNotice";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[8];
                SetupThisParameters(ref myPara, userRole, userID, schoolYear, schoolCode, searchby, searchValue);
                 SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 15, "@NoticeType", noticeType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@NoticeArea", noticeArea);
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static DataSet AppraisalHistory(string userRole, string userID, string schoolYear, string schoolCode, string searchby, string searchValue)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalStaffHistory";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[6];
                SetupThisParameters(ref myPara, userRole, userID, schoolYear, schoolCode, searchby, searchValue);
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static DataSet SchoolStaffList(string userRole, string userID, string schoolCode, string searchby, string searchValue)
        {
            try
            {
                string sp = "dbo.EPA_Org_StaffList";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[6];
                SetupThisParameters(ref myPara, userRole, userID, "", schoolCode, searchby, searchValue);
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static string StaffRollOver(string operate, string userID, string schoolYear, string schoolCode, string schoolYearTo)
        {
            try
            {
               
                string sp = "dbo.EPA_Appr_AppraisalProcess_RollOver";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, userID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 2, 8, "@FromSchoolYear", schoolYear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 3, 8, "@ToSchoolYear", schoolYearTo);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 8, "@SchoolCode", schoolCode);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        public static DataSet StaffRollOverList(string operate, string userID, string schoolYear, string schoolCode, string schoolYearTo)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProcess_RollOver";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
                myBaseParameters.SetupBaseParameters(ref myPara, "RollOverList", userID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 2, 8, "@FromSchoolYear", schoolYear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 3, 8, "@ToSchoolYear", schoolYearTo);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 8, "@SchoolCode", schoolCode);
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }

        private static void SetupThisParameters(ref MyADO.MyParameterDB[] myPara, string userRole, string userID, string schoolYear, string schoolCode, string searchby, string searchValue )
        {
           // MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[6];
            myBaseParameters.SetupBaseParameters(ref myPara, userRole, userID, schoolYear, schoolCode);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 30, "@Searchby", searchby);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 30, "@SearchValue", searchValue);

        }
    }
}
