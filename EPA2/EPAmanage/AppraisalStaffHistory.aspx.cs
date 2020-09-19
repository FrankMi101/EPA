using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web.UI;
namespace EPA2.EPAmanage
{
    public partial class AppraisalStaffHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution(); 
                BindGridViewData();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalHistory";
            hfCode.Value = "HistoryList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "HistoryList";
            UserLastWorking.EmployeeID = Page.Request.QueryString["tID"];
            UserLastWorking.SchoolYear = Page.Request.QueryString["yID"];
            UserLastWorking.SchoolCode = Page.Request.QueryString["cID"];
            WorkingAppraisee.AppraisalYear = Page.Request.QueryString["yID"];
            WorkingAppraisee.EmployeeID = Page.Request.QueryString["tID"];
            Session["HomePage"] = "EPAmanage/Loading.aspx?pID=AppraisalHistory";
        }

        private void BindGridViewData()
        {
            try
            {
                //string schoolyear = Page.Request.QueryString["yID"];
                //string schoolcode = Page.Request.QueryString["cID"];
                //string employeeId = Page.Request.QueryString["tID"];
                string phase = Page.Request.QueryString["phase"];
                string tName = Page.Request.QueryString["tName"];
                LabelName.Text = tName;
                LabelPhase.Text = phase;
                LabelAdmin.Text = WorkingAppraisee.AppraiserName;
                //  string searchby = "Teacher";
                //  string searchvalue = employeeID;

                // AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "DataSet", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                //  AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                //    AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);

                GridView1.DataSource = GetDataSource();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<AppraisalHistory> GetDataSource()
        {
            string searchby = "Teacher";
            string searchvalue = Page.Request.QueryString["tID"];

            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                SchoolYear = Page.Request.QueryString["yID"],
                SchoolCode = Page.Request.QueryString["cID"],
                SearchBy = searchby,
                SearchValue = searchvalue
            };
           // return StaffManagement.AppraisalStaffHistory(parameter);
            // return AppraisalManage.CommonList<AppraisalHistory>("AppraisalStaffHistory",parameter);

            var apprList = AppraisalProcess.GeneralList<AppraisalHistory>("AppraisalManage", "AppraisalStaffHistory", parameter);
            return apprList;
        }
     
        protected   void BtnSearch_Click(object sender, EventArgs e)
        {
              BindGridViewData();
        }
    }
}