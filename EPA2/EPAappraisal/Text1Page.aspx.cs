using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class Text1Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                BindMyData();
                checkPageReadonly();
            }
            AssemblingPageTitle();
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            AppraisalPage.SetPageAttribute( Page);
            //hfCategory.Value = WorkingAppraisee.AppraisalType;
            //hfPageID.Value = WorkingAppraisee.AppraisalArea;
            //hfCode.Value = WorkingAppraisee.AppraisalCode;
            //hfArea.Value = WorkingAppraisee.AppraisalArea;
            //hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            //hfRunningModel.Value = WebConfig.RunningModel();
            //hfContentChange.Value = "0";  // initila page content for not a change statue
            //hfApprYear.Value = WorkingAppraisee.AppraisalYear;
            //hfApprSchool.Value = WorkingAppraisee.AppraisalSchoolCode;
            //hfApprSession.Value = WorkingAppraisee.SessionID;
            //hfApprEmployeeID.Value = WorkingAppraisee.EmployeeID;
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


            //  if (code.Substring(code.Length - 2) == "11")
            //string SectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            //if (SectionStartPage.IndexOf(code) == -1)
            //{ btnPrevious.Enabled = true; }
            //else
            //{
            //    btnPrevious.Enabled = false;
            //}

        }
        protected void BindMyData()
        {
            OperationMyData("Get");
        }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save");
                hfContentChange.Value = "0";
            }
        }
        protected void OperationMyData(string action)
        {
            TextBox myBox = new TextBox();
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
          //  AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
         //   AppraisalData.ITextContent(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            AppraisalData.Comments(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
        protected void checkPageReadonly()

        {
            AppraisalPage.CheckPageReadOnly(Page,"Both",User.Identity.Name);


            //string category = WorkingAppraisee.AppraisalType;
            //string area = WorkingAppraisee.AppraisalArea;
            //string code = WorkingAppraisee.AppraisalCode;
            //string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            //string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            //string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);
            //string pageEP = AppraisalProcess.AppraisalPageItem("PageEP", User.Identity.Name, category, area, code);
            //string AppraisalRole = WorkingProfile.UserAppraisalRole; //  AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);
            //string SignOff = SignatureProcess.SignOffComplete("Both", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, area, WorkingProfile.UserRole);
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
