using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary; 

namespace EPA2.EPAappraisal
{
    public partial class Text1Page : System.Web.UI.Page
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

            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


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


           // AppraisalComment paramaters = AppraisalCommentMethod.GetParameters(action, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, code, category, area); //  new AppraisalComment()

            //  AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //   AppraisalData.ITextContent(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //  AppraisalData.Comments(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
              AppraisalData.Comments(ref myText, ref textCount,action, 5000, parameter);// category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
        protected void CheckPageReadonly()

        {
            AppraisalPage.CheckPageReadOnly(Page,"Both",User.Identity.Name);
 
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
             string goPage = AppraisalPage.GoPage(parameter);//    AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);


            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
    }
}
