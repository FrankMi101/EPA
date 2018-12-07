using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class EditAppraisalProfile : System.Web.UI.Page
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

            mySchoolList.SetLists2(ddlSchoolName, ddlSchoolCode, "SchoolList", User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            mySchoolList.SetLists2(ddlSchoolNameSAP, ddlSchoolCodeSAP, "SchoolList", User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlAppraiser, "SchoolAppraiser", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlMentor, "SchoolMentor", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlApprRole, "UserRole", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlApprCycle, "AppraisalPhase", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlApprStatus, "AppraisalStatus", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlApprType, "AppraisalType", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlEvidenceLevel, "EvidenceLevel", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            myList.SetLists(ddlTimeType, "TimeType", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);

            if (WorkingProfile.UserRole == "Principal" || WorkingProfile.UserRole == "Admin")
            {    ddlAppraiser.Enabled = true;
            }       
                

            hfCategory.Value = "EPA";
            hfPageID.Value = "NotesEdit";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void bindStaffInformation()
        {
            DataSet DS = new DataSet();
            DS = StaffProfile.AppraisalStaffEdit("Get", IDs, User.Identity.Name, schoolyear, employeeID);
            try
            {
                //  IDs,UserID, Employee_ID, Appraisal_year,Unit_ID, Appraisal_Status, Appraisal_type, Appraisal_Cycle,Appraisal_Role, EvidenceLevel,TimeType,Appraiser,Mentor,Assignment,Comments
                hfIDs.Value = DS.Tables[0].Rows[0][0].ToString();
                TextUserID.Text = DS.Tables[0].Rows[0][1].ToString();
                TextEmployeeID.Text = DS.Tables[0].Rows[0][2].ToString();
                mySchoolList.SetListsValue(ddlSchoolName, ddlSchoolCode, DS.Tables[0].Rows[0][4].ToString());
                mySchoolList.SetListsValue(ddlSchoolNameSAP, ddlSchoolCodeSAP, DS.Tables[0].Rows[0][4].ToString());
                myList.SetListValue(ddlApprStatus, DS.Tables[0].Rows[0][5].ToString());
                myList.SetListValue(ddlApprType, DS.Tables[0].Rows[0][6].ToString());
                myList.SetListValue(ddlApprCycle, DS.Tables[0].Rows[0][7].ToString());
                myList.SetListValue(ddlApprRole, DS.Tables[0].Rows[0][8].ToString());
                myList.SetListValue(ddlEvidenceLevel, DS.Tables[0].Rows[0][9].ToString());
                myList.SetListValue(ddlTimeType, DS.Tables[0].Rows[0][10].ToString());
                myList.SetListValue(ddlAppraiser, DS.Tables[0].Rows[0][11].ToString());
                myList.SetListValue(ddlMentor, DS.Tables[0].Rows[0][12].ToString());
                TextAssignment.Text = DS.Tables[0].Rows[0][13].ToString();
                TextComments.Text = DS.Tables[0].Rows[0][14].ToString();

            }
            catch (Exception  ex) {
                string eMessage = ex.Message;
            }
            finally { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string unitID = ddlSchoolCode.SelectedValue;
            string apprStatus = ddlApprStatus.SelectedValue;
            string apprType =  ddlApprType.SelectedValue;
            string apprRole = ddlApprRole.SelectedValue;
            string apprCycles = ddlApprCycle.SelectedValue;
            string evidence = ddlEvidenceLevel.SelectedValue;
            string timeType = ddlTimeType.SelectedValue;
            string appraiser = ddlAppraiser.SelectedValue;
            string mentor = ddlMentor.SelectedValue;
            string assignment = TextAssignment.Text;
            string comment = TextComments.Text;
            string userID = TextUserID.Text;
            string employeeId = TextEmployeeID.Text;
            string ids = hfIDs.Value;
            string saveResult = StaffProfile.AppraisalStaffEdit("Update", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID,
                apprStatus,apprType,apprCycles,apprRole,evidence,appraiser, mentor,timeType,assignment,comment);

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

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            string unitID = ddlSchoolCode.SelectedValue;         
            string userID = TextUserID.Text;
            string employeeId = TextEmployeeID.Text;
            string ids = hfIDs.Value;
            string saveResult = StaffProfile.AppraisalStaffEdit("Delete", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID);

            showMessage(saveResult, "Update");
        }
    }
}