using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class Loading2 : System.Web.UI.Page
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
                WorkingAppraisee.AppraisalYear = schoolyear;
                WorkingAppraisee.EmployeeID = employeeID;

                if (User.Identity.Name.ToLower() != WorkingAppraisee.AppraiserID.ToLower())
                {   string roleSTR = "Admin,Principal";
                    if (roleSTR.IndexOf(WorkingProfile.UserRoleLogin) < 0)
                     {
                        GoPage = "NotAppraiser";
                    }

                }
                if (GoPage == "NotAppraiser")
                {
                    GoPage = "../EPAappraisal/Appraisal11_NotAppraiser.aspx";
                }
                else
                {
                    switch (GoPage)
                    {
                        case "AppraisalProfile":
                            GoPage = "Manage00.aspx?" + parameter + "&task=AppraisalProfile"; // employeeID + "&yID=" + schoolyear + "&cID=" + schoolcode + "&IDs=" + IDs + "&tName=" + tName + "&task=AppraisalProfile";                                                                                             //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                            break;
                        case "Notes":
                            GoPage = "Manage00.aspx?" + parameter + "&task=NotesEdit";  // "NotesEdit.aspx?" + parameter;
                            break;
                        case "Notification":
                            GoPage = "Manage00.aspx?" + parameter + "&task=Notification";  // "NotesEdit.aspx?" + parameter;
                            break;
                        case "Feedback":
                            GoPage = "Feedback.aspx?" + parameter + "&pageID=" + Page.Request.QueryString["pageID"]; ;
                            break;
                     
                        case "EditStaffProfile":
                            GoPage = "Manage00.aspx?" + parameter + "&task=ProfileEdit";
                            break;
                         case "ALP99":
                            WorkingAppraisee.AppraisalArea = "ALP";
                            WorkingAppraisee.AppraisalCode = "ALP99";
                            GoPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;
                        case "SUM99":
                             WorkingAppraisee.AppraisalArea = "SUM";
                            WorkingAppraisee.AppraisalCode = "SUM99";
                            GoPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;
                        case "STR99":
                            WorkingAppraisee.AppraisalArea = "STR";
                            WorkingAppraisee.AppraisalCode = "STR99";
                            GoPage = "../EPAappraisal/PDFPageFromList.aspx";
                            break;

                        default:
                            GoPage = "DefaultSummary.aspx";
                            break;
                    }
                }
                PageURL.HRef = GoPage;
            }
        }
    }
}