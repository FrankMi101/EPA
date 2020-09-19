using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 

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

                SetPageAttribution();

                BindMyData();
               
            }
          

        }
        private void SetPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "UserMultipleSchool";
            WorkingProfile.PageItem = "UserMultipleSchool";
            AppraisalPage.SetPageAttribute2(Page);
            
           AppraisalPage.BuildingListControl(ddlPrincipal, "SchoolPrincipal", User.Identity.Name);
            AppraisalPage.BuildingListControl(ddlSchool, "SchoolList", User.Identity.Name);


        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "UserMultipleSchool";
            string code = "UserMultipleSchool";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "UserMultipleSchool";
  

           //AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
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
            string result =   ApplicationSetup.UsersManagementMultipleSchool(  "AddNew", User.Identity.Name, category, area, schoolyear,"0", "","","","");
            BindMyData();
        }
    }
}