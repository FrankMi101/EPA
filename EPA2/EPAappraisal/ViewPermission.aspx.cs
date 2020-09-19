
using ClassLibrary;
using System;
using System.Web.UI;

namespace EPA2.EPAappraisal
{
    public partial class ViewPermission : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AllowViewPermissionCheck();


            }
            AssemblingPageTitle();
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "TPA";
            hfPageID.Value = "ViewP";
            hfCode.Value = Page.Request.QueryString["aID"] + "View";
            hfArea.Value = Page.Request.QueryString["aID"];
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfContentChange.Value = "0";  // initila page content for not a change statue
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);
 


        }

        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code  );
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code +"1"  );
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code +"2");


        }


        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
        }


        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            var parameter = new
            {
                Operate = action,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Code = hfCode.Value
            };

            string goPage = AppraisalPage.GoPage(parameter);// AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
        protected void CheckBoxAutoEmailNotice_CheckedChanged(object sender, EventArgs e)
        {
            OperationMyData("Save","Auto");
        }

        protected void RblViewPermission_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyData("Save","View");
        }
        private void AllowViewPermissionCheck()
        {
            OperationMyData("Get","View");
            OperationMyData("Get", "Auto");
        }

        protected void OperationMyData(string action, string type)
        {


            var parameter = new AppraisalCommentSignOff()
            {
                Operate = action,
                UserID = User.Identity.Name,
                SchoolYear = WorkingAppraisee.AppraisalYear,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                EmployeeID = WorkingAppraisee.EmployeeID,
                SessionID = WorkingAppraisee.SessionID,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value,
                UserRole = WorkingProfile.UserAppraisalRole,
            };
            if (type == "View")
                AppraisalData.ListPermission(ref rblViewPermission, action, parameter); //ref rblViewPermission, action, User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
            else
                AppraisalData.AutoNoticeSignOffAction(ref CheckBoxAutoEmailNotice,  action, parameter); //ref rblViewPermission, action, User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
            if (action == "Get")
            {
                if (hfAppraisalActionRole.Value == "Appraisee")
                {
                    rblViewPermission.Enabled = false;
                    CheckBoxAutoEmailNotice.Enabled = false;
                }
            }
        }

  
    }
}
