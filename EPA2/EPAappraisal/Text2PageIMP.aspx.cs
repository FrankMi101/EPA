using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class Text2PageIMP : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;         
                setPageAttribution();              
                BindMyData();
                checkPageReadonly();
              //  checkGAPExists();
            }
       

        }
        private void checkGAPExists()
        {
           // btnViewAGP.Text = AppraisalDataAGP.AGPWorkingListContent("CheckAGP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode,WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID,  WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, WorkingAppraisee.AppraisalCode);
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
   

            string SectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (SectionStartPage.IndexOf(code) == -1)
            { btnPrevious.Enabled = true; }
            else
            {
                btnPrevious.Enabled = false;
            }
        }
        protected void btnAddNewAGP_Click(object sender, EventArgs e)
        {
            OperationMyList("AddNewGoal");
        }

        protected void BindMyData()
        {
             OperationMyList("Get"); 
       }
                                                                     
       
        protected void OperationMyList(string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            GridView1.DataSource = AppraisalData.AIPWorkingTemplate2DataSource( action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            GridView1.DataBind();

         //   AppraisalData.AIPWorkingTemplate2(ref GridView1,action,category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }

       
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);
          
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            BindMyData();
        }
        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string goPage = AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }

    
    }
}
