
using BLL;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace EPA2.EPAappraisal
{
    public partial class PdfPageFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadingReport();
            }

        }


        private void LoadingReport()
        {


            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string sessionId = WorkingAppraisee.SessionID;
            string employeeId = WorkingAppraisee.EmployeeID;
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string apprRole = WorkingProfile.UserAppraisalRole;
            if (sessionId == null)
            {
                WorkingAppraisee.SessionID = WorkingAppraisee.AppraisalWorkingSession;
                sessionId = WorkingAppraisee.SessionID;
            }
            string reportName = AppraisalPage.ReportName("PDFReportName", User.Identity.Name, category, area, code);


            if (reportName == "")
            {
                LoadingRow.Visible = false;
                PDFiFramePage.Attributes.Add("src", "PDFPageFile2.aspx");
            }
            else
            {
                var myParameter = new List<ReportParameter>
                {
                    ReportRender.GetParameter(1, "Operate", apprRole),
                    ReportRender.GetParameter(2, "UserID", User.Identity.Name),
                    ReportRender.GetParameter(3, "SchoolYear", schoolyear),
                    ReportRender.GetParameter(4, "SchoolCode", schoolcode),
                    ReportRender.GetParameter(5, "EmployeeID", employeeId),
                    ReportRender.GetParameter(6, "SessionID", sessionId),
                    ReportRender.GetParameter(7, "Category", category)
                };
               

                Byte[] myReport = ReportRender.GetReportR2(reportName, "PDF", myParameter);
                if (myReport.Length > 10 )
                    ReportRender.RenderDocument(myReport, reportName, "PDF");
                else
                   LabelNoPDFFile.Visible = true;
            }



        }
        //private string getReportNamebyCode(string category, string itemCode)
        //  {
        //      string rValue = "";
        //      switch (itemCode)       
        //      {
        //          case "OBS99":
        //              rValue = "ObservationForm";
        //              break;
        //          case "SUM99":
        //              rValue = "SummativeReport";
        //              break;
        //          case "LOG99":
        //              rValue = "Evidenclog";
        //              break;
        //          case "IMP99":
        //              rValue = "ImprovementPlan";
        //              break;
        //          case "ENR99":
        //              rValue = "EnrichmentPlan";
        //              break;
        //          case "STR99":
        //              rValue = "IndividualStrategy";
        //              break;
        //          case "ALP99":
        //              rValue = "AnnualLearningPlan";
        //              break;
        //          default:
        //              rValue = "AnnualLearningPlan";
        //              break;
        //      }

        //      return rValue;
        //  }
    }

}

