using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace EPA2.EPAsystem
{
    public partial class DomainCompetencySetup : System.Web.UI.Page
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
            WorkingProfile.PageArea = "Competency";
            WorkingProfile.PageItem = "Competency";
            AppraisalPage.SetPageAttribute2(Page);
         //   myList.SetLists(ddlDomain, "DomainList", User.Identity.Name);
            AppraisalPage.BuildingListControl(ddlDomain, "DomainList", User.Identity.Name);


        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "Competency";
            string code = "Competency";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = category;
            hfArea.Value = area;


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
            string area = ddlDomain.SelectedValue;
            ApplicationSetup.CompetencyList(ref GridView1, action, User.Identity.Name, category, area);
        }



        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = ddlDomain.SelectedValue;
            //  string result = ApplicationSetupData.Competency("AddNew", User.Identity.Name, category, area, "0", "", "", "", "0", "0", "0", "0");
            //  BindMyData();
            ApplicationSetup.CompetencyList(ref GridView1, "AddNew", User.Identity.Name, category, area);
        }

        protected void ddlDomiin_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMyData();
        }

    }
}