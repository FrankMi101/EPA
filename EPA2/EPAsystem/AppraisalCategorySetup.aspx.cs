using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using ClassLibrary;
using BLL;

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

                SetPageAttribution();

                BindMyData();
               
            }
          

        }
        private void SetPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "Category";
            WorkingProfile.PageItem = "Category";
            AppraisalPage.SetPageAttribute2(Page);
            
          

        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="Category";
            string code = "Category";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "Category";
  

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
         }

        protected void BindMyData()
        {
            GridView1.DataSource = MyDataSource();
            GridView1.DataBind();
        }

        private List<AreaList> MyDataSource()
        {
            var parameter = new { Operate = "List", UserID = User.Identity.Name };
            return AppraisalSetup.CategoryList(parameter);
        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            var parameter = new
            {
                Operate = "Insert",
                UserID = User.Identity.Name,
                IDs = "0",
                Code = "New",
                Name = "New Category",
                Comments = "New Category comment ",
                Active = 1
            };
            string result = AppraisalSetup.SaveCategory(parameter);
            BindMyData();
        }
    }
}