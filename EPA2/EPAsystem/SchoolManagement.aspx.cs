using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class SchoolManagement : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;

                setPageAttribution();

                BindMyData();
               
            }
          

        }
        private void setPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "School";
            WorkingProfile.PageItem = "School";
            AppraisalPage.SetPageAttribute2(Page);
             myList.SetLists(ddlSchoolType, "SchoolPanel", User.Identity.Name);
            myList.SetListValue(ddlSchoolType, "Elementary");
            //myList.SetLists(ddlSupervisor, "Supervisor", User.Identity.Name);
            //myList.SetLists(ddlPrincipal, "Principal", User.Identity.Name);
             //ddlSupervisor.SelectedIndex = 0;
            //ddlPrincipal.SelectedIndex = 0;
        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "School";
            string code = "School";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "School";
  

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1"); 
        }


        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = ddlSchoolType.SelectedValue;
            ApplicationSetup.SchoolList(ref GridView1, action, User.Identity.Name, category,  area);
        }

      
        protected void btnNext_Click(object sender, EventArgs e)
        {
           
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
          
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = ddlSchoolType.SelectedValue ;
            string result =   ApplicationSetupData.SchoolInformation("AddNew", User.Identity.Name, category, area,"0","");
            BindMyData();
        }

        protected void ddlSchoolType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMyData();
        }
        //public void GridView1_OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    TextBox editDistrict = (TextBox)GridView1.Rows[e.RowIndex].FindControl("editDistrict");
        //    TextBox editCode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("editCode") ;
        //    TextBox editName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("editName");
        //    Label IDs = (Label)GridView1.Rows[e.RowIndex].FindControl("IDs");
        //    string district = editDistrict.Text;
        //    string code = editCode.Text;
        //    string name = editName.Text;
        //    string iDs = IDs.Text;
        //    string category = hfCategory.Value;
        //    string area = hfArea.Value;
        //    string result = ApplicationSetup.RegionList(ref GridView1, "Update", User.Identity.Name, category, area, "0",code,name, "", "", "", "", "");


        //}
    }
}