using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class PdfPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AssemblingPageTitle();
               if (CheckPdfReportViewAvailable() == "Pass")
                {
                    ContentMessageNotReady.Visible = false;
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

            if (appraisalRole == "Appraiser")
            {
                allowView = "Pass";
            }
            else
            {
                allowView = AppraisalProcess.CheckPDFViewPermission(appraisalRole, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, code, WorkingProfile.UserRole);

            }

            return allowView;

        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
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

