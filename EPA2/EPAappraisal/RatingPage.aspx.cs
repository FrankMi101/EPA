using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAappraisal
{
    public partial class RatingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AssemblingPageTitle();
                BindMyData();
                CheckPageReadonly();
            }
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code+"1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code+"2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code+"3");
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code + "1");
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

            AppraisalPage.BuildingList(rblRating, "RatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode, WorkingAppraisee.SessionID);

            if (category == "PPA" || category == "LTO" || category =="BPA")
            {
                ChkListArea.Visible = false;
            }

        }
        protected void BindMyData()
        {
            OperationMyData("Get");
            OperationMyList("Get");
        }
        protected void RblRating_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyList("Save");
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
            //TextBox myBox = new TextBox();
            //string category = hfCategory.Value;
            //string area = hfArea.Value;
            //string code = hfCode.Value;
            //AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);


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
            AppraisalData.Comments(ref myText, ref textCount, action, 5000, parameter);



        }
        protected void OperationMyList(string action)
        {
            //string category = hfCategory.Value;
            //string area = hfArea.Value;
            //string code = hfCode.Value;
            // AppraisalData.RatingListContent(ref rblRating, action, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value );

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
            AppraisalData.RatingListContent(ref rblRating, action, parameter);



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
