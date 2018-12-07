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
    public partial class DomainEvidenceLogLookFosList : System.Web.UI.Page
    {
        string domainID;
        string competencyID;
        protected void Page_Load(object sender, EventArgs e)
        {
           
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();

                AssemblingLookForsList();
               // checkPageReadonly();
            }
           

        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
                   hfDomainID.Value = Page.Request.QueryString["dID"];
                hfCompetencyID.Value = Page.Request.QueryString["cID"];
                hfAllowView.Value = Page.Request.QueryString["vID"];
                hfObjRole.Value = Page.Request.QueryString["oID"];
            AppraisalPage.SetPageAttribute(Page);
    
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

            if (hfAppraisalActionRole.Value == hfObjRole.Value)
            {
                btnAddNew.Enabled = true;
            }
        }

        private void AssemblingLookForsList()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
             domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            string objRole = hfObjRole.Value;
             CompetencyList.BuildingLookForsList(ref GridView1,"Get", category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole, objRole);
    
        }
  
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            string objRole = hfObjRole.Value;

            string lookForsID = "0";
            string mycheck ="1";
             DateTime today = DateTime.Today;
            string mydate =  DateFC.YMD(today) ;
            string allowview = hfAllowView.Value;

           string result = AppraisalProcess.LookForsList("AddNew", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, code, domainID, competencyID, actionRole, lookForsID, mycheck, mydate, allowview);

 
            AssemblingLookForsList();
        }
    }
}
