using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class DomainLookForsSetup : System.Web.UI.Page
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
            WorkingProfile.PageArea = "LookFors";
            WorkingProfile.PageItem = "LookFors";
            AppraisalPage.SetPageAttribute2(Page);
          //  myList.SetLists(ddlDomain, "DomainList", User.Identity.Name);
            AppraisalData.BuildingListControl(ddlDomain, "DomainList", User.Identity.Name);
        
        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "LookFors";
            string code = "LookFors";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = category;
            hfArea.Value = area;


          //  AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
        }


        protected void BindMyData()
        {
            OperationMyList("LookFors");
            hfContentChange.Value = "0";
        }



        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = ddlDomain.SelectedValue;
            ApplicationSetup.CompetencyList(ref GridView1, action, User.Identity.Name, category, area,"LookFors");
        }

        protected void ddlDomiin_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMyData();
        }

    }
}