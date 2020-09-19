
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class ContentEvidenceLogText : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                BindEvidenLogData();
            }
        }

        private void SetPageAttribution()
        {
            hfCategory.Value = WorkingAppraisee.AppraisalType;
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfCode.Value = WorkingAppraisee.AppraisalCode;
            hfArea.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name; 
            hfRunningModel.Value = WebConfig.RunningModel(); 
            hfDomainID.Value = hfCode.Value.Replace("SUM5", ""); 
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserId);

        }

       
        private void AssemblePage()
        {
            AppraisalPage.BuildingListControl(ddlSchoolYear, "SchoolYear", User.Identity.Name, WorkingAppraisee.AppraisalYear);
            InitialPage();
        }
        private void InitialPage()
        {

        }
        protected void tab_chaneged(object sender, EventArgs e)
        {
            BindEvidenLogData();
        }
        private void BindEvidenLogData()
        {
            try
            {
              
                hfDomainID.Value = Page.Request.QueryString["domainID"];
                hfCompetencyID.Value = Page.Request.QueryString["competencyID"];

                string actionRole = hfAppraisalActionRole.Value;
                
                      var parameter = new BuildLookForsList()
                      {
                          Operate = "Get",
                          UserID = User.Identity.Name,
                          SchoolYear = ddlSchoolYear.SelectedValue,
                          SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                          EmployeeID = WorkingAppraisee.EmployeeID,
                          SessionID = WorkingAppraisee.SessionID,
                          Category = Page.Request.QueryString["type"],
                          Area = Page.Request.QueryString["aID"],
                          DomainID = Page.Request.QueryString["domainID"],
                          CompetencyID = Page.Request.QueryString["competencyID"],
                          ActionRole = actionRole 

                      };
                myTextEvidenceLog.Text = AppraisalData.DomainTextEvidenceLog(parameter);// User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, domainId, competencyId, actionRole);

            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        
        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;

        }

    }
}