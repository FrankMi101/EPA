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
    public partial class PDFPageFile2 : System.Web.UI.Page
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
            string reportName = AppraisalDataAC.ReportName("Name", User.Identity.Name,category,area, code);
            labelMessage.Text =   labelMessage.Text.Replace("{{ReportName}}", reportName);
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
 
