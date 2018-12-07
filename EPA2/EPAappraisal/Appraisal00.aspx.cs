using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Web.UI.HtmlControls;

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
                string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + "Appraisal 1" + "&type=" + category;
                WorkingAppraisee.AppraisalYear = schoolyear;
                WorkingAppraisee.EmployeeID = employeeid;
                WorkingAppraisee.AppraisalCategory = category;

                hfParameters.Value = parameter;
                WorkingAppraisee.SetLists(ddlSchoolYear, "AppraisalYearList", User.Identity.Name, schoolyear, employeeid);
                WorkingAppraisee.SetListValue(ddlSchoolYear, schoolyear);

                WorkingProfile.UserAppraisalRole = AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);

                SetPageAttribution();
                //  checkProgress(); looks not good for user interface
                // WorkingProfile.ClientUserScreen = Page.Request.QueryString["ClientUserScreen"];
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = Page.Request.QueryString["type"];
            hfPageID.Value = "Appraisal";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            //     UserLastWorking.AppraisalType = hfCategory.Value;
            //     UserLastWorking.AppraisalArea = "Appraisal";
            UserLastWorking.EmployeeID = Page.Request.QueryString["tID"];
            LoadAppraisalPage("Initial");
            switch (hfCategory.Value)
            {
                case "PPA":
                    DocLink1.HRef = "javascript:OpenAppraisalDocument('OLF')";
                    DocLink1.InnerText = "Ontario Leadership Framework";
                    DocLink2.HRef = "javascript:OpenAppraisalDocument('PPAManual')";
                    DocLink2.InnerText = "Ontario Princiapl/VP Performance Appraisal Manual";
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
                    break;
                default:
                    DocLink1.HRef = "#";
                    DocLink1.InnerText = "";
                    DocLink2.HRef = "#";
                    DocLink2.InnerText = "";
                    break;
            }
        }

        protected void DdlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            //  WorkingProfile.SchoolYear = ddlSchoolYear.SelectedValue;
            //  UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            WorkingAppraisee.AppraisalYear = ddlSchoolYear.SelectedValue;
            LoadAppraisalPage("YearChange");
        }

        protected void DdlSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            //   UserLastWorking.AppraisalSession = ddlSession.SelectedValue;
            WorkingAppraisee.SessionID = ddlSession.SelectedValue;
            LoadAppraisalPage("SessionChange");

        }
        private void LoadAppraisalPage(string changeSource)
        {
            try
            {
                string schoolyear = ddlSchoolYear.SelectedValue;
                string employeeid = WorkingAppraisee.EmployeeID;
                string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                string tName = WorkingAppraisee.AppraiseeName;
                string phase = WorkingAppraisee.AppraisalPhase;
                string assignment =   WorkingAppraisee.AssignmentLink;
                if (changeSource != "SessionChange")
                {
                    WorkingAppraisee.SetLists(ddlSession, "AppraisalSessionList", User.Identity.Name, schoolyear, employeeid, hfCategory.Value);
                    string currentAppraisalSession = WorkingAppraisee.AppraisalWorkingSession;
                    WorkingAppraisee.SetListValue(ddlSession, currentAppraisalSession);
                    WorkingAppraisee.SessionID = ddlSession.SelectedValue;

                    LabelSchoolCode.Text = schoolcode;
                    LabelSchool.Text = WorkingAppraisee.AppraisalSchoolName;
                    LabelAppraiser.Text = WorkingAppraisee.AppraiserName;
                    LabelAppraisalTitle.Text = getTitlebyType(tName, phase, assignment);
                    LabelGreetingUser.Text = "Good morning " + UserProfile.LoginUserName + ", welcome to EPA application";
                    LabelAppraisalTitle.ToolTip = WorkingAppraisee.EmployeeID + " - " + WorkingAppraisee.UserID;

                }
                string sessionid = ddlSession.SelectedValue;
                string category = WorkingAppraisee.AppraisalType;
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


                string parameters = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionid + "&type=" + category; ;
                hfParameters.Value = parameters;

                string goPage = "Loading.aspx?pID=LeftMenu&" + parameters;
                iFrameGoItem.Attributes.Add("src", goPage);
            }
            catch { }


        }
        private string getTitlebyType(string tName, string phase,string assignment)
        {
            string title = "";
            switch (WorkingAppraisee.AppraisalType)
            {
                case "EPA":
                    title = "Teacher Performance Appraisal for " + tName + " (EPA - " + phase + "/ " + assignment +  ")";
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
        //private void checkProgress()
        //{
        //    HtmlGenericControl myPGTable = new HtmlGenericControl("table");
        //    HtmlTable myTable = ProgressStepsShow;
        //    //     myTable.InnerHtml.  = "";
        //    HtmlTableRow tRow = ProgressStepsShowTR; //  new HtmlTableRow();
        //                                             //       myTable.Rows.Add(tRow);
        //    int cellCtr;
        //    int cellCnt;
        //    int StepsCount = getStepsCount();
        //    for (cellCtr = 1; cellCtr <= StepsCount; cellCtr++)
        //    {
        //        // Create a new cell and add it to the row.
        //        HtmlTableCell tCell = new HtmlTableCell();
        //        HtmlTableCell imgCell = new HtmlTableCell();
        //        //   tCell.Attributes.Add("style", getTCellBGimg(cellCtr));// "background-image:url(../images/pgBar1.png)")  ;
        //        tCell.InnerText = cellCtr.ToString() + ". " + getStepText(cellCtr);// " progress";
        //        imgCell.Attributes.Add("class", "imgTCcell");
        //        imgCell.InnerHtml = getTCellIndicaterimg(cellCtr); // "<img id='pgBar2a' runat='server' src='../images/pgBar12a.png'/>";
        //        if (cellCtr == StepsCount)
        //        {
        //            //  tCell.Attributes.Add("style", "width:20%;background-image:url(../images/pgBar1.png)");
        //            tCell.Attributes.Add("style", "width:20%;");
        //            tRow.Cells.Add(tCell);
        //        }
        //        else
        //        {
        //            tRow.Cells.Add(tCell);
        //            tRow.Cells.Add(imgCell);
        //        }
        //    }
        //}
        private int getStepsCount()
        {
            int rImg = 1;
            string EvaluationYear = WorkingAppraisee.AppraisalPhase;
            switch (EvaluationYear)
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
        private string getTCellBGimg(int step1)
        {
            string StepStatus = "";
            string rImg = "";
            switch (StepStatus)
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
        private string getTCellIndicaterimg(int step1)
        {
            string StepStatus = "";
            string rImg = "";
            switch (StepStatus)
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
        private string getStepText(int step1)
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