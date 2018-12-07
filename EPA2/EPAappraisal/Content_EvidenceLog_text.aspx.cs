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
    public partial class Content_EvidenceLog_text : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindEvidenLogData();
            }
        }

        private void setPageAttribution()
        {
            hfCategory.Value = WorkingAppraisee.AppraisalType;
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfCode.Value = WorkingAppraisee.AppraisalCode;
            hfArea.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name; 
            hfRunningModel.Value = WebConfig.RunningModel(); 
            hfDomainID.Value = hfCode.Value.Replace("SUM5", ""); 
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

        }

       
        private void AssemblePage()
        {
            myList.SetLists(ddlSchoolYear, "SchoolYear", User.Identity.Name);
            myList.SetListValue(ddlSchoolYear, WorkingAppraisee.AppraisalYear);
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
                string schoolyear = ddlSchoolYear.SelectedValue;
                string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                string employeeID = WorkingAppraisee.EmployeeID;
                string sessionID = WorkingAppraisee.SessionID;
                string category = Page.Request.QueryString["type"];
                string area = Page.Request.QueryString["aID"];
                string itemCode = Page.Request.QueryString["iCode"];
                string domainID = Page.Request.QueryString["domainID"];
                string competencyID = Page.Request.QueryString["competencyID"];
                hfDomainID.Value = domainID;
                hfCompetencyID.Value = competencyID;

                string actionRole = hfAppraisalActionRole.Value;
                myTextEvidenceLog.Text = AppraisalDataDomain.DomainTextEvidenceLog(User.Identity.Name, schoolyear, schoolcode, employeeID, sessionID, category, area, itemCode, domainID, competencyID, actionRole);

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