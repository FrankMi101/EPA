using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            hfPageID.Value = "Summary"; 
            hfArea.Value = "All";
            hfCode.Value = "Summary";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalArea = "Summary";
        }

        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code +"1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");

        }
        private void CheckAppraisalSummary()
        {
            

            var parameter = new AppraisalComment()
            {
                Operate = "CheckList",
                UserID = User.Identity.Name,
                SchoolYear = WorkingAppraisee.AppraisalYear,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                EmployeeID = WorkingAppraisee.EmployeeID,
                SessionID = WorkingAppraisee.SessionID,
                Category = WorkingAppraisee.AppraisalType,
                Phase   = WorkingAppraisee.AppraisalPhase,
                AppraisalRole = WorkingProfile.UserAppraisalRole
            };
            BaseData.ShowSP("AppraisalActivity", "CheckSummary", labelTitle1);
            ContentTasks.InnerHtml = AppraisalProcess.CheckSummary("Tasks", parameter);
            ContentTodo.InnerHtml = AppraisalProcess.CheckSummary("ToDo", parameter);
            ContentDone.InnerHtml = AppraisalProcess.CheckSummary("Done", parameter);

        }
       
    }
}