using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class DomainSetup : System.Web.UI.Page
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
            WorkingProfile.PageArea = "Domain";
            WorkingProfile.PageItem = "Domain";
            AppraisalPage.SetPageAttribute2(Page);
            
          

        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="Domain";
            string code = "Domain";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "Domain";
  

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

            string category = "EPA";
            string area = "Domain";
         //   ApplicationSetup.DomainList(ref GridView1, action, User.Identity.Name, category,  area);

            GridView1.DataSource = ApplicationSetup.DomainListDataSource(action, User.Identity.Name, category, area);
            GridView1.DataBind();
        }
  
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
             string result = ApplicationSetup.DomainListDataSave( "AddNew", User.Identity.Name, category, area,"0");
           BindMyData();
          //  ApplicationSetup.DomainList(ref GridView1, "AddNew", User.Identity.Name, category, area);
        }
    }
}