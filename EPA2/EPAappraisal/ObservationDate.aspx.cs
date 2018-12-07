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
    public partial class ObservationDate : System.Web.UI.Page
    {
        //string domainID;
        //string competencyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;

                setPageAttribution();

                BindMyData();
                checkPageReadonly();
            }

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
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");
            AppraisalData.BuildingTextTitle(ref labelTitle5, "Title", User.Identity.Name, category, area, code + "5");
            AppraisalData.BuildingTextTitle(ref labelTitle6, "Title", User.Identity.Name, category, area, code + "6");

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


        protected void BindMyData()
        {
            OperationMyDate(ref dateObservation, "Get");
            OperationMyDate(ref dateObservationPre, "Get");
            OperationMyDate(ref dateObservationPost, "Get");
        }

        protected void dateObservation_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservation, "Save");
        }

        protected void dateObservationPre_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservationPre, "Save");

        }
        protected void dateObservationPost_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservationPost, "Save");

        }

        protected void OperationMyDate(ref HtmlInputText myDate, string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.ObservationDate(ref myDate, action, myDate.Name, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //    AppraisalData.ObservationDate(ref dateObservation, action, type, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //    AppraisalData.ObservationDate(ref dateObservationPost, action, type, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }


        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);


        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
            GoToNewPage("Next");
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
            GoToNewPage("Previous");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
        }
        private void SaveObservationDate()
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyDate(ref dateObservationPre, "Save");
                OperationMyDate(ref dateObservation, "Save");
                OperationMyDate(ref dateObservationPost, "Save");
            }
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
