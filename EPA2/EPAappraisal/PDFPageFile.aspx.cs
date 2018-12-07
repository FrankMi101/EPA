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
    public partial class PDFPageFile : System.Web.UI.Page
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
            string sessionID = WorkingAppraisee.SessionID;
            string employeeD = WorkingAppraisee.EmployeeID;
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string ApprRole = WorkingProfile.UserAppraisalRole;
            if (sessionID == null)
            {
                WorkingAppraisee.SessionID =  WorkingAppraisee.AppraisalWorkingSession;
                sessionID = WorkingAppraisee.SessionID;
            }
            string reportName = AppraisalDataAC.ReportName("PDFName", User.Identity.Name, category, area, code);
            if (reportName == "")
            {
                LoadingRow.Visible = false;
                PDFiFramePage.Attributes.Add("src", "PDFPageFile2.aspx");
            }
            else
            {  
            ReportRender.RenderReport(reportName, schoolyear, schoolcode, employeeD, sessionID, User.Identity.Name,category, ApprRole);
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
 
