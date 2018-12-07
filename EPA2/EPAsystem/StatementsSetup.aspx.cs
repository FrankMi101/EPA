using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.IO;
using System.Net.Mail;
using System.Globalization;
using System.Text;
//using System.IO;
//using System.Text;
namespace EPA2.EPAmanage
{
    public partial class StatementsSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
                setPageAttribution();
                GetLastStatement();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Statement";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            string statementType = Page.Request.QueryString["cID"];
            myList.SetLists(ddlArea, "StatementArea", User.Identity.Name);
            myList.SetListValue(ddlArea, statementType);
            string schoolcode = WorkingProfile.SchoolCode;
            if (statementType == "Board")
            {
                schoolcode = "0000";
            }
            myList.SetLists(ddlNo, "StatementNumber", User.Identity.Name,WorkingProfile.SchoolYear, statementType, schoolcode);
            myList.SetListValue(ddlNo, 0);
        }
        private void GetLastStatement()
        {           
            
            OperationMyContent("Get");
            hfContentChange.Value = "0";

        }

        protected void ddlNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyContent("Get");
        }
        protected void OperationMyContent(string action)
        {
            string schoolyear = WorkingProfile.SchoolYear;
            string schoolcode = WorkingProfile.SchoolCode;
            string statementType = Page.Request.QueryString["cID"];
            if (statementType == "Board")
            {
               schoolcode = "0000";
            }
            string area = ddlArea.SelectedValue;
            string IDs = ddlNo.SelectedValue;
            ApplicationSetup.Statements(ref myText, ref TextSubject, ref StartDate, ref EndDate, schoolyear,schoolcode,statementType, area, action, User.Identity.Name, IDs);
        }
        private void showMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
            }
            catch { }

        }
 
        public static string toUniversalTime(DateTime dt)
        {
            string DateFormat = "yyyyMMddTHHmmssZ";

            return dt.ToUniversalTime().ToString(DateFormat);
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
  
            OperationMyContent("New");
           string statementType = Page.Request.QueryString["cID"];
            string schoolcode = WorkingProfile.SchoolCode;
            if (statementType == "Board")
            {
                schoolcode = "0000";
            }
            myList.SetLists(ddlNo, "StatementNumber", User.Identity.Name, WorkingProfile.SchoolYear, statementType, schoolcode);
            myList.SetListValue(ddlNo, 0);
            OperationMyContent("Get");
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            OperationMyContent("Save");
        }
    }
}