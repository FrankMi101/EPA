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
    public partial class DomainEvidenceLog : System.Web.UI.Page
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
             }
            domainID = hfCode.Value.Replace("LOG5", "");

        }
        private void setPageAttribution()
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
            domainID = hfDomainID.Value;
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
        //    AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }
        private void AssemblingCompetencyList()
        {
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("LOG5", "");
            domainID = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingListForLOG(ref ContentCompetency, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID);          
            hfCompetencyID.Value = CompetencyList.CurrerntCompetencyID(ref ContentCompetency, domainID);//  currerntCompetencyID();
            competencyID = hfCompetencyID.Value;
            string objRole = hfObjRole.Value;
            string allowview = "0";
            if (chbAllowAppraiser.Checked)
            {
                allowview = "1";
            }
            var goPage = "DomainEvidenceLogLookFosList.aspx?dID=" + domainID + "&cID=" + competencyID + "&vID=" + allowview + "&oID=" + objRole;

            IframeLookFors.Attributes.Add("src", goPage);
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

        protected void chbAllowAppraiser_CheckedChanged(object sender, EventArgs e)
        {
            if (chbAllowAppraiser.Checked)
            { Session["AllowAppraiser"] = "1"; }
            else
            { Session["AllowAppraiser"] = "0"; }
            AssemblingCompetencyList();
        }
    }
}
