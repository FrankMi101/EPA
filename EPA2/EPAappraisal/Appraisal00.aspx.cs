using ClassLibrary;
using System;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
    public partial class Appraisal00 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeid = Page.Request.QueryString["tID"];
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string category = Page.Request.QueryString["type"];
               // string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + "Appraisal1" + "&type=" + category;

                var queryValue = AppraisalPage.GetQueryValue(Page);
                var parameter = AppraisalPage.GetQueryString(queryValue);

                hfApprSchool.Value = schoolcode;
                hfApprYear.Value = schoolyear;
                hfApprEmployeeID.Value = employeeid;
                hfTeacherName.Value = tName;
                WorkingAppraisee.AppraisalYear = schoolyear;
                WorkingAppraisee.AppraisalSchoolCode = schoolcode;
                WorkingAppraisee.EmployeeID = employeeid;
                WorkingAppraisee.AppraisalCategory = category;
                WorkingAppraisee.AppraisalPhase = phase;
                WorkingAppraisee.AppraisalType = category;
               
                hfParameters.Value = parameter;

                WorkingAppraisee.SetLists(ddlSchoolYear, "AppraisalYearList", User.Identity.Name, schoolyear, employeeid, category);
                AppraisalPage.SetListValue(ddlSchoolYear, schoolyear); 
                SetUpAppraisalSession();


                WorkingProfile.UserAppraisalRole = AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);

                SetPageAttribution();
                LoadAppraisalPage("Initial");
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = Page.Request.QueryString["type"];
            hfPageID.Value = "Appraisal";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.EmployeeID = Page.Request.QueryString["tID"];
            SetHelpDocumentLink();
        }

        private void SetHelpDocumentLink()
        {
            switch (hfCategory.Value)
            {
                case "PPA":
                    DocLink1.HRef = "javascript:OpenAppraisalDocument('OLF')";
                    DocLink1.InnerText = "Ontario Leadership Framework";
                    DocLink2.HRef = "javascript:OpenAppraisalDocument('PPAManual')";
                    DocLink2.InnerText = "Ontario Princiapl/VP Performance Appraisal Manual";
                    DocLink4.HRef = "javascript:OpenAppraisalDocument('APPChat')";
                    DocLink4.InnerText = "PPA Work flow";
                    DocLink5.HRef = "javascript:OpenAppraisalDocument('AGPChat')";
                    DocLink5.InnerText = "AGP Work flow";

                    break;
                case "TPA":
                    DocLink1.HRef = "javascript:OpenAppraisalDocument('GuidelineE')";
                    DocLink1.InnerText = "Ministry Guideline for Experienced Teacher ";
                    DocLink2.HRef = "javascript:OpenAppraisalDocument('FAQ')";
                    DocLink2.InnerText = "FAQ on Teacher Performance Appraisal";
                    break;
                case "NTP":
                    DocLink1.HRef = "javascript:OpenAppraisalDocument('GuidelineNTIP')";
                    DocLink1.InnerText = "Ministry Guideline for New Teacher Induction Program";
                    DocLink2.HRef = "javascript:OpenAppraisalDocument('FAQ')";
                    DocLink2.InnerText = "FAQ on Teacher Performance Appraisal";
                    DocLink5.HRef = "javascript:OpenAppraisalDocument('NTIPProcess')";
                    DocLink5.InnerText = "NTIP Process";
                    break;
                default:
                    DocLink1.HRef = "#";
                    DocLink1.InnerText = "";
                    DocLink2.HRef = "#";
                    DocLink2.InnerText = "";
                    break;
            }
        }
        private void SetUpAppraisalSession()
        {

            WorkingAppraisee.SetLists(ddlSession, "AppraisalSessionList", User.Identity.Name, ddlSchoolYear.SelectedValue, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalCategory);
            string currentAppraisalSession = WorkingAppraisee.AppraisalWorkingSession;
            WorkingAppraisee.SetListValue(ddlSession, currentAppraisalSession);
            hfApprSession.Value = currentAppraisalSession;
            WorkingAppraisee.SessionID = currentAppraisalSession;

        }
        protected void DdlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            //  WorkingProfile.SchoolYear = ddlSchoolYear.SelectedValue;
            //  UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            hfApprYear.Value = ddlSchoolYear.SelectedValue;
            WorkingAppraisee.AppraisalYear = ddlSchoolYear.SelectedValue;
            WorkingAppraisee.AppraisalSchoolCode = WorkingAppraisee.AppraiseeValue("ApraisalSchool");
            WorkingAppraisee.AppraisalCategory = WorkingAppraisee.AppraiseeValue("AppraisalCategory");
            WorkingAppraisee.AppraiserID = WorkingAppraisee.AppraiseeValue("AppraiserID");
            WorkingAppraisee.AppraisalPhase = WorkingAppraisee.AppraiseeValue("AppraisalPhase");
            WorkingAppraisee.AppraisalType = WorkingAppraisee.AppraiseeValue("AppraisalType");
            SetUpAppraisalSession();
            LoadAppraisalPage("YearChange");

        }

        protected void DdlSession_SelectedIndexChanged(object sender, EventArgs e)
        {
           hfApprSession.Value = ddlSession.SelectedValue;
            WorkingAppraisee.SessionID = ddlSession.SelectedValue;
            WorkingAppraisee.AppraisalWorkingSession = ddlSession.SelectedValue;
            LoadAppraisalPage("SessionChange");

        }
        private void LoadAppraisalPage(string changeSource)
        {
            try
            {
                string schoolyear = ddlSchoolYear.SelectedValue;
                string sessionid = ddlSession.SelectedValue;
                string employeeid = hfApprEmployeeID.Value; //  WorkingAppraisee.EmployeeID;
                string schoolcode = hfApprSchool.Value;//  WorkingAppraisee.AppraisalSchoolCode;
                string tName = hfTeacherName.Value; // hfAppr WorkingAppraisee.AppraiseeName;
                string phase = WorkingAppraisee.AppraisalPhase;
                string assignment = WorkingAppraisee.AssignmentLink;
                string category = WorkingAppraisee.AppraisalCategory; 





                if (changeSource != "SessionChange")
                {
                    string currentAppraisalSession = WorkingAppraisee.AppraisalWorkingSession;
                    WorkingAppraisee.SetListValue(ddlSession, currentAppraisalSession);
                    WorkingAppraisee.SessionID = ddlSession.SelectedValue;

                    LabelSchoolCode.Text = schoolcode;
                    LabelSchool.Text = WorkingAppraisee.AppraisalSchoolName;
                    LabelAppraiser.Text = WorkingAppraisee.AppraiserName;
                    LabelAppraisalTitle.Text = GetTitlebyType(tName, phase, assignment);
                    LabelGreetingUser.Text = "Good morning " + UserProfile.LoginUserName;//  + ", welcome to EPA application";
                    LabelAppraisalTitle.ToolTip = WorkingAppraisee.EmployeeID + " - " + WorkingAppraisee.UserID;

                }
                hfApprYear.Value = schoolyear;
                hfApprSchool.Value = schoolcode;
                hfApprEmployeeID.Value = employeeid;
                hfApprSession.Value = ddlSession.SelectedValue; ;
                hfTeacherName.Value = tName;
                WorkingProfile.PageCategory = category;
                WorkingProfile.PageArea = "ALP";
                WorkingProfile.PageItem = "ALP10";
                if (category == "NTP" || category == "LTO")
                {
                    WorkingProfile.PageArea = "SUM";
                    WorkingProfile.PageItem = "SUM11";
                }


                //  string parameters =  "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionid + "&type=" + category; ;
                string parameters = AppraisalPage.GetQueryString(schoolyear, schoolcode, employeeid, tName, phase, sessionid, category);
                hfParameters.Value = parameters;
                WorkingAppraisee.AppraiseeValue("WorkSession", ddlSession.SelectedValue);
                WorkingAppraisee.AppraiseeValue("AppraisalPhase", Page.Request.QueryString["phase"]);
                WorkingAppraisee.AppraiseeValue("AppraisalCategory", WorkingProfile.PageCategory);
                WorkingAppraisee.AppraiseeValue("AppraisalArea", WorkingProfile.PageArea);
                WorkingAppraisee.AppraiseeValue("AppraisalItem", WorkingProfile.PageItem);

                string goPage = "Loading.aspx?pID=LeftMenu&" + parameters;
             //   string goPage = "Loading.aspx?" + parameters;
                iFrameGoItem.Attributes.Add("src", goPage);
            }
            catch { }


        }
        private string GetTitlebyType(string tName, string phase, string assignment)
        {
            string title = "";
            switch (WorkingAppraisee.AppraisalType)
            {
                case "EPA":
                    title = "Teacher Performance Appraisal for " + tName + " (EPA - " + phase + "/ " + assignment + ")";
                    break;
                case "TPA":
                    title = "Teacher Performance Appraisal for " + tName + " (TPA - " + phase + "/ " + assignment + ")";
                    break;
                case "NTP":
                    title = "Teacher Performance Appraisal for " + tName + " (NTIP - " + phase + "/ " + assignment + ")";
                    break;
                case "LTO":
                    title = "Teacher Performance Appraisal for " + tName + " (LTO - " + phase + "/ " + assignment + ")";
                    break;
                case "PPA":
                    title = "Principal Performance Appraisal for " + tName + " (PPA - " + phase + ")";
                    break;
                default:
                    title = "Teacher Performance Appraisal for " + tName + " (EPA - " + phase + "/ " + assignment + ")";
                    break;
            }
            return title;

        }
        private int GetStepsCount()
        {
            int rImg = 1;
            string evaluationYear = WorkingAppraisee.AppraisalPhase;
            switch (evaluationYear)
            {

                case "NE1":
                case "NE2":
                case "NE3":
                case "NE4":
                    rImg = 4;
                    break;
                case "LTO":
                case "NTP":
                    rImg = 4;
                    break;
                case "E":
                    rImg = 6;
                    break;
                default:
                    rImg = 5;
                    break;
            }
            return rImg;
        }
        private string GetTCellBGimg(int step1)
        {
            string stepStatus = "";
            string rImg = "";
            switch (stepStatus)
            {

                case "Complete":
                    rImg = "background-image:url(../images/pgBar1.png)";
                    break;
                case "Working":
                    rImg = "background-image:url(../images/pgBar2.png)";
                    break;
                case "NotStart":
                    rImg = "background-image:url(../images/pgBar3.png)";
                    break;
                default:
                    rImg = "background-image:url(../images/pgBar1.png)";
                    break;
            }
            return rImg;
        }
        private string GetTCellIndicaterimg(int step1)
        {
            string stepStatus = "";
            string rImg = "";
            switch (stepStatus)
            {
                case "Complete":
                    rImg = "<img  src='../images/pgBar1a.png'/>";
                    break;
                case "Working":
                    rImg = "<img  src='../images/pgBar12a.png'/>";
                    break;
                case "NotStart":
                    rImg = "<img  src='../images/pgBar3a.png'/>";
                    break;
                default:
                    rImg = "<img  src='../images/pgBar1a.png'/>";
                    break;
            }
            return rImg;
        }
        private string GetStepText(int step1)
        {
            // string StepStatus = "";
            string myText = "";
            switch (step1)
            {
                case 1:
                    myText = "Appraisee Self Plan ";
                    break;
                case 2:
                    myText = "Appraiser comments";
                    break;
                case 3:
                    myText = "Appraisee Sign Off";
                    break;
                case 4:
                    myText = "Appraiser Sign Off";
                    break;
                case 5:
                    myText = "Summative appraisal";
                    break;
                case 6:
                    myText = "Appraisee Sign Off Summative";
                    break;
                default:
                    myText = "Appraisee Sign off Summative";
                    break;
            }
            return myText;
        }
    }
}