using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAsystem
{
    public partial class ApplicationRoleManage : System.Web.UI.Page
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
            WorkingProfile.PageArea = "UserSetup";
            WorkingProfile.PageItem = "UserRole";
            AppraisalPage.SetPageAttribute2(Page);
   
        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="UserSetup";
            string code = "UserRole";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "UserSetup";
  

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1"); 
        }


        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = "UserSetup";
            ApplicationSetup.ObjList(ref GridView1, action, User.Identity.Name, category,  area);
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
            string result =   ApplicationSetup.ObjList(ref GridView1, "AddNew", User.Identity.Name, category, area,"0","","","","");
            BindMyData();
        }
    }
}