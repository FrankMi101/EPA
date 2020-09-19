using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary; 

namespace EPA2.EPAappraisal
{
    public partial class ContentLookFors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                BindGridViewData();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

        }
        private void AssemblePage()
        {
            AppraisalPage.BuildingListControl(ddlSchoolYear, "SchoolYear", User.Identity.Name, WorkingProfile.SchoolYear); 
            InitialPage();
        }
        private void InitialPage()
        {

        }
        private void BindGridViewData()
        {
            try
            {
                GridView1.DataSource = GetDataSource(true);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<LookFors> GetDataSource(Boolean goDatabase)
        {

            try
            {
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
                CompetencyID = Page.Request.QueryString["competencyID"]
            };
        
                return AppraisalData.LookForsList(parameter);// Domain.DomainTextContentLookFors(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, domainId, competencyId);
               
              
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            BindGridViewData();
        }




        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }
    }
}