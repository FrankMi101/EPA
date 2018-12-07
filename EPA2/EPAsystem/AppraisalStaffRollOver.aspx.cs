using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAsystem
{
    public partial class AppraisalStaffRollOver : System.Web.UI.Page
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
            myList.SetLists(ddlSchoolYear, "SchoolYear", User.Identity.Name);
            myList.SetLists(ddlSchoolYearTo, "SchoolYearTo", User.Identity.Name);
            myList.SetListValue(ddlSchoolYear, UserProfile.CurrentSchoolYear);
            myList.SetListValue(ddlSchoolYearTo, UserProfile.CurrentSchoolYear);

            mySchoolList.SetLists2(ddlSchool, ddlSchoolCode, "SchoolListRollOver", User.Identity.Name, WorkingProfile.UserRole, ddlSchoolYear.SelectedValue, WorkingProfile.SchoolCode);
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
        private DataTable GetDataSource(Boolean goDatabase)
        {
            string schoolyear = ddlSchoolYearTo.SelectedValue;
            string schoolcode = ddlSchool.SelectedValue;

         
           
            try
            {
                DataSet myDS = new DataSet();
                myDS = StaffList.StaffRollOverList("RollOverList", User.Identity.Name, ddlSchoolYear.SelectedValue, ddlSchoolCode.SelectedValue, ddlSchoolYearTo.SelectedValue);
                return myDS.Tables[0];
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            myList.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
             WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
         }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            myList.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
             WorkingProfile.SchoolCode = ddlSchoolCode.SelectedValue;
         }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void btnRollOver_Click(object sender, EventArgs e)
        {
           string result = StaffList.StaffRollOver("RollOver", User.Identity.Name, ddlSchoolYear.SelectedValue, ddlSchoolCode.SelectedValue, ddlSchoolYearTo.SelectedValue);
            showMessage(result, "RollOver");
        }

        private void showMessage(string result, string action)
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