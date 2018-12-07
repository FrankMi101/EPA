using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class AppraisalCategorySetup : System.Web.UI.Page
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
            WorkingProfile.PageArea = "Categoey";
            WorkingProfile.PageItem = "Categoey";
            AppraisalPage.SetPageAttribute2(Page);
            
          

        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="Categoey";
            string code = "Category";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "Categoey";
  

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
         }


        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {
            ApplicationSetup.CategoryList(ref GridView1, action, User.Identity.Name);
        }
  
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
             string result =   ApplicationSetupData.Category( "AddNew", User.Identity.Name,"0", "","", "","");
            BindMyData();
        }
    }
}