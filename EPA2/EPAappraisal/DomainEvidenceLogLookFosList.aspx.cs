
using System;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
    public partial class DomainEvidenceLogLookFosList : System.Web.UI.Page
    {
        string _domainId;
        string _competencyId;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();

                AssemblingLookForsList();
                // checkPageReadonly();
            }


        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            hfDomainID.Value = Page.Request.QueryString["dID"];
            hfCompetencyID.Value = Page.Request.QueryString["cID"];
            hfAllowView.Value = Page.Request.QueryString["vID"];
            hfObjRole.Value = Page.Request.QueryString["oID"];
            AppraisalPage.SetPageAttribute(Page);

            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserId);

            if (hfAppraisalActionRole.Value == hfObjRole.Value)
            {
                btnAddNew.Enabled = true;
                GridView1.Enabled = true;

            }
            else
            {
                btnAddNew.Enabled = false;
                GridView1.Enabled = false;
            }
        }

        private void AssemblingLookForsList()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            string objRole = hfObjRole.Value;
          //  WorkingAppraisee.AppraisalSchoolCode = hfApprSchool.Value;
            CompetencyList.BuildingLookForsList(ref GridView1, "Get", category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId, actionRole, objRole);

        }

        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

        }

        protected void BtnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            string objRole = hfObjRole.Value;

            string lookForsId = "0";
            bool mycheck = true;
            DateTime today = DateTime.Today;
            string mydate = DateFC.YMD(today);
            string allowview =   actionRole == objRole ?  "1" : hfAllowView.Value;
          
;
            string result = AppraisalProcess.LookForsList("AddNew", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, code, _domainId, _competencyId, actionRole, lookForsId, mycheck, mydate, allowview);


            AssemblingLookForsList();
        }
    }
}
