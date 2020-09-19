using ClassLibrary;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11NotExists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label1.Text = Page.Request.QueryString["pID"];
                SetPageAttribution();
                AssemblingPageTitle();
                BindMyData();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = WorkingAppraisee.AppraisalType;
            hfPageID.Value = WorkingAppraisee.AppraisalArea;
            hfCode.Value = WorkingAppraisee.AppraisalCode;
            hfArea.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfContentChange.Value = "0";  // initila page content for not a change statue
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            Labelcategory.Text = category;
            LabelArea.Text = area;
            LabelCode.Text = code;
            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);
        }
        protected void BindMyData()
        {
            OperationMyData("Get");
        }
        protected void MyText_TextChanged(object sender, EventArgs e)
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

            var parameter = new AppraisalComment()
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


            AppraisalData.Comments(ref myText, ref textCount, action, 5000, parameter);// category, area, code,User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
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
