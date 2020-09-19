using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                string phase = Page.Request.QueryString["phase"];
                string task = Page.Request.QueryString["task"];
                string tName = Page.Request.QueryString["tName"];
                string ds = Page.Request.QueryString["IDs"];
                string parameter = "?yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + tName + "&IDs=" + ds + "&phase=" + phase;
                LabelAppraisalTitle.Text = GetTitle(task)  + " for " + tName;
              //  LabelEmployeeName.Text = tName;

                string goPage = GetGoPage(task) + parameter;  //"EditStaffProfile.aspx" + parameter;
          
             iFrameGoManage.Attributes.Add("src", goPage);

            }
        }
        private string GetGoPage(string goPage)
        {
            switch (goPage)
            {
                case "AppraisalProfile":
                    goPage = "EditAppraisalProfile.aspx";            //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                    break;
                case "NotesEdit":
                    goPage = "NotesEdit.aspx";  // "NotesEdit.aspx?" + parameter;
                    break;
                 case "ProfileEdit":
                    goPage = "EditStaffProfile.aspx";
                    break;
                case "Notification":
                    goPage = "Notification.aspx";
                    break;
                default:
                    goPage = "PDFPrint.aspx";
                    break;
            }
            return goPage;
        }
        private string GetTitle(string goPage)
        {
            switch (goPage)
            {
                case "AppraisalProfile":
                    return "Appraisal Profile Edit ";            //  GoPage = "EditAppraisalProfile.aspx?" + parameter;
                  case "NotesEdit":
                    return "Appraisal Notes ";  // "NotesEdit.aspx?" + parameter;
                   
                case "EditStaffProfile":
                    return "Employee Profile Edit ";
                case "ProfileEdit":
                   return "Staff Profile Edit";

                case "Notification":
                    return "Send Appraisal Notification";
                  
                default:
                    return "PDFPrint.aspx";
          
            }
     
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