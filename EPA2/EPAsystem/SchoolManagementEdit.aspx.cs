using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAsystem
{
    public partial class SchoolManagementEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;

                SetPageAttribution();

                BindSchoolInformation();
            }


        }
        private void SetPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "School";
            WorkingProfile.PageItem = "School";
            AppraisalPage.SetPageAttribute2(Page);
            AppraisalPage.BuildingList(ddlSchoolType, "SchoolType", User.Identity.Name,"","","");
            AppraisalPage.BuildingList(ddlPanel, "SchoolPanel", User.Identity.Name,"", "", "");
            AppraisalPage.BuildingList(ddlPrincipal, "SchoolPrincipal", User.Identity.Name,"", "", "");
            AppraisalPage.BuildingList(ddlDistrict, "DistrictList", User.Identity.Name, "", "", "");
            AppraisalPage.BuildingList(ddlSchoolArea, "SchoolArea", User.Identity.Name, "", "", "");
            //  myList.SetListValue(ddlSchoolType, "School");
            //myList.SetLists(ddlSupervisor, "Supervisor", User.Identity.Name);
            //myList.SetLists(ddlPrincipal, "Principal", User.Identity.Name);
            //ddlSupervisor.SelectedIndex = 0;
            //ddlPrincipal.SelectedIndex = 0;
        }

        private void AssemblingPageTitle()
        {
            
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
        }

        private List<SchoolList> GetDataSource()
        {
            string iDs = Page.Request.QueryString["IDs"];
            var parameter = new { Operate = "Get", UserID = User.Identity.Name, Category = "EPA", Area = "", IDs = iDs };
            return ApplicationSetup.GeneralList<SchoolList>("AppraisalSetup", "SchoolInformation", parameter) ;
        }

        private void BindSchoolInformation()
        {

            //  DataSet ds = new DataSet(); 
            //  ds = ApplicationSetupData.SchoolInformation("Get", User.Identity.Name, "EPA", "", iDs);
            var school = GetDataSource()[0];
            try
            {
                //  Comments, [Active] as Active , Brief_Name, Header, Area  as Supervisor, District , panel,[Type]

                hfIDs.Value = Page.Request.QueryString["IDs"];
                TextSchoolCode.Text = school.Code;
                TextSchoolName.Text =school.Name;
                TextComments.Text = school.Comments;
                chbActive.Checked = GetCheck(school.Active);
                AppraisalPage.SetListValue(ddlPrincipal,school.Header);
                AppraisalPage.SetListValue(ddlSchoolArea, school.Supervisor);
                AppraisalPage.SetListValue(ddlDistrict, school.District);
                AppraisalPage.SetListValue(ddlPanel,school.Panel);
                AppraisalPage.SetListValue(ddlSchoolType,school.Type);
                chbTPA.Checked = GetCheck(school.TPA);
                chbPPA.Checked = GetCheck(school.PPA);

 
    }
            catch (Exception ex)
            {
                string eMessage = ex.Message;
            }
            finally { }
        }
        private bool GetCheck(bool chkVal)
        {
            bool rVal = (chkVal) ? true : false;
            return rVal;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string schoolcode = TextSchoolCode.Text;
            string schoolname = TextSchoolName.Text;
            string comment = TextComments.Text;

            string active = (chbActive.Checked) ? "1" : "0";
            string tpa = (chbTPA.Checked) ? "1" : "0";
            string ppa = (chbPPA.Checked) ? "1" : "0";
            string schoolType = ddlSchoolType.SelectedValue;
            string schoolarea = ddlSchoolArea.SelectedValue;
            string principal = ddlPrincipal.SelectedValue;
            string district = ddlDistrict.SelectedValue;
            string panel = ddlPanel.SelectedValue;
            string ds = hfIDs.Value;

            string saveResult = ApplicationSetup.SchoolInformation("Save", User.Identity.Name, "EPA", "", ds, schoolcode, schoolname, comment, active, district, principal, schoolarea, panel, tpa, ppa);
            ShowMessage(saveResult, "Update");
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
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            
            string ids = hfIDs.Value;
            string code = TextSchoolCode.Text;
            string saveResult = ApplicationSetup.SchoolInformation("Delete", User.Identity.Name, "EPA", "", ids,code);

            ShowMessage(saveResult, "Delete");
        }
    }
}