using System;
using System.Web.UI;

namespace EPA2.EPAappraisal
{
    public partial class PdfPageFile2 : System.Web.UI.Page
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
            string employeeD = WorkingAppraisee.EmployeeID;
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string reportName = AppraisalPage.ReportName("ReportName", User.Identity.Name, category, area, code);
            labelMessage.Text = labelMessage.Text.Replace("{{ReportName}}", reportName);
            if (code == "ALP99")
            {
                if (category == "LTO" || category == "NTP")
                {
                    labelMessage.Text = "Selected teacher is not available on the Annual Learning Plan! ";
                }

            }


        }
    }

}

