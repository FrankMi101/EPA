using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2
{
    public partial class LoadingDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"].ToString();
                switch (GoPage)
                {
                    case "EPA":
                        PrintReportWithHTML("DashBoardEPA", "HTML");
                        break;
                    case "ALP":
                        PrintReportWithHTML("DashBoardALP", "HTML");
                        break;
                    case "Evaluation":
                         PrintReportWithHTML("DashBoardEvaluation", "HTML");
                        break;
                    default:
                      PrintReportWithHTML("DashBoardNotice", "HTML");
                        break;
                }
            }
        }


        private void PrintReportWithHTML(string reportName, string reportFormat)
        {
            string reportPath = WebConfig.ReportPath();
            string myUrl = WebConfig.ReportServer() + reportPath + reportName;


            myUrl = myUrl + "&Operate=" + "DashBoard";
            myUrl = myUrl + "&UserID=" + User.Identity.Name;
            myUrl = myUrl + "&SchoolYear=" + WorkingProfile.SchoolYear;
            myUrl = myUrl + "&SchoolCode=" + WorkingProfile.SchoolCode;

            myUrl = myUrl + ReportRender.reportFormat("HTML");
            Page.Response.Redirect(myUrl);

        }

        private string getDashBoard(string reportName, string reportFormat)
        {

            string reportPath = WebConfig.ReportPath();
            string myUrl = WebConfig.ReportServer() + reportPath + reportName;


            myUrl = myUrl + "&Operate=" + "DashBoard";
            myUrl = myUrl + "&UserID=" + User.Identity.Name;
            myUrl = myUrl + "&SchoolYear=" + WorkingProfile.SchoolYear;
            myUrl = myUrl + "&SchoolCode=" + WorkingProfile.SchoolCode;

            myUrl = myUrl + ReportRender.reportFormat("HTML");
           return myUrl;
        }
    }
}