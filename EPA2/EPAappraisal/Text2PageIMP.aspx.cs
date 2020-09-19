using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class Text2PageImp : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;         
                SetPageAttribution();              
                BindMyData();
                CheckPageReadonly();
              //  checkGAPExists();
            }
       

        }
        private void CheckGapExists()
        {
           // btnViewAGP.Text = AppraisalDataAGP.AGPWorkingListContent("CheckAGP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode,WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID,  WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, WorkingAppraisee.AppraisalCode);
        }
        private void SetPageAttribution()
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

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
   

            string sectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (sectionStartPage.IndexOf(code) == -1)
            { btnPrevious.Enabled = true; }
            else
            {
                btnPrevious.Enabled = false;
            }
        }
        protected void BtnAddNewAGP_Click(object sender, EventArgs e)
        {
            OperationMyList("AddNewGoal");
        }

        protected void BindMyData()
        {
             OperationMyList("Get"); 
       }
                                                                     
       
        protected void OperationMyList(string action)
        {

         //   string category = hfCategory.Value;
          //  string area = hfArea.Value;
          //  string code = hfCode.Value;

         //  GridView1.DataSource = AppraisalData.AIPWorkingTemplate2DataSource( action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //   GridView1.DataBind();

            var parameter = new ClassLibrary.AppraisalComment()
            {
                Operate = action,
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value
            };
            AppraisalData.IMPWorkingTemplate2(ref GridView1, parameter);
        }

       
        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);
          
        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            BindMyData();
        }
        private void GoToNewPage(string action)
        {
            var parameter = new
            {
                Operate = action,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Code = hfCode.Value
            };
             string goPage = AppraisalPage.GoPage(parameter);//    AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);
            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }

    
    }
}
