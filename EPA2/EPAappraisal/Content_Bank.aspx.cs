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
    public partial class Content_Bank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindGridViewData("Board");
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel(); 

        }
        private void AssemblePage()
        {
          
             InitialPage();
        }
        private void InitialPage()
        { 
            
        }
        private void BindGridViewData(string type)
        {
            try
            {
                GridView1.DataSource = GetDataSource(type);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private DataTable GetDataSource( string type)
        {
            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeID = WorkingAppraisee.EmployeeID;
            string sessionID = WorkingAppraisee.SessionID; 
            string owner = User.Identity.Name;
            switch (type)
            {
                case "Board":
                    hfSelectedTab.Value = "btnBoard";
                    owner = "0000";
                    break;
                case "School":
                    hfSelectedTab.Value = "btnSchool";
                    owner = schoolcode;
                    break;
                case "Personal":
                    hfSelectedTab.Value = "btnPersonal";
                    owner = User.Identity.Name;
                    break;
                default:
                    owner = "";
                    break;
            }
            
            try
            {
                DataSet myDS = new DataSet();
                myDS = AppraisalComments.CommentsBank(User.Identity.Name, type, owner);
                return myDS.Tables[0];
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }
        }

        protected void btnBoard_Click(object sender, EventArgs e)
        {
            BindGridViewData("Board");
        }

        protected void btnSchool_Click(object sender, EventArgs e)
        {
            BindGridViewData("School");
        }

        protected void btnPersonal_Click(object sender, EventArgs e)
        {
            BindGridViewData("Personal");
        }
    }
}