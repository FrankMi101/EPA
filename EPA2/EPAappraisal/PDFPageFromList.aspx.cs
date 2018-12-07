using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class PDFPageFromList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                AssemblingPageTitle();
                if (checkPDFReportViewAvailable() == "Pass")
                {
                    PDFiFramePage.Attributes.Add("src", "PDFPageFile.aspx");    
                }
                else
                {
                    labelMessage.Text = labelMessage.Text + " Not Ready for View!!! ";
                }
            }
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

            labelMessage.Text = getReportTitlebyCode();
        }
        private string getReportTitlebyCode()
        {
            string rValue = "";
            switch (WorkingAppraisee.AppraisalCode)
            {
                case "OBS99":
                    rValue = "Observation Form Data";
                    break;
                case "SUM99":
                    rValue = "Appraisal Summative Report";
                    break;
                case "LOG99":
                    rValue = "Evidenc log Report";
                    break;
                case "IMP99":
                    rValue = "Improvement Plan";
                    break;
                case "ENR99":
                    rValue = "Enrichment Plan";
                    break;
                case "STR99":
                    rValue = "Individual NTIP Strategy";
                    break;
                case "ALP99":
                    rValue = "Annual Learning Plan";
                    break;
                case "AGP99":
                    rValue = "Annual Growth Plan";
                    break;
                case "APP99":
                    rValue = "Principal Performance Plan";
                    break;
                default:
                    rValue = "Annual Learning Plan";
                    break;
            }

            return rValue;
        }
        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }


        private string checkPDFReportViewAvailable()
        {
            string allowView = "NotPass";
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string AppraisalRole = AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);

            if (WorkingAppraisee.SessionID == null)
            {
                WorkingAppraisee.SessionID = WorkingAppraisee.AppraisalWorkingSession;  
            }
            if (AppraisalRole == "Appraiser")
            {
                allowView = "Pass";
                labelMessage.Visible = false;
            }
            else
            {
                allowView = AppraisalProcess.CheckPDFViewPermission(AppraisalRole, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, code, WorkingProfile.UserRole);

            }

            return allowView;

        }
       

    }

}

