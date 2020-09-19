using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
using ClassLibrary;

namespace EPA2.EPAmanage
{
    public partial class ManageStaffList : System.Web.UI.Page
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
            hfPageID.Value = "StaffList";
            hfCode.Value = "StaffList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "StaffList";
            Session["HomePage"] = "EPAmanage/Loading.aspx?pID=ManageStaffList";

        }
        private void AssemblePage()
        {
            var parameters = new CommonListParameter() { Operate = "", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = WorkingProfile.SchoolArea, Para3 = "" };


            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchool, "SchoolList", parameters, WorkingProfile.SchoolCode); 
            InitialPage();
        }
        private void InitialPage()
        {
            if (WorkingProfile.SchoolCode == "")
            {
                ddlSchool.SelectedIndex = 0;
                AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
                WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            }
            else
            {
                AppraisalPage.SetListValue(ddlSchoolCode, WorkingProfile.SchoolCode);
                AppraisalPage.SetListValue(ddlSchool, WorkingProfile.SchoolCode); 

            }
            ddlSearchby.SelectedIndex = 0;
            TextSearch.Visible = true;
            ddlSearch.Visible = false;
            // ddlSearchby.Items[0].Selected = true;
            string hRef = "javascript:OpenStaffEdit('0','" + WorkingProfile.SchoolYear + "','" + WorkingProfile.SchoolCode + "','New Staff')";
            linkAddNew.HRef = hRef;
            if (WorkingProfile.UserRole == "Principal" || WorkingProfile.UserRole == "Admin")
            { linkAddNew.Visible = true; }
        }
        private void BindGridViewData()
        {
            try
            {
                GridView1.DataSource = GetDataSource();
                GridView1.DataBind();
                // AppraisalGridViewData.BindMyGridView(ref GridView1,"StaffList", "DataSet", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                // AppraisalGridViewData.BindMyGridView(ref GridView1, "StaffList", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
               // AppraisalGridViewData.BindMyGridView(ref GridView1, "StaffList", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }
        }
        private List<EmployeeListC> GetDataSource()
        {
            string searchby = ddlSearchby.SelectedValue;
            string searchvalue = ddlSearch.SelectedValue; 
            if (searchby == "Teacher")
            {
                searchvalue = TextSearch.Text;
            }
            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                SchoolYear = WorkingProfile.SchoolYear,
                SchoolCode = ddlSchool.SelectedValue,
                SearchBy = ddlSearchby.SelectedValue,
                Searchvalue = searchvalue
            }; 
           
            var apprList = BaseData.GeneralList<EmployeeListC>("AppraisalManage", "StaffList", parameter, btnSearch);
            return apprList;
        }



        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
             AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
            BindGridViewData();
        }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
             AppraisalPage.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
            BindGridViewData();
        }

        protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextSearch.Visible = false;
            ddlSearch.Visible = true;
             switch (ddlSearchby.SelectedValue)
            {
                case "Status":
                  
                    AppraisalPage.BuildingList(ddlSearch, "Status", User.Identity.Name,"","",""); 
                    break;
                case "Position":
                   
                    AppraisalPage.BuildingList(ddlSearch, "Position", User.Identity.Name, "", "", ""); 
                    break;
                case "Process":
               
                    AppraisalPage.BuildingList(ddlSearch, "AppraisalProcess", User.Identity.Name, "", "", ""); 
                    break;
                default:
                    TextSearch.Visible = true;
                    ddlSearch.Visible = false;
                    break;
            }
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