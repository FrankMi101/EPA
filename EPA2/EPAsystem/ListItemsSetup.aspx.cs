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
    public partial class ListItemsSetup : System.Web.UI.Page
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
            WorkingProfile.PageArea = "SysSetup";
            WorkingProfile.PageItem = Page.Request.QueryString["cID"];
            AppraisalPage.SetPageAttribute2(Page);

            AppraisalPage.BuildingList(ddlCategory, "Category", User.Identity.Name,"","","",0);
          //  hfCategory.Value = ddlCategory.SelectedValue;

        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area ="SysSetup";
            string code =  Page.Request.QueryString["cID"] ;
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "SysSetup";
            hfCode.Value = code;



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

            string category = ddlCategory.SelectedValue; 
            string itemType = Page.Request.QueryString["cID"];
            hfItemType.Value = itemType;
            ApplicationSetup.SystemItems(ref GridView1, action, User.Identity.Name, category,itemType);
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
            string category = ddlCategory.SelectedValue;
            string itemType = Page.Request.QueryString["cID"];
            string ids = "0";
            string itemcode = "";
            string itemName = "";
            string comments = "";
            string active = "0";
            string result = ApplicationSetup.SystemItems( "AddNew", User.Identity.Name, category, itemType, ids, itemcode, itemName, comments, active,"","");
            BindMyData();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMyData();
        }
    }
}