using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

namespace EPA2.EPAmanage
{
    public partial class AppraisalStaffRollOver : System.Web.UI.Page
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
            hfPageID.Value = "StaffRollOver";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "Rollover";
            Session["HomePage"] = "EPAsystem/Loading.aspx?pID=StaffRollOver";

        }
        private void AssemblePage()
        {

            var parameters = new CommonListParameter() { Operate = "", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = WorkingProfile.SchoolArea, Para3 = "" };
            AppraisalPage.BuildingList(ddlSchoolYear, "SchoolYear", parameters, WorkingProfile.SchoolYear);
            AppraisalPage.BuildingList(ddlSchoolYearTo, "SchoolYear", parameters, UserProfile.CurrentSchoolYear);
            

            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchool, "SchoolListRollOver", parameters, WorkingProfile.SchoolCode);
             InitialPage();
        }
        private void InitialPage()
        {
            //if (WorkingProfile.SchoolCode == "")
            //{
            //     WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            //}
            //else
            //{
            //    mySchoolList.SetListsValue(ddlSchoolCode, ddlSchool, WorkingProfile.SchoolCode);

            //}
          
        }
        private void BindGridViewData()
        {
            try
            {
                GridView1.DataSource = GetDataSource();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<RollOverList> GetDataSource()
        {
           

            var parameter = new
            {
                Operate = "RolloverList",
                UserID = User.Identity.Name,
                FromSchoolYear = ddlSchoolYear.SelectedValue,
                ToSchoolYear = ddlSchoolYearTo.SelectedValue,
                SchoolCode = ddlSchool.SelectedValue
            };

            //          string sp = "dbo.EPA_Appr_AppraisalProcess_RollOver @Operate,@UserID,@FormSchoolYear,@ToSchoolYear,@SchoolCode";
            // return AppraisalProcess.GeneralList<RollOverList>(sp, parameter);
            return AppraisalProcess.GeneralList<RollOverList>("AppraisalManage", "RollOverList", parameter);

        }
 


        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
             WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
         }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            AppraisalPage.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
             WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
         }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void btnRollOver_Click(object sender, EventArgs e)
        {
          // string result = StaffList.StaffRollOver("RollOver", User.Identity.Name, ddlSchoolYear.SelectedValue, ddlSchoolCode.SelectedValue, ddlSchoolYearTo.SelectedValue);
            var parameter = new
            {
                Operate = "RollOver",
                UserID = User.Identity.Name,
                FromSchoolYear = ddlSchoolYear.SelectedValue,
                ToSchoolYear = ddlSchoolYearTo.SelectedValue,
                SchoolCode = ddlSchool.SelectedValue
            };

           // string sp = "dbo.EPA_Appr_AppraisalProcess_RollOver @Operate,@UserID,@FormSchoolYear,@ToSchoolYear,@SchoolCode";

           // string result =  AppraisalProcess.GeneralValue<string>(sp, parameter);
            string result =  AppraisalProcess.GeneralValue<string>("AppraisalManage", "RollOver", parameter);

            ShowMessage(result, "RollOver");
        }

        private void ShowMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
                //  *** AJAX Save Message  
                // ScriptManager.RegisterStartupScript(Me.Page, Me.Page.GetType, "save_script", strScript.ToString(), True)         }
            }
            catch { }

        }
    }
}