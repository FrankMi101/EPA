using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class ApplicationUsersMultipleSchools : System.Web.UI.Page
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
            WorkingProfile.PageArea = "UserMultipleSchool";
            WorkingProfile.PageItem = "UserMultipleSchool";
            AppraisalPage.SetPageAttribute2(Page);
            
           myList.SetLists(ddlPrincipal, "SchoolPrincipal", User.Identity.Name);
            myList.SetLists(ddlSchool, "SchoolList", User.Identity.Name);


        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "UserMultipleSchool";
            string code = "UserMultipleSchool";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "UserMultipleSchool";
  

           // AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);

        }


        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = "UserMultipleSchool";
            string schoolyear = WorkingProfile.SchoolYear;
            ApplicationSetup.MultipleSchoolUser(ref GridView1, action, User.Identity.Name, category,  area,schoolyear);
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
            string area = hfArea.Value;
            string schoolyear = WorkingProfile.SchoolYear;
            string result =   ApplicationSetupData.UsersManagementMultipleSchool(  "AddNew", User.Identity.Name, category, area, schoolyear,"0", "","","","");
            BindMyData();
        }
    }
}