using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class ManageStaffList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindGridViewData();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "StaffList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "StaffList";
            Session["HomePage"] = "EPAmanage/Loading.aspx?pID=ManageStaffList";

        }
        private void AssemblePage()
        {
           

            mySchoolList.SetLists2(ddlSchool, ddlSchoolCode, "SchoolList", User.Identity.Name, WorkingProfile.UserRole, "", WorkingProfile.SchoolCode);
            InitialPage();
        }
        private void InitialPage()
        {
            if (WorkingProfile.SchoolCode == "")
            {
                ddlSchool.SelectedIndex = 0;
                mySchoolList.SetListsValue(ddlSchoolCode, ddlSchool, ddlSchool.SelectedValue);
                WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            }
            else
            {
                mySchoolList.SetListsValue(ddlSchoolCode, ddlSchool, WorkingProfile.SchoolCode);

            }
            ddlSearchby.SelectedIndex = 0;
            TextSearch.Visible = true;
            ddlSearch.Visible = false;
            // ddlSearchby.Items[0].Selected = true;
            string HRef = "javascript:OpenStaffEdit('0','" + WorkingProfile.SchoolYear + "','" + WorkingProfile.SchoolCode + "','New Staff')";
            linkAddNew.HRef = HRef;
            if (WorkingProfile.UserRole == "Principal" || WorkingProfile.UserRole == "Admin")
            { linkAddNew.Visible = true; }
        }
        private void BindGridViewData()
        {
            try
            {
                string schoolyear =  WorkingProfile.SchoolYear;
                string schoolcode = ddlSchool.SelectedValue;

                string searchby = ddlSearchby.SelectedValue;
                string searchvalue = ddlSearch.SelectedValue;
                if (searchby == "Teacher")
                {
                    searchvalue = TextSearch.Text;
                }
                 // AppraisalGridViewData.BindMyGridView(ref GridView1,"StaffList", "DataSet", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
               AppraisalGridViewData.BindMyGridView(ref GridView1, "StaffList", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }
        }
       
        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
             myList.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
           UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
            BindGridViewData();
        }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
             myList.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
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
                    myList.SetLists(ddlSearch, "Status", User.Identity.Name);
                    break;
                case "Position":
                    myList.SetLists(ddlSearch, "Position", User.Identity.Name);
                    break;
                case "Process":
                    myList.SetLists(ddlSearch, "AppraisalProcess", User.Identity.Name);
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