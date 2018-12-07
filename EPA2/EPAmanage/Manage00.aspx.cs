using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAmanage
{
    public partial class Manage00 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeid = Page.Request.QueryString["tID"];
                string sessionid = Page.Request.QueryString["sID"];
                string task = Page.Request.QueryString["task"];
                string tName = Page.Request.QueryString["tName"];
                string IDs = Page.Request.QueryString["IDs"];
                string parameter = "?yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + tName + "&IDs=" + IDs;
                LabelAppraisalTitle.Text = getTitle(task)  + " for " + tName;
              //  LabelEmployeeName.Text = tName;

                string goPage = getGoPage(task) + parameter;  //"EditStaffProfile.aspx" + parameter;
          
             iFrameGoManage.Attributes.Add("src", goPage);

            }
        }
        private string getGoPage(string GoPage)
        {
            switch (GoPage)
            {
                case "AppraisalProfile":
                    GoPage = "EditAppraisalProfile.aspx";            //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                    break;
                case "NotesEdit":
                    GoPage = "NotesEdit.aspx";  // "NotesEdit.aspx?" + parameter;
                    break;
                 case "ProfileEdit":
                    GoPage = "EditStaffProfile.aspx";
                    break;
                case "Notification":
                    GoPage = "Notification.aspx";
                    break;
                default:
                    GoPage = "PDFPrint.aspx";
                    break;
            }
            return GoPage;
        }
        private string getTitle(string GoPage)
        {
            switch (GoPage)
            {
                case "AppraisalProfile":
                    GoPage = "Appraisal Profile Edit ";            //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                    break;
                case "NotesEdit":
                    GoPage = "Appraisal Notes ";  // "NotesEdit.aspx?" + parameter;
                    break;
                case "EditStaffProfile":
                    GoPage = "Employee Profile Edit ";
                    break;
                case "Notification":
                    GoPage = "Send Appraisal Notification";
                    break;
                default:
                    GoPage = "PDFPrint.aspx";
                    break;
            }
            return GoPage;
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = Page.Request.QueryString["type"];
            hfPageID.Value = "Appraisal";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();    
            UserLastWorking.EmployeeID = Page.Request.QueryString["tID"];
        }

       
  
       
    }
}