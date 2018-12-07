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
    public partial class Content_EvidenceLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
               
                BindGridViewData("Appraiser");
            }
        }
        private void setPageAttribution()
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
                GridView1.DataSource = GetDataSource(true,objRole);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private DataTable GetDataSource(Boolean goDatabase, string objRole)
        {
            string schoolyear = WorkingProfile.SchoolYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeID = WorkingAppraisee.EmployeeID;
            string sessionID = WorkingAppraisee.SessionID;
            string category = Page.Request.QueryString["type"];
            string area = Page.Request.QueryString["aID"];
            string itemCode = Page.Request.QueryString["iCode"];
            string domainID = Page.Request.QueryString["domainID"];
            string competencyID = Page.Request.QueryString["competencyID"];
            string seqNo = Page.Request.QueryString["SeqNo"];
            string actionItem = Page.Request.QueryString["ActionItem"];
            string actionRole = "Appraiser";
 
            try
            {
               // DataSet DS = new DataSet();
                DataSet DS = AppraisalProcess.LookForsList("GetForSUM", User.Identity.Name, schoolyear, schoolcode, employeeID, sessionID, category, area, itemCode, domainID, competencyID, actionRole, objRole);

                return DS.Tables[0];
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

      




        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridViewData("Appraiser");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData("Appraiser");
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