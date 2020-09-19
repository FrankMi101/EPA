using ClassLibrary;
using System;
using System.IO;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
   
    public partial class Loading2 : System.Web.UI.Page
    {   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];
                string checkPage = Page.Request.QueryString["aID"];
                var queryValue = AppraisalPage.GetQueryValue(Page);
 
                if (checkPage == "" || checkPage == null) checkPage = goPage;
  
                goPage = CheckAndGetGoPage(goPage, queryValue);
                switch (goPage)
                {
                    case "Summary":
                        goPage = "Appraisal11_Summary.aspx"; // Page.Request.QueryString["aID"];
                        break;
                    case "SummaryTree":
                        goPage = "Appraisal11_SummaryTree.aspx?aID=" + checkPage; // Page.Request.QueryString["aID"];
                        break;
                    case "NotActive":
                        goPage = "Appraisal11_NotActive.aspx";
                        break;
                    case "NotReady":
                        goPage = "Appraisal11_NotReady.aspx";
                        break;
                    case "NotAllow":
                        goPage = "Appraisal11_NotAllowView.aspx";
                        break;
                    case "NotAppraiser":
                        goPage = "Appraisal11_NotAppraiser.aspx";
                        break;
                    case "ViewPermission":
                        goPage = "ViewPermission.aspx?aID=" + Page.Request.QueryString["pID"].Substring(0,3);
                        break;
                    default:
                        goPage = GetGoPagebyCode(goPage) + "?" +  AppraisalPage.GetQueryString(queryValue);
                        break;
                }

                PageURL.HRef = goPage;

            }
        }
        private string CheckAndGetGoPage(string goPage , QueryValue qeryStr)
        {
            if (goPage == "Summary") return goPage;
            if (WorkingAppraisee.CurrentStatus != "Active")
            {
                if (User.Identity.Name.ToLower() != WorkingAppraisee.UserID.ToLower())
                {
                    goPage = "NotActive";
                }
            }
            else
            {
                if (WorkingAppraisee.CurrentProfile != "Ready")
                { goPage = "NotReady"; }
                else
                {
                    if (WorkingProfile.UserRole == "Admin")
                    {
                        if (GetViewPermission(goPage, qeryStr) == "NotAllow")
                        {
                            goPage = "NotAllow";
                        }
                    }
                    else
                    {
                        // Login user same as appraisal selected user
                        if (User.Identity.Name.ToLower() == WorkingAppraisee.UserID.ToLower())
                        {
                            if (GetViewPermission(goPage, qeryStr) == "NotAllow")
                            {
                                goPage = "NotAllow";
                            }
                        }
                        else
                        {
                            if (User.Identity.Name.ToLower() != WorkingAppraisee.AppraiserID.ToLower())
                            {
                                string notCheckAppraisalMatchRole = WebConfig.getValuebyKey("NotCheckRole");
                                if (!notCheckAppraisalMatchRole.Contains(WorkingProfile.UserRoleLogin)) //if (notCheckAppraisalMatchRole.IndexOf( WorkingProfile.UserRoleLogin) == -1)
                                {
                                    goPage = "NotAppraiser";
                                }
                            }
                        }
                    }
                }
            }
            if (goPage.Substring(0, 3) != "Not")
            {
                string notCheckPage = WebConfig.getValuebyKey("NotCheckPage");//  "Summary,ALP95,AGP11,STR11";


                if (!notCheckPage.Contains(goPage)) //if (notCheckPage.IndexOf(goPage) == -1)
                {
                    if (CheckAppraisalProgressStep(goPage, qeryStr) != "Pass")
                    {

                        if (goPage == "SUM95")
                        { goPage = "ViewPermission"; }
                        else
                        { goPage = "SummaryTree"; }
                    }
                }
            }
            return goPage;

        }
        private string CheckAppraisalProgressStep(string code, QueryValue qeryStr)
        {
            try
            {
                //   string appraisalpagecode = "ALP11";
                // will add code later

                string category = qeryStr.Category;// WorkingAppraisee.AppraisalType;
                string area = code.Substring(0, 3);
                string sharePage = WebConfig.getValuebyKey("SharePage");

                if (sharePage.Contains(code))   //   if (sharePage.IndexOf(code) != -1)
                {
                    category = sharePage.Substring(0, 3);
                }
                WorkingProfile.PageCategory = category;
                WorkingProfile.PageArea = area;
                WorkingProfile.PageItem = code;

              //  string passKey = AppraisalProcess.CheckPageViewStepsGo("Get", User.Identity.Name, qeryStr.SchoolYear WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, category, area, code);
                string passKey = AppraisalProcess.CheckPageViewStepsGo("Get", User.Identity.Name, qeryStr.SchoolYear , qeryStr.SchoolCode, qeryStr.SessionID, qeryStr.EmployeeID, category, area, code);
                return passKey; //  "Pass";
            }
            catch
            {
                return "NoPass";
            }
        }
        private string GetGoPagebyCode(string code)
        {
            string rVal = "";

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
        private string GetViewPermission(string code, QueryValue qeryStr)
        {
            try
            {
                string permission = "Allow";

                string category = WorkingAppraisee.AppraisalType;
                string area = code.Substring(0, 3);

                string sharePage = WebConfig.getValuebyKey("SharePage");

                if (sharePage.IndexOf(code) != -1)
                {
                    category = sharePage.Substring(0, 3);
                }
                if (WorkingProfile.UserAppraisalRole == "Appraisee")
                {
                    string needViewPermissionPages = WebConfig.getValuebyKey("NeedViewPermissionPage");
                    if (needViewPermissionPages.Contains(code)) //if (notCheckAppraisalMatchRole.IndexOf( WorkingProfile.UserRoleLogin) == -1)
                    {
                        permission = AppraisalProcess.CheckPageViewPermission("Get", User.Identity.Name,  qeryStr.SchoolYear, qeryStr.SchoolCode, qeryStr.SessionID, qeryStr.EmployeeID, category, area, code, WorkingProfile.UserAppraisalRole);

                    }

                }

                return permission;

            }
            catch
            {
                return "NotAllow";
            }

        }
    }
}