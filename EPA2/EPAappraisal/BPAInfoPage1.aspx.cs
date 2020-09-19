using System;
using System.Web.UI;


namespace EPA2.EPAappraisal
{
    public partial class BpaInfoPage1 : System.Web.UI.Page
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
            }

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
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalPage.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");
            AppraisalPage.BuildingTextTitle(ref labelTitle5, "Title", User.Identity.Name, category, area, code + "5");
            AppraisalPage.BuildingTextTitle(ref labelTitle6, "Title", User.Identity.Name, category, area, code + "6");
            AppraisalPage.BuildingTextTitle(ref labelTitle61, "Title", User.Identity.Name, category, area, code + "61");
            AppraisalPage.BuildingTextTitle(ref labelTitle62, "Title", User.Identity.Name, category, area, code + "62");
            AppraisalPage.BuildingTextTitle(ref labelTitle7, "Title", User.Identity.Name, category, area, code + "7");
            AppraisalPage.BuildingTextTitle(ref labelTitle8, "Title", User.Identity.Name, category, area, code + "8");




            { btnPrevious.Enabled = false; }

        }


        protected void BindMyData()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.BpaInformation("Get", ref DateReviewFrom, ref DateReviewTo, ref DateMid, ref DateFinal, ref labelContent1, ref labelContent2, ref labelContent3, ref labelContent4, ref labelContent5, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
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
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.BpaInformation("Save", ref DateReviewFrom, ref DateReviewTo, ref DateMid, ref DateFinal, ref labelContent1, ref labelContent2, ref labelContent3, ref labelContent4, ref labelContent5, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
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
