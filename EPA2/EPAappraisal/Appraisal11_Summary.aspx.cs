using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11_Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AssemblingPageTitle();
                CheckAppraisalSummary();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = WorkingAppraisee.AppraisalType;
            hfPageID.Value = "AppraisalSummary";
            string sourcePage = Page.Request.QueryString["aID"];
            hfArea.Value = sourcePage.Substring(0, 3);
            hfCode.Value = sourcePage;
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalArea = "AppraisalSummary";
        }

        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value.Substring(0, 3);

            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }
        private void CheckAppraisalSummary()
        {
            string schoolyear = WorkingAppraisee.AppraisalYear;
            string sourcePage = Page.Request.QueryString["aID"];


            if (schoolyear == UserProfile.CurrentSchoolYear && sourcePage == "Summary")
            {
                if (WorkingAppraisee.PreviousAppraisalCompleteStatus == "Completed")
                { BuildSummaryTree(); }
                else
                {
                    string rdPage = "Appraisal11_SummaryIncomplete.aspx?aID=InComplete";
                    Page.Response.Redirect(rdPage);
                }
            }
            else
            {
                BuildSummaryTree();
            }


        }
        private void BuildSummaryTree()
        {

            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeid = WorkingAppraisee.EmployeeID;
            string sessionid = WorkingAppraisee.SessionID;
            string tName = WorkingAppraisee.AppraiseeName;
            string phase = WorkingAppraisee.AppraisalPhase;
            string category = WorkingAppraisee.AppraisalType;
            string sourcePage = Page.Request.QueryString["aID"];
            string area = sourcePage.Substring(0, 3);
            if (sourcePage == "Summary")
            {
                Page.Response.Redirect("Appraisal11_Message.aspx");
            }
            else
            {
            DataSet myDS = AppraisalProcess.CheckCompleteStatus("CheckList", User.Identity.Name, schoolyear, schoolcode, employeeid, sessionid, category, area, sourcePage);

            TreeViewNode.BuildingTree(ref TreeView1, myDS, category, "Summary");
            }
        }
    }
}