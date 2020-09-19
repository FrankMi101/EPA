using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
namespace EPA2.EPAappraisal
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];
                //string schoolyear = Page.Request.QueryString["yID"];
                //string schoolcode = Page.Request.QueryString["cID"];
                //string employeeId = Page.Request.QueryString["tID"];
                //string sessionId = Page.Request.QueryString["sID"];
                //string tName = Page.Request.QueryString["tName"];
                //string phase = Page.Request.QueryString["phase"];
                //string category = Page.Request.QueryString["type"];
                var queryValue = AppraisalPage.GetQueryValue(Page);
                string parameter = AppraisalPage.GetQueryString(queryValue);//  "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeId + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionId + "&type=" + category;
                WorkingAppraisee.AppraisalYear = queryValue.SchoolYear;// schoolyear;
                WorkingAppraisee.EmployeeID = queryValue.EmployeeID;// employeeId;
                WorkingAppraisee.SessionID = queryValue.SessionID;//  sessionId;
                WorkingProfile.PageCategory = queryValue.Category;// category;
 
                switch (goPage)
                {
                    case "Appraisal":
                        goPage = "Appraisal00.aspx?" + parameter + "&ClientUserScreen=" + WorkingProfile.ClientUserScreen;
                        break;
                    case "LeftMenu":
                        goPage = "Appraisal11.aspx?" + parameter;
                        break;   
                    case "Notes":
                        goPage = "../EPAmanage/NotesEdit.aspx?" + parameter;
                        break;
                    case "Feedback":
                        goPage = "../EPAmanage/Feedback.aspx?" + parameter;
                        break;
                    default:
                        goPage = "Appraisal11_NotAppraiser.aspx?";
                        break;
                }

                PageURL.HRef = goPage ;
            }
        }
   
    }
}