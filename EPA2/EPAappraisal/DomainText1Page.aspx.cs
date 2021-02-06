using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class DomainText1Page : System.Web.UI.Page
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
                AssemblingCompetencyList();
                AssembingRubricList();
                BindMyData();
                CheckPageReadonly();
            }
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("SUM5", "");

        }
        private void SetPageAttribution()
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

            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }
        private void AssemblingCompetencyList()
        {

            _domainId = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingList(ref ContentCompetency, User.Identity.Name, hfApprYear.Value, hfApprSession.Value, hfApprEmployeeID.Value, hfApprSchool.Value, category, _domainId);

            hfCompetencyID.Value = CompetencyList.CurrerntCompetencyId(ref ContentCompetency, _domainId);// currerntCompetencyID();

            _competencyId = hfCompetencyID.Value;
            string itemCount = CompetencyList.ListCount(User.Identity.Name, hfApprYear.Value, hfApprSession.Value, hfApprEmployeeID.Value, hfApprSchool.Value, category, _domainId);
            myText.Height =  GetTextHeightByCount(itemCount);

        }
        private string CurrerntCompetencyId()
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
            _competencyId = hfCompetencyID.Value;
            if (_competencyId == "20")
            {
                rblRateRubric.Visible = false;
            }
            else
            {
                rblRateRubric.Visible = true;
                // var parameter = CommonParameters.GetListParameters("CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode, "");
                  //   myList.SetLists(rblRateRubric, "CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode);
              AppraisalPage.BuildingListControl(rblRateRubric, "CompetencyRatingList", User.Identity.Name, category, WorkingAppraisee.AppraisalCode, "");


            }
            // lblSatisfacotyRubric.Text = AppraisalProcess.Rubrics("Satisfactory", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID,competencyID);
            // lblDevelopNeededRubric.Text = AppraisalProcess.Rubrics("DevelopNeeded", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID, competencyID);
            //lblUnSatisfacotyRubric.Text = AppraisalProcess.Rubrics("Unsatisfactory", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID, competencyID);
        }
        private System.Web.UI.WebControls.Unit GetTextHeightByCount(string itemCount)
        {
            string category = WorkingAppraisee.AppraisalType;
            System.Web.UI.WebControls.Unit xUnit;
            switch (itemCount)
            {
                case "1":
                    xUnit = (category == "TPA") ? 400 : 400;
                    break;
                case "2":
                    xUnit = (category == "TPA") ? 370 : 380;
                    break;
                case "3":
                    xUnit = (category == "TPA") ? 350 : 350;
                    break;
                case "4":
                    xUnit = (category == "TPA") ? 330 : 330;
                    break;
                case "5":
                    xUnit = (category == "TPA") ? 300 : 280;
                    break;
                case "6":
                    xUnit = (category == "TPA") ? 280 : 260;
                    break;
                case "7":
                    xUnit = (category == "TPA") ? 260 : 250;
                    break;
                case "8":
                    xUnit = (category == "TPA") ? 250 : 250;
                    break;
                case "9":
                    xUnit = (category == "TPA") ? 240 : 250;
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

           
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            AppraisalData.DomainTextContent(ref myText, ref textCount, action, 2000, hfCategory.Value, hfArea.Value, hfCode.Value, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId);
        }
        protected void OperationMyList(string action)
        {
           
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            AppraisalData.DomainListContent(ref rblRateRubric, action, hfCategory.Value, hfArea.Value, hfCode.Value, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId);
        }
        protected void CheckPageReadonly()
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
