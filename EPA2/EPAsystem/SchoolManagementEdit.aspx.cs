using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccess;

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

                setPageAttribution();

                bindSchoolInformation();
            }


        }
        private void setPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "School";
            WorkingProfile.PageItem = "School";
            AppraisalPage.SetPageAttribute2(Page);
            myList.SetLists(ddlSchoolType, "SchoolType", User.Identity.Name);
            myList.SetLists(ddlPanel, "SchoolPanel", User.Identity.Name);
            myList.SetLists(ddlPrincipal, "SchoolPrincipal", User.Identity.Name);
            myList.SetLists(ddlDistrict, "DistrictList", User.Identity.Name);
            myList.SetLists(ddlSchoolArea, "SchoolArea", User.Identity.Name);
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

        private void bindSchoolInformation()
        {
            string IDs = Page.Request.QueryString["IDs"];

            DataSet DS = new DataSet();
            DS = ApplicationSetupData.SchoolInformation("Get", User.Identity.Name, "EPA", "", IDs);
            try
            {
                //  Comments, [Active] as Active , Brief_Name, Header, Area  as Supervisor, District , panel,[Type]

                hfIDs.Value = IDs;
                TextSchoolCode.Text = DS.Tables[0].Rows[0][1].ToString();
                TextSchoolName.Text = DS.Tables[0].Rows[0][2].ToString();
                TextComments.Text = DS.Tables[0].Rows[0][3].ToString();
                chbActive.Checked = getCheck(DS.Tables[0].Rows[0][4].ToString());
                myList.SetListValue(ddlPrincipal, DS.Tables[0].Rows[0][5].ToString());
                myList.SetListValue(ddlSchoolArea, DS.Tables[0].Rows[0][6].ToString());
                myList.SetListValue(ddlDistrict, DS.Tables[0].Rows[0][7].ToString());
                myList.SetListValue(ddlPanel, DS.Tables[0].Rows[0][8].ToString());
                myList.SetListValue(ddlSchoolType, DS.Tables[0].Rows[0][9].ToString());
                chbTPA.Checked = getCheck(DS.Tables[0].Rows[0][10].ToString());
                chbPPA.Checked = getCheck(DS.Tables[0].Rows[0][11].ToString());

 
    }
            catch (Exception ex)
            {
                string eMessage = ex.Message;
            }
            finally { }
        }
        private bool getCheck(string chkVal)
        {
            bool rVal = (chkVal == "True") ? true : false;
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
            string IDs = hfIDs.Value;

            string saveResult = ApplicationSetupData.SchoolInformation("Save", User.Identity.Name, "EPA", "", IDs, schoolcode, schoolname, comment, active, district, principal, schoolarea, panel, tpa, ppa);
            showMessage(saveResult, "Update");
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
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            
            string ids = hfIDs.Value;
            string code = TextSchoolCode.Text;
            string saveResult = ApplicationSetupData.SchoolInformation("Delete", User.Identity.Name, "EPA", "", ids,code);

            showMessage(saveResult, "Delete");
        }
    }
}