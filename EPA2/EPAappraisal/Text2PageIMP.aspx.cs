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
            //AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            //AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            //AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");

            //    AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            //    AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

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
         
            AppraisalData.AIPWorkingTemplate2(ref GridView1,action,category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }

       
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);
            //string category = WorkingAppraisee.AppraisalType;
            //string area = WorkingAppraisee.AppraisalArea;
            //string code = WorkingAppraisee.AppraisalCode;
            //string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            //string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            //string pageEP = AppraisalProcess.AppraisalPageItem("PageEP", User.Identity.Name, category, area, code);
            //string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);
            //string AppraisalRole = WorkingProfile.UserAppraisalRole;//  AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);
            //string SignOff = SignatureProcess.SignOffComplete(User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value,hfApprEmployeeID.Value, hfApprSession.Value,  category, area, WorkingProfile.UserRole);
            //if (SignOff == "Complete")
            //{
            //    hfPageReadonly.Value = "Yes";
            //    imgSignOff.Visible = true;
            //}
            //else
            //{
            //    imgSignOff.Visible = false;
            //    if (pageFor == "Both")
            //    { hfPageReadonly.Value = "No"; }
            //    else
            //    {
            //        if (pageFor == AppraisalRole)
            //        { hfPageReadonly.Value = "No"; }
            //        else
            //        { hfPageReadonly.Value = "Yes"; }
            //        if (WorkingProfile.UserRoleLogin == "Admin")
            //        { hfPageReadonly.Value = "No"; }
            //    }
            //}

            //if (hfPageReadonly.Value == "Yes")
            //{
            //    imgRecovery.Visible = false;
            //    imgCommentsMenu.Visible = false;
            //}
            //else
            //{
            //    imgCommentsMenu.Visible = true;
            //    if (pageRecover == "Y")
            //    { imgRecovery.Visible = true; }
            //}
            //if (pageEP == "Y")
            //{
            //    imgEP.Visible = true;
            //}

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
