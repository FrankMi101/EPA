using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"];
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeID = Page.Request.QueryString["tID"];
                string sessionID = Page.Request.QueryString["sID"];
                string IDs = Page.Request.QueryString["IDs"];
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeID + "&sID=" + sessionID + "&tName=" + tName + "&phase=" + phase;


                switch (GoPage)
                {

                    case "AppraisalStaffList":
                        GoPage = "AppraisalStaffList.aspx";
                        break;
                    case "ManageStaffList":
                        GoPage = "ManageStaffList.aspx";
                        break;
                    case "EditStaffProfile":
                        GoPage = "Manage00.aspx?" + parameter + "&task=ProfileEdit";
                        break;
                    case "ALPBatchPrint":
                        GoPage = "AppraisalNoticeList.aspx?nType=ALPBatch";
                        break;
                    case "AppraisalNoticeListALP":
                        GoPage = "AppraisalNoticeList.aspx?nType=ALP";
                        break;
                    case "AppraisalNoticeList":
                        GoPage = "AppraisalNoticeList.aspx?nType=EPA";
                        break;
                    case "AppraisalNoticeListOBS":
                        GoPage = "AppraisalNoticeList.aspx?nType=OBS";
                        break;
                    case "AppraisalHistory":
                        if (employeeID == null)
                        {
                            schoolyear = UserProfile.CurrentSchoolYear;
                            schoolcode = UserLastWorking.SchoolCode;
                            employeeID = UserLastWorking.EmployeeID;
                            tName = UserLastWorking.EmployeeName;

                            if (WorkingProfile.UserRole == "Principal")
                            {
                                schoolcode = WorkingProfile.SchoolCode;
                                employeeID = WorkingProfile.UserEmployeeID;
                                tName = WorkingProfile.UserName;
                            }

                            parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeID + "&tName=" + tName + "&phase=" + phase;

                        }
                        GoPage = "AppraisalStaffHistory.aspx?" + parameter;
                        break;
                    default:
                        GoPage = "DefaultSummary.aspx";
                        break;
                }

                PageURL.HRef = GoPage;
            }
        }
    }
}