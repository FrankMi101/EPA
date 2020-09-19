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
                if (HttpContext.Current.Session["appraisalcategory"] == null)
                {
                   HttpContext.Current.Session["appraisalcategory"]= AppraiseeValue("AppraisalCategory");
                }
                
                return HttpContext.Current.Session["appraisalcategory"].ToString();

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
                if (HttpContext.Current.Session["appraisalarea"] == null)
                {
                      HttpContext.Current.Session["appraisalarea"]= AppraiseeValue("AppraiseeArea");
                }
                return HttpContext.Current.Session["appraisalarea"].ToString();
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
                if (HttpContext.Current.Session["appraisalcode"] == null)
                {
                      HttpContext.Current.Session["appraisalcode"]= AppraiseeValue("AppraisalCode");
                }
                return HttpContext.Current.Session["appraisalcode"].ToString();
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
                if (HttpContext.Current.Session["appraisalschoolcode"] == null)
                {
                      HttpContext.Current.Session["appraisalschoolcode"] = AppraiseeValue("ApraisalSchool"); 
                }
           
                return HttpContext.Current.Session["appraisalschoolcode"].ToString();
            }
       
            set
            {
                HttpContext.Current.Session["appraisalschoolcode"] = value;
                AppraiseeValue("ApraisalSchool", value);
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
                if (HttpContext.Current.Session["workingappraisalsession"] == null)
                {
                    HttpContext.Current.Session["workingappraisalsession"] = AppraiseeValue("WorkingSession");
                }
                return HttpContext.Current.Session["workingappraisalsession"].ToString();
               
            }
            set {
                HttpContext.Current.Session["workingappraisalsession"] = value;
            }

        }

        public static string AppraiserID
        {
           get
            {
                if (HttpContext.Current.Session["appraiserid"] == null)
                {
                   HttpContext.Current.Session["appraiserid"] = AppraiseeValue("AppraiserID");                 
                }
                return HttpContext.Current.Session["appraiserid"].ToString();
            }
            set
            {
                HttpContext.Current.Session["appraiserid"] = value;
             //   AppraiseeValue("AppraiserID", value);
            }

        }
        public static string AppraisalPhase
        {
            get
            {
                if (HttpContext.Current.Session["appraiserphase"] == null)
                {
                    HttpContext.Current.Session["appraiserphase"] = AppraiseeValue("AppraisalPhase");
                }
                return HttpContext.Current.Session["appraiserphase"].ToString();              
            }
            set {
                HttpContext.Current.Session["appraiserphase"] = value; 
            }

        }

        public static string AppraisalType
        {
            get
            {
                if (HttpContext.Current.Session["appraisaltype"] == null)
                {
                    HttpContext.Current.Session["appraisaltype"] = AppraiseeValue("AppraisalType");
                }
                return HttpContext.Current.Session["appraisaltype"].ToString();
               
            }
            set {
                HttpContext.Current.Session["AppraisalType"] = value;
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

        public static string AppraiseeValue(string operate)
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
