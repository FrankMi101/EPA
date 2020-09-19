using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAmanage
{
    public partial class Loading2 : System.Web.UI.Page
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
                WorkingAppraisee.AppraisalYear = schoolyear;
                WorkingAppraisee.EmployeeID = employeeId;
                WorkingAppraisee.AppraisalCategory = GetCategorybyPhase(phase);
                WorkingAppraisee.AppraisalSchoolCode = schoolcode;
                WorkingAppraisee.AppraiserID = WorkingAppraisee.AppraiseeValue("AppraiserID");

                if (User.Identity.Name.ToLower() != WorkingAppraisee.AppraiserID.ToLower())
                {
                    string roleStr = "Admin,Principal";
                    if (roleStr.IndexOf(WorkingProfile.UserRoleLogin) < 0)
                    {
                        goPage = "NotAppraiser";
                    }

                }
                if (goPage == "NotAppraiser")
                {
                    goPage = "../EPAappraisal/Appraisal11_NotAppraiser.aspx";
                }
                else
                {
                    switch (goPage)
                    {
                        case "AppraisalProfile":
                            goPage = "Manage00.aspx?" + parameter + "&IDs=" + ds + "&task=AppraisalProfile"; // employeeID + "&yID=" + schoolyear + "&cID=" + schoolcode + "&IDs=" + IDs + "&tName=" + tName + "&task=AppraisalProfile";                                                                                             //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                            break;
                        case "Notes":
                            goPage = "Manage00.aspx?" + parameter + "&task=NotesEdit";  // "NotesEdit.aspx?" + parameter;
                            break;
                        case "Notification":
                            goPage = "Manage00.aspx?" + parameter + "&task=Notification";  // "NotesEdit.aspx?" + parameter;
                            break;
                        case "Feedback":
                            goPage = "Feedback.aspx?" + parameter + "&pageID=" + Page.Request.QueryString["pageID"]; ;
                            break;

                        case "EditStaffProfile":
                            goPage = "Manage00.aspx?" + parameter + "&task=ProfileEdit";
                            break;
                        case "ALP99":
                            WorkingAppraisee.AppraisalArea = "ALP";
                            WorkingAppraisee.AppraisalCode = "ALP99";
                            goPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;
                        case "SUM99":
                            WorkingAppraisee.AppraisalArea = "SUM";
                            WorkingAppraisee.AppraisalCode = "SUM99";
                            goPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;
                        case "STR99":
                            WorkingAppraisee.AppraisalArea = "STR";
                            WorkingAppraisee.AppraisalCode = "STR99";
                            goPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;

                        default:
                            goPage = "DefaultSummary.aspx";
                            break;
                    }
                }
                PageURL.HRef = goPage;
            }
        }
        private string GetCategorybyPhase(string phase)
        {
            switch (phase)
            {
                case "E": 
                case "NE1": 
                case "NE2":
                case "NE3":
                case "NE4":
                    return "TPA";
                default:
                    return phase;
            }
        }
    }
}