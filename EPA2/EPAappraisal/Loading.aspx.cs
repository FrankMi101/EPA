using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAappraisal
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
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string category = Page.Request.QueryString["type"];
                string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeID + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionID + "&type=" + category;
                WorkingAppraisee.AppraisalYear = schoolyear;
                WorkingAppraisee.EmployeeID = employeeID;
                WorkingAppraisee.SessionID = sessionID;
                WorkingProfile.PageCategory = category;
 
                switch (GoPage)
                {
                    case "Appraisal":
                        GoPage = "Appraisal00.aspx?" + parameter + "&ClientUserScreen=" + WorkingProfile.ClientUserScreen;
                        break;
                    case "LeftMenu":
                        GoPage = "Appraisal11.aspx?" + parameter;
                        break;   
                    case "Notes":
                        GoPage = "../EPAmanage/NotesEdit.aspx?" + parameter;
                        break;
                    case "Feedback":
                        GoPage = "../EPAmanage/Feedback.aspx?" + parameter;
                        break;
                    default:
                        GoPage = "Appraisal11_NotAppraiser.aspx";
                        break;
                }

                PageURL.HRef = GoPage;
            }
        }
   
    }
}