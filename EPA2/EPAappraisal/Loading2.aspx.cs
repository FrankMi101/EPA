using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.IO;

namespace EPA2.EPAappraisal
{
    public partial class Loading2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"];
                if (WorkingAppraisee.CurrentStatus != "Active")
                {
                    if (User.Identity.Name.ToLower() != WorkingAppraisee.UserID.ToLower())
                    {
                        GoPage = "NotActive";
                    }
                }
                else
                {
                    if (WorkingAppraisee.CurrentProfile != "Ready")
                    { GoPage = "NotReady"; }
                    else
                    {
                        if (WorkingProfile.UserRole == "Admin")
                        {
                            if (getViewPermission(GoPage) == "NotAllow")
                            {
                                GoPage = "NotAllow";
                            }
                        }
                        else
                        {
                            // Login user same as appraisal selected user
                            if (User.Identity.Name.ToLower() == WorkingAppraisee.UserID.ToLower())
                            {
                                if (getViewPermission(GoPage) == "NotAllow")
                                {
                                    GoPage = "NotAllow";
                                }
                            }
                            else
                            {   if (User.Identity.Name.ToLower() != WorkingAppraisee.AppraiserID.ToLower())
                                {
                                    string NotCheckAppraisalMatchRole = WebConfig.getValuebyKey("NotCheckRole");
                                    if (NotCheckAppraisalMatchRole.IndexOf( WorkingProfile.UserRoleLogin) == -1)
                                    {
                                        GoPage = "NotAppraiser";
                                    }
                                }
                            }
                        }
                    }
                }
                if (GoPage.Substring(0, 3) != "Not")
                {
                    string NotCheckPage = WebConfig.getValuebyKey("NotCheckPage");//  "Summary,ALP95,AGP11,STR11";
                    if (NotCheckPage.IndexOf(GoPage) == -1)
                    {
                        if (CheckAppraisalProgressStep(GoPage) != "Pass")
                        {
                            if (GoPage == "SUM95")
                            { GoPage = "ViewPermission"; }
                            else
                            { GoPage = "Summary"; }
                        }
                    }
                }

                switch (GoPage)
                {
                    case "Summary":
                        GoPage = "Appraisal11_Summary.aspx?aID=" + Page.Request.QueryString["aID"];
                        break;
                    case "NotActive":
                        GoPage = "Appraisal11_NotActive.aspx";
                        break;
                    case "NotReady":
                        GoPage = "Appraisal11_NotReady.aspx";
                        break;
                    case "NotAllow":
                        GoPage = "Appraisal11_NotAllowView.aspx";
                        break;
                    case "NotAppraiser":
                        GoPage = "Appraisal11_NotAppraiser.aspx";
                        break;
                    case "ViewPermission":
                        GoPage = "ViewPermission.aspx";
                        break;
                    default:
                        GoPage = getGoPagebyCode(GoPage);
                        break;
                }

                PageURL.HRef = GoPage;

            }
        }
        private string CheckAppraisalProgressStep(string code)
        {
            try
            {
                //   string appraisalpagecode = "ALP11";
                // will add code later
                string schoolyear = WorkingAppraisee.AppraisalYear;
                string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                string sessionid = WorkingAppraisee.SessionID;
                string employeeid = WorkingAppraisee.EmployeeID;
                string phase = WorkingAppraisee.AppraisalPhase;
                string category = WorkingAppraisee.AppraisalType;
                string area = code.Substring(0, 3);
                string SharePage = WebConfig.getValuebyKey("SharePage");

                if (SharePage.IndexOf(code) != -1)
                {
                    category = SharePage.Substring(0, 3);
                }
                WorkingProfile.PageCategory = category;
                WorkingProfile.PageArea = area;
                WorkingProfile.PageItem = code;

                string PassKey = AppraisalProcess.CheckPageViewStepsGo("Get", User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
                return PassKey; //  "Pass";
            }
            catch
            {
                return "NoPass";
            }
        }
        private string getGoPagebyCode(string code)
        {
            string rVal = "";
            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string sessionid = WorkingAppraisee.SessionID;
            string employeeid = WorkingAppraisee.EmployeeID;
            string phase = WorkingAppraisee.AppraisalPhase;
            string category = WorkingAppraisee.AppraisalType;
            string area = code.Substring(0, 3);
            if (code == "SUM5")
            { code = "SUM51"; }
            WorkingAppraisee.AppraisalArea = area;
            WorkingAppraisee.AppraisalCode = code;
            rVal = AppraisalProcess.AppraisalPageItem("PageItem", User.Identity.Name, category, area, code);

            if (!File.Exists(Server.MapPath(rVal)))
            { rVal = "Appraisal11_NotExists.aspx?pID=" + rVal; }

            return rVal;
        }
        private string getViewPermission(string code)
        {
            try
            {
                string rVal = "";
                string schoolyear = WorkingAppraisee.AppraisalYear;
                string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                string sessionid = WorkingAppraisee.SessionID;
                string employeeid = WorkingAppraisee.EmployeeID;
                string phase = WorkingAppraisee.AppraisalPhase;
                string category = WorkingAppraisee.AppraisalType;
                string area = code.Substring(0, 3);
                string SharePage = WebConfig.getValuebyKey("SharePage");

                if (SharePage.IndexOf(code) != -1)
                {
                    category = SharePage.Substring(0, 3);
                }
                rVal = AppraisalProcess.CheckPageViewPermission("Get", User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code, WorkingProfile.UserAppraisalRole);
                return rVal;
            }
            catch
            {
                return "NotAllow";
            }

        }
    }
}