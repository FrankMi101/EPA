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
    public partial class ViewPermission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                AllowViewPermissionCheck();
            

            }
            AssemblingPageTitle();
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfCode.Value = "ViewP";
            hfArea.Value = "SUM";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfContentChange.Value = "0";  // initila page content for not a change statue
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

         

        }

        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
           

        }
  

        protected void btnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
        }
      

        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string goPage = AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
 

        protected void rblViewPermission_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyData("Save");
        }
        private void AllowViewPermissionCheck()
        {
            OperationMyData("Get");
        }

        protected void OperationMyData(string action)
        {
            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string sessionid = WorkingAppraisee.SessionID;
            string employeeid = WorkingAppraisee.EmployeeID;
            string phase = WorkingAppraisee.AppraisalPhase;
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string userRole = WorkingProfile.UserAppraisalRole;
            AppraisalData.ListPermission(ref rblViewPermission, action, User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
            if (action == "Get")
            {
                if (hfAppraisalActionRole.Value == "Appraisee")
                {
                    rblViewPermission.Enabled = false;
                }
            }
        }
    }
}
