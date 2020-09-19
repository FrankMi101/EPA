//using BLL;
//using EPA2.Generic.LIB;
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;

namespace EPA2.EPAmanage
{
    public partial class AppraisalStaffList : System.Web.UI.Page
    {
        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                await BindGridViewData();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalList";
            hfCode.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfWorkingOn.Value = WorkingProfile.WorkingOnAppr;
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "StaffList";
            Session["HomePage"] = "EPAmanage/Loading.aspx?pID=AppraisalStaffList";

        }
        private void AssemblePage()
        {
            var parameters = new CommonListParameter() { Operate = "", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = WorkingProfile.SchoolArea, Para3 = WorkingProfile.SchoolYear };
            AppraisalPage.BuildingList(ddlSchoolYear, "SchoolYear", parameters, WorkingProfile.SchoolYear);
            AppraisalPage.BuildingList(ddlSchoolArea, "SchoolArea", parameters, WorkingProfile.SchoolArea);

            string schoolCode = WorkingProfile.SchoolCode;
            if (WorkingProfile.UserRole == "SO" || WorkingProfile.UserRole == "Admin")
            {
                AppraisalPage.SetListValue(ddlSchoolArea, WorkingProfile.SchoolArea);
                schoolCode = WorkingProfile.SchoolArea;
            }
            else
            {
                parameters.Para2 = schoolCode;
            }

            // parameters.Para3 = WorkingProfile.SchoolYear;
            // parameters.Para3 = WorkingProfile.SchoolCode;
            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchool, "SchoolList", parameters, schoolCode);
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
        }
        protected async void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            WorkingProfile.SchoolYear = ddlSchoolYear.SelectedValue;
            await BindGridViewData();
        }
        protected async void ddlSchoolArea_SelectedIndexChanged(object sender, EventArgs e)
        {

            WorkingProfile.SchoolArea = ddlSchoolArea.SelectedValue;
            var parameters = new CommonListParameter() { Operate = "", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = ddlSchoolYear.SelectedValue, Para3 = WorkingProfile.SchoolArea };
            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchool, "SchoolList", parameters);
            ddlSchoolCode.SelectedIndex = 0;
            AppraisalPage.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
            await BindGridViewData();
        }

        protected async void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {

            AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
            await BindGridViewData();
        }
        protected async void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            AppraisalPage.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);

            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
            await BindGridViewData();
        }

        protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextSearch.Visible = false;
            ddlSearch.Visible = true;
            if (ddlSearchby.SelectedValue == "Teacher")
            {
                TextSearch.Visible = true;
                ddlSearch.Visible = false;
            }
            else
            {
                AppraisalPage.BuildingList(ddlSearch, ddlSearchby.SelectedValue, User.Identity.Name, "", "", "");
            }
        }

        protected async void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            await BindGridViewData();
        }

        protected async void btnSearch_Click(object sender, EventArgs e)
        {
            await BindGridViewData();
        }
        private async Task BindGridViewData()
        {
             
          //  List < AppraisalList > listDataSource = await Task.Run(() => GetDataSource());
            try
            {
                //string schoolyear = ddlSchoolYear.SelectedValue;
                //string schoolcode = ddlSchool.SelectedValue;
                //string searchby = ddlSearchby.SelectedValue;
                //string searchvalue = ddlSearch.SelectedValue;
                //if (searchby == "Teacher")
                //{
                //    searchvalue = TextSearch.Text;
                //}
                //  AppraisalGridViewData.BindMyGridView(ref GridView1,"AppraisalStaffList", "DataSet", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                // AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffList", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                //  AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffList", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                GridView1.DataSource = await Task.Run(() => GetDataSource());
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }
            finally
            {
               // listDataSource  = null; does not need to dispose the object. it is a managed object. 
            }

        }

        private List<AppraisalList> GetDataSource()
        {
            string schoolyear = ddlSchoolYear.SelectedValue;
            string schoolcode = ddlSchool.SelectedValue;
            string searchby = ddlSearchby.SelectedValue;
            string searchvalue = ddlSearch.SelectedValue;
            string role = hfUserRole.Value;
            string workingOn = hfWorkingOn.Value;
            if (searchby == "Teacher")
            {
                searchvalue = TextSearch.Text;
            }
            var parameter = new
            {
                Operate = role,
                UserID = User.Identity.Name,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                SearchBy = searchby,
                Searchvalue = searchvalue,
                WorkingOn = workingOn
            };

            //var para = new List<Parameters>()
            //{Parameters.NewPara(1, "Operate",role),
            // Parameters.NewPara(2, "UserID", User.Identity.Name),
            // Parameters.NewPara(3, "SchoolYear", schoolyear),
            // Parameters.NewPara(4, "SchoolCode", schoolcode),
            // Parameters.NewPara(5, "SearchBy", searchby),
            // Parameters.NewPara(6, "SearchValue", searchvalue),
            // Parameters.NewPara(7, "WorkingOn",workingOn)
            //};
            //  return StaffManagement.AppraisalStaffs(parameter);
            //  BaseData.ShowSP( "AppraisalManage", "AppraisalStaffs",btnSearch);

          //  var apprList = BaseData.GeneralList<AppraisalList>("AppraisalManage", "AppraisalStaffs", parameter, btnSearch);
            //var para = BaseData.GetParaStrFromParameterObj(parameter);
            var apprList = BaseData.GeneralList<AppraisalList>("dbo.EPA_Appr_AppraisalStaffList" , parameter, btnSearch);
            return apprList;
        }

        private Parameters NewPara(int seq, string key, object value)
        {
            return new Parameters() { Seq = seq, Key = key, Value = value };
        }
    }
}