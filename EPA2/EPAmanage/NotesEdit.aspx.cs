using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
namespace EPA2.EPAmanage
{
    public partial class NotesEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                hfApprYear.Value = Page.Request.QueryString["yID"];
                hfApprSchool.Value = Page.Request.QueryString["cID"];
                hfApprEmployeeID.Value = Page.Request.QueryString["tID"];
                string sId = Page.Request.QueryString["sID"];
                if (sId == "undefined")
                {
                    sId = "Appraisal0";
                }
                hfApprSession.Value = sId;
                hfApprName.Value = Page.Request.QueryString["tName"];
                SetPageAttribution();
                BindMyData();
            }
        }

        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "NotesEdit";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }

        protected void BindMyData()
        {
            OperationMyData("Get");
        }
        protected void MyText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save");
                hfContentChange.Value = "0";
            }
        }
        protected void OperationMyData(string action)
        {
            TextBox myBox = new TextBox();

            AppraisalData.NotesContent(ref myText, action, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, WorkingProfile.UserRole);
        }

        private void ShowMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
                //  *** AJAX Save Message  
                // ScriptManager.RegisterStartupScript(Me.Page, Me.Page.GetType, "save_script", strScript.ToString(), True)         }
            }
            catch { }

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {

        }
    }
}
