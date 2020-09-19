using ClassLibrary;
using System;
using System.Web.UI;
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


        protected void BindMyData()
        {
            hfContentChange.Value = "0";
             OperationMyDate(ref dateObservationPre, "OBS21", "GetDate");
             OperationMyDate(ref dateObservation, "OBS22", "GetDate");
            OperationMyDate(ref dateObservationPost, "OBS23", "GetDate");
        }

        protected void DateObservation_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservation, "OBS22", "SaveDate");
        }

        protected void DateObservationPre_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservationPre, "OBS21", "SaveDate");

        }
        protected void DateObservationPost_change(object sender, EventArgs e)
        {

            OperationMyDate(ref dateObservationPost, "OBS23", "SaveDate");

        }

        protected void OperationMyDate(ref HtmlInputText myDate, string itemcode, string action)
        {
            var parameter = new AppraisalDate()
            {
                Operate = "Date",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = itemcode
            };
            //string category = hfCategory.Value;
            //string area = hfArea.Value;
            //string code = hfCode.Value;
            AppraisalData.ObservationDate(ref myDate, parameter, action); //, myDate.Name, category, area, itemcode, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //    AppraisalData.ObservationDate(ref dateObservation, action, type, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            //    AppraisalData.ObservationDate(ref dateObservationPost, action, type, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
       
        }


        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);
            BaseData.ShowSP("AppraisalContents", "ObservationDate", btnSave);

        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
            GoToNewPage("Previous");
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            SaveObservationDate();
        }
        private void SaveObservationDate()
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyDate(ref dateObservationPre, "OBS21", "SaveDate");
                OperationMyDate(ref dateObservation, "OBS22", "SaveDate");
                OperationMyDate(ref dateObservationPost, "OBS23", "SaveDate");
                hfContentChange.Value = "0";
            }
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
