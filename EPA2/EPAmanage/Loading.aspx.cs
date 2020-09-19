using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
namespace EPA2.EPAmanage
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeId = Page.Request.QueryString["tID"];
                string sessionId = Page.Request.QueryString["sID"];
                string ds = Page.Request.QueryString["IDs"];
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeId + "&sID=" + sessionId + "&tName=" + tName + "&phase=" + phase;


                switch (goPage)
                {
                    case "BoardStatements":
                       
                        goPage = "StatementsSetup.aspx?cID=Board";
                        break;
                    case "SchoolStatements":
                      
                        goPage = "StatementsSetup.aspx?cID=School";
                        break;
                    case "StaffRollOver":
                        goPage = "AppraisalStaffRollOver.aspx";
                        break;

                    case "AppraisalStaffList":
                        goPage = "AppraisalStaffList.aspx";
                        break;
                    case "ManageStaffList":
                        goPage = "ManageStaffList.aspx";
                        break;
                    case "EditStaffProfile":
                        goPage = "Manage00.aspx?" + parameter + "&task=ProfileEdit";
                        break;
                    case "ALPBatchPrint":
                        goPage = "AppraisalNoticeList.aspx?nType=ALPBatch";
                        break;
                    case "AppraisalNoticeListALP":
                        goPage = "AppraisalNoticeList.aspx?nType=ALP";
                        break;
                    case "AppraisalNoticeList":
                        goPage = "AppraisalNoticeList.aspx?nType=EPA";
                        break;
                    case "AppraisalNoticeListOBS":
                        goPage = "AppraisalNoticeList.aspx?nType=OBS";
                        break;
                    case "AppraisalHistory":
                        if (employeeId == null)
                        {
                            schoolyear = UserProfile.CurrentSchoolYear;
                            schoolcode = UserLastWorking.SchoolCode;
                            employeeId = UserLastWorking.EmployeeID;
                            tName = UserLastWorking.EmployeeName;

                            if (WorkingProfile.UserRole == "Principal")
                            {
                                schoolcode = WorkingProfile.SchoolCode;
                                employeeId = WorkingProfile.UserEmployeeId;
                                tName = WorkingProfile.UserName;
                            }

                            parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeId + "&tName=" + tName + "&phase=" + phase;

                        }
                        goPage = "AppraisalStaffHistory.aspx?" + parameter;
                        break;
                    default:
                        goPage = "DefaultSummary.aspx";
                        break;
                }

                PageURL.HRef = goPage;
            }
        }
    }
}