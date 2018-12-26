using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DataAccess
{
    public class WorkingAppraisee
    {
        public static string AppraisalYear;
        public static string EmployeeID;
        public static string SessionID;
        public WorkingAppraisee()
        { }

        public static string AppraisalCategory
        {
            get
            {
                if (HttpContext.Current.Session["appraisalcategory"] != null)
                {
                    return HttpContext.Current.Session["appraisalcategory"].ToString();
                }
                else
                {
                    return AppraiseeValue("AppraisalCategory");
                }

            }
            set
            {
                HttpContext.Current.Session["appraisalcategory"] = value;
                AppraiseeValue("AppraisalCategory", value);
            }
        }
        public static string AppraisalArea
        {
            get
            {
                if (HttpContext.Current.Session["appraisalarea"] != null)
                {
                    return HttpContext.Current.Session["appraisalarea"].ToString();
                }
                else
                {
                    return AppraiseeValue("AppraiseeArea");
                }

            }
            set
            {
                HttpContext.Current.Session["appraisalarea"] = value;
                AppraiseeValue("AppraisalArea", value); 
            }
        }
        public static string AppraisalCode
        {
            get
            {
                if (HttpContext.Current.Session["appraisalcode"] != null)
                {
                    return HttpContext.Current.Session["appraisalcode"].ToString();
                }
                else
                {       return  AppraiseeValue("AppraiseeCode");
                }
             }
            set
            {
                HttpContext.Current.Session["appraisalcode"] = value;
                AppraiseeValue("AppraisalCode", value);
            }
        }


        public static string AppraisalYearList
        {
            get
            {
                return AppraiseeValue("AppraisalYearList");
            }

        }
        public static string AppraisalSchoolCode
        {
            get
            {
                return AppraiseeValue("ApraisalSchool");
            }

        }
        public static string AppraisalSchoolName
        {
            get
            {
                return AppraiseeValue("ApraisalSchoolName");
            }

        }
        public static string AppraisalWorkingSession
        {
            get
            {
                return AppraiseeValue("WorkingSession");
            }

        }

        public static string AppraiserID
        {
            get
            {
                return AppraiseeValue("AppraiserID");
            }

        }
        public static string AppraiserName
        {
            get
            {
                return AppraiseeValue("AppraiserName");
            }

        }
        public static string Assignment
        {
            get
            {
                return AppraiseeValue("Assignment");
            }
            set
            {
                AppraiseeValue("Assignment", "", value);
            }
        }
        public static string AssignmentLink
        {
            get
            {
                return AppraiseeValue("AssignmentLink");
            }

        }
        public static string UserID
        {
            get
            {
                return AppraiseeValue("AppraiseeUserID");
            }

        }
        public static string AppraiseeName
        {
            get
            {
                return AppraiseeValue("AppraiseeName");
            }

        }
        public static string AppraisalPhase
        {
            get
            {
                return AppraiseeValue("AppraisalPhase");
            }

        }

        public static string AppraisalType
        {
            get
            {
                return AppraiseeValue("AppraisalType");
            }

        }
        public static string CurrentStatus
        {
            get
            {
                return AppraiseeValue("CurrentStatus");
            }

        }
        public static string CurrentProfile
        {
            get
            {
                return AppraiseeValue("CurrentProfile");
            }

        }
        
        public static string PreviousAppraisalCompleteStatus
        {
            get
            {
                return AppraiseeValue("preAppraisalCompleteStatus");
            }
        }
        public static string PreviousAppraisalYear
        {
            get
            {
                return AppraiseeValue("PreviousAppraisalYear");
            }
        }
        public static string PreviousYearSessionID
        {
            get
            {
                return AppraiseeValue("PreviousYearSessionID");
            }
        }
        public static string PreviousYearArea
        {
            get
            {
                return AppraiseeValue("PreviousYearArea");
            }
        }
        public static string PreviousYearAreaCode
        {
            get
            {
                return AppraiseeValue("PreviousYearAreaCode");
            }
        }
        public static string LastAppraisalResult
        {
            get
            {
                return AppraiseeValue("LastAppraisalResult");
            }

        }

        private static string AppraiseeValue(string operate)
        {
            try
            {
                string SP = "dbo.EPA_Appr_AppraisalProfile";

                MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[5];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, HttpContext.Current.User.Identity.Name, AppraisalYear, "0000", EmployeeID);
                return SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
            finally
            { }
        }
        private static void AppraiseeValue(string operate, string value)
        {
            try
            {
                string SP = "dbo.EPA_Appr_AppraisalProfile";
                MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[6];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, HttpContext.Current.User.Identity.Name, AppraisalYear, "0000", EmployeeID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 50, "@Value", value);
                SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }
        private static void AppraiseeValue(string operate, string value, string value2)
        {
            try
            {
                string SP = "dbo.EPA_Appr_AppraisalProfile";
                MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[7];
                myBaseParameters.SetupBaseParameters(ref myPara, operate, HttpContext.Current.User.Identity.Name, AppraisalYear, "0000", EmployeeID);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 50, "@Value", value);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 200, "@Value2", value2);
                SetSQLParameter.getMyDataValue(SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }
        public static void SetListValue(System.Web.UI.WebControls.DropDownList myListControl, string value)
        {
            myList.SetListValue(myListControl, value);
        }

        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string appraisalYear, string employeeID)
        {
            try
            {
                DataSet mydataset = myListReader(operate, userID, appraisalYear, employeeID);
                myList.SetLists(myListControl, mydataset);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }

        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string appraisalYear, string employeeID, string appraisalCategory)
        {
            try
            {
                DataSet mydataset = myListReader(operate, userID, appraisalYear, employeeID, appraisalCategory);
                myList.SetLists(myListControl, mydataset);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }

        }
        private static DataSet myListReader(string operate, string userID, string appraisalYear, string employeeID)
        {
            string SP = "dbo.EPA_Appr_AppraisalProfileList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[5];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, appraisalYear, "0000", employeeID);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        private static DataSet myListReader(string operate, string userID, string appraisalYear, string employeeID, string appraisalCategory)
        {
            string SP = "dbo.EPA_Appr_AppraisalProfileList";
            MyCommon.MyParameterDB[] myPara = new MyCommon.MyParameterDB[6];
            myBaseParameters.SetupBaseParameters(ref myPara, operate, userID, appraisalYear, "0000", employeeID);
            SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 10, "@Category", appraisalCategory);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
    }
}
