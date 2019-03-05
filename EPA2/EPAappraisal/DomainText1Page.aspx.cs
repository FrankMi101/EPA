using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
using System.Web.UI.HtmlControls;
using BLL;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class DomainText1Page : System.Web.UI.Page
    {
        string domainID;
        string competencyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblingCompetencyList();
                AssembingRubricList();
                BindMyData();
                checkPageReadonly();
            }
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("SUM5", "");

        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("SUM5", "");

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


        }
        private void AssemblingCompetencyList()
        {

            domainID = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingList(ref ContentCompetency, User.Identity.Name, hfApprYear.Value, hfApprSession.Value, hfApprEmployeeID.Value, hfApprSchool.Value, category, domainID);

            hfCompetencyID.Value = CompetencyList.CurrerntCompetencyID(ref ContentCompetency, domainID);// currerntCompetencyID();

            competencyID = hfCompetencyID.Value;
            string itemCount = CompetencyList.listCount(User.Identity.Name, hfApprYear.Value, hfApprSession.Value, hfApprEmployeeID.Value, hfApprSchool.Value, category, domainID);
            myText.Height = getTextHeightByCount(itemCount);

        }
        private string currerntCompetencyID()
        {
            if (hfDomainID.Value == "6")
            {
                return "20";
            }
            else
            {
                foreach (Control c in ContentCompetency.Controls)
                {
                    foreach (Control childc in c.Controls)
                    {
                        if (childc is HtmlAnchor)
                        {
                            return childc.ID;
                        }
                    }
                }
                return "1";
            }

        }
        private void AssembingRubricList()
        {
            string category = WorkingAppraisee.AppraisalType;
            //string domainID = "1";
            competencyID = hfCompetencyID.Value;
            if (competencyID == "20")
            {
                rblRateRubric.Visible = false;
            }
            else
            {
                rblRateRubric.Visible = true;
               // var parameter = CommonParameters.GetListParameters("CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode, "");
               AppraisalData.BuildingListControl(rblRateRubric, "CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode, ""); 
             //   myList.SetLists(rblRateRubric, "CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode);
 

          }
            // lblSatisfacotyRubric.Text = AppraisalProcess.Rubrics("Satisfactory", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID,competencyID);
            // lblDevelopNeededRubric.Text = AppraisalProcess.Rubrics("DevelopNeeded", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID, competencyID);
            //lblUnSatisfacotyRubric.Text = AppraisalProcess.Rubrics("Unsatisfactory", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID, competencyID);
        }
        private System.Web.UI.WebControls.Unit getTextHeightByCount(string itemCount)
        {
            string category = WorkingAppraisee.AppraisalType;
            System.Web.UI.WebControls.Unit xUnit;
            switch (itemCount)
            {
                case "1":
                    xUnit = (category == "TPA") ? 400 : 400;
                    break;
                case "2":
                    xUnit = (category == "TPA") ? 350 : 380;
                    break;
                case "3":
                    xUnit = (category == "TPA") ? 330 : 350;
                    break;
                case "4":
                    xUnit = (category == "TPA") ? 330 : 330;
                    break;
                case "5":
                    xUnit = (category == "TPA") ? 280 : 300;
                    break;
                default:
                    xUnit = 500;
                    break;
            }
            return xUnit;
        }
        protected void BindMyData()
        {
            OperationMyData("Get");
            OperationMyList("Rate");
        }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save");
                hfContentChange.Value = "0";
            }
        }
        protected void rblRateRubric_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  OperationMyList("Save");
        }
        protected void btnCompetency_Click(object sender, EventArgs e)
        {
            //if (hfContentChange.Value == "1")
            //{
            //    OperationMyData("Save");
            //    hfContentChange.Value = "0";
            //}
            //else
            //{
            //    BindMyData();
            //}
        }
        protected void OperationMyData(string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
            AppraisalData.DomainTextContent(ref myText, ref textCount, action, 2000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
        }
        protected void OperationMyList(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
            AppraisalData.DomainListContent(ref rblRateRubric, action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
        }
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);


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
            AssemblingCompetencyList();
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
