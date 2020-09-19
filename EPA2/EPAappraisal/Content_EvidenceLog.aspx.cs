
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
    public partial class ContentEvidenceLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();

                BindGridViewData("Appraiser");
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfObjRole.Value = "Appraiser";

        }

        private void BindGridViewData(string objRole)
        {
            try
            {
                GridView1.DataSource = GetDataSource(true, objRole);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<BuildLookForsList> GetDataSource(Boolean goDatabase, string objRole)
        {
            try
            {
                var parameter = new
                {
                    Operate = "Get",
                    UserID = User.Identity.Name,
                    WorkingProfile.SchoolYear,
                    SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                    WorkingAppraisee.EmployeeID,
                    WorkingAppraisee.SessionID,
                    DomainID = Page.Request.QueryString["domainID"],
                    CompetencyID = Page.Request.QueryString["competencyID"],
                    ObjRole = objRole

                };
                 SetcurrentTab();
               return AppraisalLibrary.LookForsList(parameter);
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

        //protected void DdlSearch_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    BindGridViewData("Appraiser");
        //}

        //protected void BtnSearch_Click(object sender, EventArgs e)
        //{
        //    BindGridViewData("Appraiser");
        //}
        private void SetcurrentTab()
        {
            string owner = User.Identity.Name;
            if ( WorkingProfile.UserAppraisalRole =="Appraiser")
                hfSelectedTab.Value = "Appraiser";
            else
                hfSelectedTab.Value = "Appraisee";
          
        }

        protected void Appraiser_Click(object sender, EventArgs e)
        {
            hfObjRole.Value = "Appraiser";
            BindGridViewData("Appraiser");
        }

        protected void Appraisee_Click(object sender, EventArgs e)
        {
            hfObjRole.Value = "Appraisee";

            BindGridViewData("Appraisee");
        }
    }
}