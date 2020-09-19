using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
namespace EPA2.EPAappraisal
{
    public partial class DomainEvidenceLog : System.Web.UI.Page
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
             }
            _domainId = hfCode.Value.Replace("LOG5", "");

        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);
            if (WorkingProfile.UserAppraisalRole == "Appraisee")
            { chbAllowAppraiser.Visible = true;
                try
                { if (Session["AllowAppraiser"].ToString() == "1")
                {
                    chbAllowAppraiser.Checked = true;
                } }
                catch { }
               
                
            }
            hfObjRole.Value = WorkingProfile.UserAppraisalRole;
            hfDomainID.Value = hfCode.Value.Replace("LOG5", "");
            _domainId = hfDomainID.Value;
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserId);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
        //    AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }
        private void AssemblingCompetencyList()
        {
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("LOG5", "");
            _domainId = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingListForLog(ref ContentCompetency, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, _domainId);          
            hfCompetencyID.Value = CompetencyList.CurrerntCompetencyId(ref ContentCompetency, _domainId);//  currerntCompetencyID();
            _competencyId = hfCompetencyID.Value;
            string objRole = hfObjRole.Value;
            string allowview = "0";
            if (chbAllowAppraiser.Checked)
            {
                allowview = "1";
            }
            var goPage = "DomainEvidenceLogLookFosList.aspx?dID=" + _domainId + "&cID=" + _competencyId + "&vID=" + allowview + "&oID=" + objRole;

            IframeLookFors.Attributes.Add("src", goPage);
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

        protected void ChbAllowAppraiser_CheckedChanged(object sender, EventArgs e)
        {
            if (chbAllowAppraiser.Checked)
            { Session["AllowAppraiser"] = "1"; }
            else
            { Session["AllowAppraiser"] = "0"; }
            AssemblingCompetencyList();
        }
    }
}
