using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class PdfPageFromList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AssemblingPageTitle();
                if (CheckPdfReportViewAvailable() == "Pass")
                {
                    PDFiFramePage.Attributes.Add("src", "PDFPageFile.aspx");    
                }
                else
                {
                    labelMessage.Text = labelMessage.Text + " Not Ready for View!!! ";
                }
            }
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

            labelMessage.Text = GetReportTitlebyCode();
        }
        private string GetReportTitlebyCode()
        {
           
            switch (WorkingAppraisee.AppraisalCode)
            {
                case "OBS99":
                    return  "Observation Form Data";                   
                case "SUM99":
                    return  "Appraisal Summative Report";                    
                case "LOG99":
                    return  "Evidenc log Report";                   
                case "IMP99":
                    return  "Improvement Plan";                    
                case "ENR99":
                    return  "Enrichment Plan";                   
                case "STR99":
                    return  "Individual NTIP Strategy";                   
                case "ALP99":
                    return  "Annual Learning Plan";                   
                case "AGP99":
                    return  "Annual Growth Plan";                   
                case "APP99":
                    return  "Principal Performance Plan";                   
                default:
                    return "Annual Learning Plan";
            }

        }
        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }


        private string CheckPdfReportViewAvailable()
        {
            string allowView = "NotPass";
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string appraisalRole = AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);

            if (WorkingAppraisee.SessionID == null)
            {
                WorkingAppraisee.SessionID = WorkingAppraisee.AppraisalWorkingSession;  
            }
            if (appraisalRole == "Appraiser")
            {
                allowView = "Pass";
                labelMessage.Visible = false;
            }
            else
            {
                allowView = AppraisalProcess.CheckPDFViewPermission(appraisalRole, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, code, WorkingProfile.UserRole);

            }

            return allowView;

        }
       

    }

}

