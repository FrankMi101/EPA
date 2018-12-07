using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class ApplicationUsers : System.Web.UI.Page
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
            WorkingProfile.PageArea = "UserSetup";
            WorkingProfile.PageItem = "Users";
            AppraisalPage.SetPageAttribute2(Page);
            
           myList.SetLists(ddlUserRole, "UserRole", User.Identity.Name);
            myList.SetListValue(ddlUserRole, WorkingProfile.UserRole);

        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="UserSetup";
            string code = "Users";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "UserSetup";
  

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
            string area = "UsersSetup";
            ApplicationSetup.UsersList(ref GridView1, action, User.Identity.Name, category,  area);
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
            string userrole = ddlUserRole.SelectedValue;
            string result =   ApplicationSetup.UsersList(  "AddNew", User.Identity.Name, category, area,"0", "","", userrole,"","");
            BindMyData();
        }
    }
}