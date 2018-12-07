using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
namespace EPA2.EPAmanage
{
    public partial class EditStaffProfile : System.Web.UI.Page
    {
        string schoolyear;
        string schoolcode;
        string employeeID;
        string tName;
        string IDs;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                schoolyear = Page.Request.QueryString["yID"];
                schoolcode = Page.Request.QueryString["cID"];
                employeeID = Page.Request.QueryString["tID"];
                tName = Page.Request.QueryString["tName"];
                IDs = Page.Request.QueryString["IDs"];

                // LabelName.Text = Page.Request.QueryString["tName"];
                setPageAttribution();
                bindStaffInformation();
            }
        }

        private void setPageAttribution()
        {

            mySchoolList.SetLists2(ddlSchoolNameSAP, ddlSchoolCodeSAP, "SchoolList", User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlStatus, "AppraisalStatus", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlPostionType, "UserRole", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlTimeType, "TimeType", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlGender, "Gender", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);


            hfCategory.Value = "EPA";
            hfPageID.Value = "NotesEdit";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void bindStaffInformation()
        {
            DataSet DS = new DataSet();
            DS = StaffProfile.EmployeeStaffEdit("Get", IDs, User.Identity.Name, schoolyear, employeeID);
            try
            {
                 hfIDs.Value = DS.Tables[0].Rows[0][0].ToString();
                TextUserID.Text = DS.Tables[0].Rows[0][1].ToString();
                TextEmployeeID.Text = DS.Tables[0].Rows[0][2].ToString();
                TextFirstName.Text = DS.Tables[0].Rows[0][3].ToString();
                TextLastName.Text = DS.Tables[0].Rows[0][4].ToString();
                TextEmail.Text = DS.Tables[0].Rows[0][5].ToString();
                myList.SetListValue(ddlStatus, DS.Tables[0].Rows[0][6].ToString());
                myList.SetListValue(ddlGender, DS.Tables[0].Rows[0][7].ToString());
                TextPosition.Text = DS.Tables[0].Rows[0][8].ToString();
                myList.SetListValue(ddlPostionType, DS.Tables[0].Rows[0][9].ToString());
                myList.SetListValue(ddlTimeType, DS.Tables[0].Rows[0][10].ToString());
                dateStart.Value = DS.Tables[0].Rows[0][11].ToString();
                dateEnd.Value = DS.Tables[0].Rows[0][12].ToString();
                TextAssignment.Text = DS.Tables[0].Rows[0][13].ToString();
                TextComments.Text = DS.Tables[0].Rows[0][14].ToString();
                mySchoolList.SetListsValue(ddlSchoolNameSAP, ddlSchoolCodeSAP, DS.Tables[0].Rows[0][15].ToString());
                if (DS.Tables[0].Rows[0][16].ToString().Length > 2)
                {
                    chbAppraisal.Checked = true;
                    btnAddTo.Enabled = false;
                    btnAddTo.CssClass = btnAddTo.CssClass.Replace("saveButton", "");

                }
                else
                {
                    chbAppraisal.Checked = false;
                    btnAddTo.Enabled = true;
                }
             }
            catch (Exception ex)
            {
                string eMessage = ex.Message;
            }
            finally { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string unitID = ddlSchoolCodeSAP.SelectedValue;
            string status = ddlStatus.SelectedValue;
            string position = TextPosition.Text;
            string positionType = ddlPostionType.SelectedValue;
            string gender = ddlGender.SelectedValue;
            string timeType = ddlTimeType.SelectedValue;
            string firstName = TextFirstName.Text;
            string lastName = TextLastName.Text;
            string eMail = TextEmail.Text;
            string startDate =   dateStart.Value ;
            string endDate =  dateEnd.Value ;
            string assignment = TextAssignment.Text;
            string comment = TextComments.Text;
            string userID = TextUserID.Text;
            string employeeId = TextEmployeeID.Text;
            string ids = hfIDs.Value;
            string saveResult = StaffProfile.EmployeeStaffEdit("Update", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID,
                firstName, lastName, status, position, positionType,  startDate, endDate, gender, eMail,timeType, assignment, comment);

            showMessage(saveResult, "Update");
        }
        private void showMessage(string result, string action)
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

        protected void btnAddTo_Click(object sender, EventArgs e)
        {
            string unitID = ddlSchoolCodeSAP.SelectedValue;       
            string userID = TextUserID.Text;
            string employeeId = TextEmployeeID.Text;
            string ids = hfIDs.Value;
            string saveResult = StaffProfile.EmployeeStaffEdit("AddToApprList", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID );

            showMessage(saveResult, "Add to Appr List");
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {

            hfIDs.Value = "0";
            TextUserID.Text = "";
            TextEmployeeID.Text = "";
            TextFirstName.Text ="";
            TextLastName.Text ="";
            TextEmail.Text = "";
             TextPosition.Text = "";
            ddlStatus.ClearSelection();
            ddlGender.ClearSelection();
            ddlPostionType.ClearSelection();
            ddlTimeType.ClearSelection();
            dateStart.Value ="";
            dateEnd.Value = "";
            TextAssignment.Text = "";
            TextComments.Text = "";
            ddlSchoolNameSAP.ClearSelection();
            ddlSchoolCodeSAP.ClearSelection();
            mySchoolList.SetListsValue(ddlSchoolNameSAP, ddlSchoolCodeSAP, WorkingProfile.SchoolCode);
            chbAppraisal.Checked = false;
         
        }
    }
}