using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class StaffProfile
    {
        static string  sp = "dbo.EPA_Appr_AppraisalStaffList";
        public StaffProfile()
        { }

        public static DataSet AppraisalStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID )
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID, schoolYear);    
                return SetSQLParameter.getMyDataSet(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        public static string AppraisalStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID, string unitID )
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID, schoolYear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 8, "@UnitID", unitID);
 

                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static string AppraisalStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID, string unitID, string apprStatus, string apprType, string apprCycle, string apprRole, string evidencLevel, string appraiser, string mentor, string timetype, string assignment,string comments)
        {
            try
            {
                string sp = "dbo.EPA_Appr_AppraisalProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[16];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID, schoolYear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 8, "@UnitID", unitID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 10, "@AppraisalStatus", apprStatus);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@AppraisalType", apprType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 10, "@AppraisalCycle", apprCycle);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 15, "@AppraisalRole", apprRole);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 10, 10, "@EvidenceLevel", evidencLevel);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 11, 30, "@Appraiser", appraiser);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 12, 30, "@Mentor", mentor);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 13, 10, "@TimeType", timetype);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 14, 100, "@Assignment", assignment);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 15, 150, "@Comments", comments);

                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static DataSet EmployeeStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID)
        {
            try
            {
                string sp = "dbo.EPA_Org_StaffProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID);
                return SetSQLParameter.getMyDataSet(sp, myPara);     
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        public static string EmployeeStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID, string unitID)
        {
            try
            {
                string sp = "dbo.EPA_Org_StaffProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 8, "@UnitID", unitID);

                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        public static string EmployeeStaffEdit(string action, string IDs, string userID, string schoolYear, string employeeID, string unitID, string firstName, string lastName, string status, string position, string positionType, string startDate, string endDate, string gender, string email, string timeType, string assignment, string comments)
        {
            try
            {
                string sp = "dbo.EPA_Org_StaffProfileEdit";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[16];
                SetupThisParameters(ref myPara, action, IDs, userID, employeeID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 10, "@UnitID", unitID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 30, "@FirstName", firstName);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 30, "@LastName", lastName);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 10, "@Gender", gender);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 30, "@email", email);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 10, "@Status", status);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 10, 150, "@Position", position);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 11, 30, "@PositionType", positionType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 12, 10, "@TimeType", timeType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 13, 10, "@StartDate", startDate);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 14, 10, "@EndDate", endDate);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 15, 100, "@Assignment", assignment);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 16, 250, "@Comments", comments);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string action, string IDs, string userID, string employeeID, string appraisalYear)
        {
            SetupThisParameters(ref myPara, action, IDs, userID, employeeID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 8, "@AppraisalYear", appraisalYear);
        }
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string action, string IDs, string userID, string employeeID )
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", action);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 10, "@IDs", IDs);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 30, "@UserID", userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 15, "@EmployeeID", employeeID);                                  
        }
     
    }
}
