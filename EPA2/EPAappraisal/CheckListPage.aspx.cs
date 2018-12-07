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
    public partial class CheckListPage : System.Web.UI.Page
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
            AppraisalPage.SetPageAttribute(Page);
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
 

        }
        protected void BindMyData()
        {
            OperationMyData("Get");
        }

        protected void cblParticipation_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyData("Save");
        }
        protected void OperationMyData(string action)
        {
             string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.CheckList(ref cblParticipation, action,  category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

            //string category = WorkingAppraisee.AppraisalType;
            //string area = WorkingAppraisee.AppraisalArea;
            //string code = WorkingAppraisee.AppraisalCode;
            //string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            //string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            //string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);
            //string ActionRole = AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);
            //string SignOff = SignatureProcess.SignOffComplete(User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, category, area, WorkingProfile.UserRole);
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
            //        if (pageFor == ActionRole)
            //        { hfPageReadonly.Value = "No"; }
            //        else
            //        { hfPageReadonly.Value = "Yes"; }
            //    }
            //}

            //if (hfPageReadonly.Value == "Yes")
            //{
            //    imgRecovery.Visible = false;
            // }
            //else
            //{
            //     if (pageRecover == "Y")
            //    { imgRecovery.Visible = true; }
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
