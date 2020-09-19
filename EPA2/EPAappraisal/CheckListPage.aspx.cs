using ClassLibrary;
using System;
using System.Web.UI;

namespace EPA2.EPAappraisal
{
    public partial class CheckListPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                BindMyData();
                CheckPageReadonly();
            }
            AssemblingPageTitle();
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            AppraisalPage.SetPageAttribute(Page);
        }

        private void AssemblingPageTitle()
        {
            var parameter = new TitleHelp() {
                UserID = User.Identity.Name,
                Category = WorkingAppraisee.AppraisalType,
                Area = WorkingAppraisee.AppraisalArea,
                Code = WorkingAppraisee.AppraisalCode
            };
           

            AppraisalPage.BuildingTitleTab(ref PageTitle, parameter);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", parameter);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", parameter);


        }
        protected void BindMyData()
        {
            OperationMyData("Get");
        }

        protected void CblParticipation_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyData("Save");
        }
        protected void OperationMyData(string action)
        {
            var parameter = new AppraisalComment 
            {
                Operate = "Chose",
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                SessionID = hfApprSession.Value,
                ItemCode = hfCode.Value,
                EmployeeID = hfApprEmployeeID.Value
            }; 
            AppraisalData.CheckList(ref cblParticipation, action, parameter);
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
