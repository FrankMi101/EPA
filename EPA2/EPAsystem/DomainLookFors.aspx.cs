using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class DomainLookFors : System.Web.UI.Page
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
            string domainID = Page.Request.QueryString["dID"];
            string competencyID = Page.Request.QueryString["cID"];
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "LookFors";
            WorkingProfile.PageItem = "LookFors";
            AppraisalPage.SetPageAttribute2(Page);
            AppraisalData.BuildingListControl(ddlDomain, "DomainList", User.Identity.Name,domainID);
            AppraisalData.BuildingListControl(ddlCompetency, "CompetencyList", User.Identity.Name, domainID, competencyID);

            //myList.SetLists(ddlDomain, "DomainList", User.Identity.Name);
            //myList.SetListValue(ddlDomain, domainID);
            //myList.SetLists(ddlCompetency, "CompetencyList", User.Identity.Name,ddlDomain.SelectedValue);
            //myList.SetListValue(ddlCompetency, competencyID);
        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "LookFors";
            string code = "LookFors";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = category;
            hfArea.Value = area;

                                                           
            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code+"1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code+"2");
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
            string competencyID = ddlCompetency.SelectedValue;
            ApplicationSetup.LookForsList(ref GridView1, action, User.Identity.Name, category, area, competencyID);
        }



        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = ddlDomain.SelectedValue;
            string competencyID = ddlCompetency.SelectedValue;
            ApplicationSetup.LookForsList(ref GridView1, "AddNew", User.Identity.Name, category, area, competencyID);
            //   string result = ApplicationSetupData.LookFors("AddNew", User.Identity.Name, category, area, competency, "0", "", "", "","1");
            //  BindMyData();
        }

        protected void ddlDomiin_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  myList.SetLists(ddlCompetency, "CompetencyList", User.Identity.Name, ddlDomain.SelectedValue);
             AppraisalData.BuildingListControl(ddlCompetency, "CompetencyList", User.Identity.Name, ddlDomain.SelectedValue,0);
         ddlCompetency.SelectedIndex = 0;

  
            BindMyData();
       }
        protected void ddlCompetency_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMyData();
        }
    }
}