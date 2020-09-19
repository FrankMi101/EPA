using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAappraisal
{
    public partial class Appraisal11_SummaryIncomplete : System.Web.UI.Page
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
            hfPageID.Value = "Incomplete";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalArea = "Incomplete";
            hfArea.Value = "Incomplete";
            hfCode.Value = "Incomplete" + "00";
            labelIncompleteSchoolYear.Text = WorkingAppraisee.PreviousAppraisalYear;
            labelIncompleteSession.Text = WorkingAppraisee.PreviousYearSessionID;
            labelIncompleteProcessArea.Text = WorkingAppraisee.PreviousYearArea;
            hfIncompleteAreaCode.Value = WorkingAppraisee.PreviousYearAreaCode;

        }

        private void AssemblingPageTitle()

        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }
        private void CheckAppraisalSummary()
        {
            string schoolyear = WorkingAppraisee.PreviousAppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeid = WorkingAppraisee.EmployeeID;
            string sessionid = WorkingAppraisee.PreviousYearSessionID;
            string tName = WorkingAppraisee.AppraiseeName;
            string phase = WorkingAppraisee.AppraisalPhase;
            string category = WorkingAppraisee.AppraisalType;
            string sourcePage = "Summary";
            string area = "Sum";
           
             var parameter = new AppraisalComment()
             {
                 UserID = User.Identity.Name,
                 SchoolYear = WorkingAppraisee.PreviousAppraisalYear,
                 SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                 EmployeeID = WorkingAppraisee.EmployeeID,
                 SessionID = WorkingAppraisee.PreviousYearSessionID,
                 Category = WorkingAppraisee.AppraisalType,
                 Area = area,
                 ItemCode = sourcePage
             };
            var myDs = AppraisalProcess.CheckCompleteStatus(parameter); // .CheckCompleteStatus("CheckList", User.Identity.Name, schoolyear, schoolcode, employeeid, sessionid, category, area, sourcePage);
            TreeViewNode.BuildingTree(ref TreeView1, myDs, category, "Incomplete");
        }
    }
}