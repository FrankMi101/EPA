using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class SchoolRegionSetup : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;

                SetPageAttribution();

                BindMyData();
               
            }
          

        }
        private void SetPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "Region";
            WorkingProfile.PageItem = "Region";
            AppraisalPage.SetPageAttribute2(Page);
            myList.SetLists(ddlDistrictList, "DistrictList", User.Identity.Name);
            ddlDistrictList.SelectedIndex = 0;
            myList.SetLists(ddlSupervisor, "Supervisor", User.Identity.Name);
            ddlSupervisor.SelectedIndex = 0;
            myList.SetLists(ddlOfficer, "Officer", User.Identity.Name);
            ddlOfficer.SelectedIndex = 0;
        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "Region";
            string code = "Region";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "Region";
  

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
         }


        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = "Region";
            ApplicationSetup.RegionList(ref GridView1, action, User.Identity.Name, category,  area);
        }
   

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string result =   ApplicationSetup.RegionList( "AddNew", User.Identity.Name, category, area,"0","","","","","","","");
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