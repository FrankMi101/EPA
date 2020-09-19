using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using BLL;
using ClassLibrary;

namespace EPA2
{
    public class WorkingAppraisee
    {
        public static string AppraisalCategory;
        public static string AppraisalSchoolCode;
        public static string AppraisalYear;
        public static string EmployeeID;
        public static string SessionID;
        public WorkingAppraisee()
        { }
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
        //public static string AppraisalSchoolCode
        //{
            
        //    get
        //    {
        //        if (HttpContext.Current.Session["appraisalschoolcode"] == null)
        //        {
        //              HttpContext.Current.Session["appraisalschoolcode"] = AppraiseeValue("ApraisalSchool"); 
        //        }
           
        //        return HttpContext.Current.Session["appraisalschoolcode"].ToString();
        //    }
       
        //    set
        //    {
        //        HttpContext.Current.Session["appraisalschoolcode"] = value;
        //        AppraiseeValue("ApraisalSchool", value);
        //    }

        //}
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
                //if (HttpContext.Current.Session["workingappraisalsession"] == null)
                //{
                //    HttpContext.Current.Session["workingappraisalsession"] = AppraiseeValue("WorkingSession");
                //}
                //return HttpContext.Current.Session["workingappraisalsession"].ToString();

                return AppraiseeValue("WorkingSession");

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
                AppraiseeValue("Assignment",  value);
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
                  var parameter = new
                {
                    Operate = operate,
                    UserID = HttpContext.Current.User.Identity.Name,
                    SchoolYear = AppraisalYear,
                    SchoolCode = AppraisalSchoolCode,
                    EmployeeID,
                    Category = AppraisalCategory
                  };
                return CommonExecute<string>.ValueOfT("dbo.EPA_Appr_AppraisalProfile @Operate, @UserID,@SchoolYear,@SchoolCode,@EmployeeID,@Category", parameter);
 
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
            finally
            { }
        }
        public static void AppraiseeValue(string operate, string value)
        {
            try
            {
                var parameter = new
                {
                    Operate = operate,
                    UserID = HttpContext.Current.User.Identity.Name,
                    SchoolYear = AppraisalYear,
                    SchoolCode = AppraisalSchoolCode,
                    EmployeeID = EmployeeID,
                    Category = AppraisalCategory,
                    Value = value
                };
                string SP = "dbo.EPA_Appr_AppraisalProfile @Operate, @UserID,@SchoolYear,@SchoolCode,@EmployeeID,@Category,@Value";
                string result = CommonExecute<string>.ValueOfT(SP, parameter);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

        public static void SetListValue(System.Web.UI.WebControls.DropDownList myListControl, string value)
        {
            AssemblingList.SetValue(myListControl, value);
        }

        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string appraisalYear, string employeeID)
        {
            try
            {
                var parameter = new
                {
                    Operate = operate,
                    UserID = userID,
                    SchoolYear = appraisalYear,
                    SchoolCode = AppraisalSchoolCode,
                    EmployeeID = employeeID,
                    Category = AppraisalCategory
                };
                string SP = "dbo.EPA_Appr_AppraisalProfileList @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@Category";
                var myListData = CommonExecute<CommonList>.ListOfT(SP, parameter);
                
                AssemblingList.SetLists(myListControl, myListData);
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
                var parameter = new
                {
                    Operate = operate,
                    UserID = userID,
                    SchoolYear = appraisalYear,
                    SchoolCode = AppraisalSchoolCode,
                    EmployeeID = employeeID,
                    Category = appraisalCategory
                };
                string SP = "dbo.EPA_Appr_AppraisalProfileList @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@Category";
                var myListData = CommonExecute<CommonList>.ListOfT(SP, parameter);
                AssemblingList.SetLists(myListControl, myListData);
 
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }

        }
       


    }
}
