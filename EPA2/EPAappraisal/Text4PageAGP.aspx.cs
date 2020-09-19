using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class Text4PageAGP : System.Web.UI.Page
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
                CheckGapExists();
            }
       

        }
        private void CheckGapExists()
        {
            var parameter = new AppraisalComment {
               Operate ="CheckAGP",
               UserID = User.Identity.Name,
               SchoolYear = WorkingAppraisee.AppraisalYear,
               SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
               EmployeeID = WorkingAppraisee.EmployeeID,
               SessionID = WorkingAppraisee.SessionID,
               Category = WorkingAppraisee.AppraisalType,
               Area = WorkingAppraisee.AppraisalArea,
               ItemCode = WorkingAppraisee.AppraisalCode

            };
            btnViewAGP.Text =  AppraisalProcess.ViewAGPButtonText("CheckAGP",parameter); // AppraisalDataAGP.AGPWorkingListContent("CheckAGP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode,WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, WorkingAppraisee.AppraisalCode);
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
            //AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            //AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            //AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");

            //    AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            //    AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

            string sectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (sectionStartPage.IndexOf(code) == -1)
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
         
          //  AppraisalData.AGPWorkingTemplate(ref  GridView1,action,category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);

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
            AppraisalData.AGPWorkingTemplate(ref GridView1, parameter);//  action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);

        }

        protected void btnViewAGP_onClick(object sender, EventArgs e)
        {
            if (btnViewAGP.Text == "RollOver Last AGP")
            {
             OperationMyList("RollOver");
           }
        }
        protected void CheckPageReadonly()
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
            var parameter = new
            {
                Operate = action,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Code = hfCode.Value
            };
             string goPage = AppraisalPage.GoPage(parameter);
            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }

    
    }
}
