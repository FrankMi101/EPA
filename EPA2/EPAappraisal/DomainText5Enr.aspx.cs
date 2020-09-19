using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class DomainText5Enr : System.Web.UI.Page
    {
        string _domainId;
        string _competencyId;
        protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                AssemblingCompetencyList();
                SetPageAttribution();

                BindMyData();
                CheckPageReadonly();
            }
            _domainId = hfCode.Value.Replace("ENR5", "");

        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);

            hfDomainID.Value = hfCode.Value.Replace("ENR5", "");
            _domainId = hfDomainID.Value;
            hfAppraisalActionRole.Value = WorkingProfile.UserAppraisalRole;// AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserId);

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

            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }
        private void AssemblingCompetencyList()
        {
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("ENR5", "");
            _domainId = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingListForLog(ref ContentCompetency, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, _domainId);

            hfCompetencyID.Value = CurrerntCompetencyId();
            _competencyId = hfCompetencyID.Value;

        }
        private string CurrerntCompetencyId()
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

        protected void BindMyData()
        {
            //  OperationMyData("Get");
            //   OperationMyList("Get");
        }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                //  OperationMyData("Save", sender);
                hfContentChange.Value = "0";
            }
        }

        protected void btnCompetency_Click(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                //   OperationMyData("Save",  );
                hfContentChange.Value = "0";
            }
            else
            {
                BindMyData();
            }
        }
        protected void OperationMyData(string action, TextBox myText)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            AppraisalData.DomainTextLog(ref myText1, ref textCount, action, 1000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole);
            AppraisalData.DomainTextLog(ref myText2, ref textCount, action, 1000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole);
            AppraisalData.DomainTextLog(ref myText3, ref textCount, action, 1000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole);
            AppraisalData.DomainTextLog(ref myText4, ref textCount, action, 1000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole);
            AppraisalData.DomainTextLog(ref myText5, ref textCount, action, 1000, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole);
        }
        protected void OperationMyList(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            //    AppraisalData.DomainListContent(ref rblRateRubric, action, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
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
            //  AssemblingCompetencyList();
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
