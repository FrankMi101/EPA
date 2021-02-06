using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI; 

namespace EPA2.EPAappraisal
{
    public partial class ObservationPage : System.Web.UI.Page
    {
        string _domainId;
        string _competencyId;
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
            _domainId = hfCode.Value.Replace("SUM5", "");

        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);

            hfDomainID.Value = hfCode.Value.Replace("SUM5", "");
            _domainId = hfDomainID.Value;
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

            //    AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            //    AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }


        protected void BindMyData()
        {
            OperationMyDate("Get");
            OperationMyList("Get"); 
       }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyDate("Save");
                hfContentChange.Value = "0";
            }
        }
        protected void dateObservation_change(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyDate("Save");
                hfContentChange.Value = "0";
            }
        }

    
        //protected void OperationMyData(string action)
        //{

        //    string category = hfCategory.Value;
        //    string area = hfArea.Value;
        //    string code = hfCode.Value;
        //    domainID = hfDomainID.Value;
        //    competencyID = hfCompetencyID.Value;
        //    AppraisalData.ObservationDate(ref myText, ref textCount, action,250, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        //}
        protected void OperationMyDate(string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            if (code == "OBS22")
            {
                chbCopyOver.Text = "Copy over comments of Competencies to Post Classroom Observation";
            }
            if (code =="OBS23")
            {
                chbCopyOver.Visible = false;
            }
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            AppraisalData.ObservationDate(ref dateObservation, ref myText, ref textCount, action, 2000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value );
        }
        protected void OperationMyList(string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            AppraisalData.ObservationList(ref  GridView1,action,category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId);
        }

        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

            if (hfSignOff.Value == "Complete")
            {
                dateObservation.Disabled = true;
                myText.Enabled = false;
                GridView1.Enabled = false;
            }
            else
            {
                if (WorkingProfile.UserAppraisalRole == "Appraisee")
                { dateObservation.Disabled = true;
                    myText.Enabled = true;
                    GridView1.Enabled = true;
                }
                else
                { }
            }

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
