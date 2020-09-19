

using ClassLibrary;
using System;
using System.Runtime.Remoting.Messaging;
using System.Web.UI;

namespace EPA2.EPAmanage
{
    public partial class EditAppraisalProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //_schoolyear = Page.Request.QueryString["yID"];
                //_schoolcode = Page.Request.QueryString["cID"];
                //_employeeId = Page.Request.QueryString["tID"];
                //_tName = Page.Request.QueryString["tName"];
                //_iDs = Page.Request.QueryString["IDs"];

                // LabelName.Text = Page.Request.QueryString["tName"];
                SetPageAttribution();
                BindStaffInformation();
                SetProgrammingSP();
            }
        }

        private void SetPageAttribution()
        {
            var parameter = new CommonListParameter() { Operate = "SchoolList", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = WorkingProfile.SchoolYear, Para3 = WorkingProfile.SchoolCode };

            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchoolName, "SchoolList", parameter); // User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            AppraisalPage.BuildingList(ddlSchoolCodeSAP, ddlSchoolNameSAP, "SchoolList", parameter);// User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            AppraisalPage.BuildingList(ddlAppraiser, "SchoolAppraiser", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, WorkingProfile.WorkingOnAppr);
            AppraisalPage.BuildingList(ddlMentor, "SchoolMentor", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlApprRole, "UserRole", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlApprCycle, "AppraisalPhase", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlApprStatus, "AppraisalStatus", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlApprType, "AppraisalType", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlEvidenceLevel, "EvidenceLevel", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");
            AppraisalPage.BuildingList(ddlTimeType, "TimeType", User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "");

            if (WorkingProfile.UserRole == "Principal" || WorkingProfile.UserRole == "Admin")
            {
                ddlAppraiser.Enabled = true;
            }


            hfCategory.Value = "EPA";
            hfPageID.Value = "NotesEdit";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void BindStaffInformation()
        {
            Appraisee appraisee = GetEditappraisee();

            try
            {
                //  IDs,UserID, Employee_ID, Appraisal_year,Unit_ID, Appraisal_Status, Appraisal_type, Appraisal_Cycle,Appraisal_Role, EvidenceLevel,TimeType,Appraiser,Mentor,Assignment,Comments
                hfIDs.Value = appraisee.IDs.ToString();
                TextUserID.Text = appraisee.UserID;
                TextEmployeeID.Text = appraisee.EmployeeID.ToString();
                AppraisalPage.SetListValue(ddlSchoolName, appraisee.SchoolCode);
                AppraisalPage.SetListValue(ddlSchoolCode, appraisee.SchoolCode);
                AppraisalPage.SetListValue(ddlSchoolNameSAP, appraisee.SchoolCode);
                AppraisalPage.SetListValue(ddlSchoolCodeSAP, appraisee.SchoolCode);
                AppraisalPage.SetListValue(ddlApprStatus, appraisee.AppraisalStatus);
                AppraisalPage.SetListValue(ddlApprType, appraisee.AppraisalType);
                AppraisalPage.SetListValue(ddlApprCycle, appraisee.AppraisalCycle);
                AppraisalPage.SetListValue(ddlApprRole, appraisee.AppraisalRole);
                AppraisalPage.SetListValue(ddlEvidenceLevel, appraisee.EvidenceLevel);
                AppraisalPage.SetListValue(ddlTimeType, appraisee.TimeType);
                AppraisalPage.SetListValue(ddlAppraiser, appraisee.Appraiser);
                AppraisalPage.SetListValue(ddlMentor, appraisee.Mentor);
                TextAssignment.Text = appraisee.Assignment;
                TextComments.Text = appraisee.Comments;
                DateStart.Value = appraisee.StartDate;//  BLL.DateFC.YMD(appraisee.StartDate);
                DateEnd.Value = appraisee.EndDate;// BLL.DateFC.YMD(appraisee.EndDate);

                if (appraisee.AppraisalRole == "Principal" || appraisee.AppraisalRole == "VP")
                {
                    btnCopy.Text = "Working for Multiple School";
                    btnCopy.ToolTip = "Change the acting principal working school and click on the button.";
                    LabelForAppraiser.Visible = true;
                }
                else
                {
                    btnCopy.Text = "Copy to New Phase or School";
                    btnCopy.ToolTip = "Change the appraisee's school or Appraisal phase and click on the button";
                    LabelForAppraisee.Visible = true;
                }


            }
            catch (Exception ex)
            {
                string eMessage = ex.Message;
            }
            finally { }
        }
        private Appraisee GetEditappraisee()
        {
            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                IDs = Page.Request.QueryString["IDs"],
                EmployeeID = Page.Request.QueryString["tID"],
                SchoolYear = Page.Request.QueryString["yID"],
                SchoolCode = Page.Request.QueryString["cID"],
                Phase = Page.Request.QueryString["phase"]
            };

            return StaffManagement.Appraisee(parameter)[0];
        }
        protected void BtnRemove_Click(object sender, EventArgs e)
        {
            var parameter = new
            {
                Operate = "Delete",
                UserID = User.Identity.Name,
                IDs = Page.Request.QueryString["IDs"],
                EmployeeID = Page.Request.QueryString["tID"],
                SchoollYear = Page.Request.QueryString["yID"],
                SchoolCode = Page.Request.QueryString["cID"]
            };

            string saveResult = StaffManagement.AppraiseeRemove(parameter); // StaffProfile.AppraisalStaffEdit("Delete", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID);

            ShowMessage(saveResult, "Delete");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            var _appraisee = getAppraiseeInfoFromPage("Update");

            string saveResult = StaffManagement.AppraiseeEdit(_appraisee);

            ShowMessage(saveResult, "Update");
        }
        protected void BtnCopy_Click(object sender, EventArgs e)
        {

            var _appraisee = getAppraiseeInfoFromPage("CopyToNew");

            string saveResult = StaffManagement.AppraiseeEdit(_appraisee);

            // StaffProfile.AppraisalStaffEdit("Update", ids, userID, WorkingProfile.SchoolYear, employeeId, unitID,   apprStatus,apprType,apprCycles,apprRole,evidence,appraiser, mentor,timeType,assignment,comment);

            ShowMessage(saveResult, "CopyToNew");
        }
        private Appraisee getAppraiseeInfoFromPage(string action)
        {
            var ids = (action == "Update") ? Page.Request.QueryString["IDs"] : "0";

            var appraiseeInfo = new Appraisee()
            {
                Operate = action, // "Update",
                IDs = ids,
                SchoolYear = Page.Request.QueryString["yID"],
                SchoolCode = ddlSchoolCode.SelectedValue,
                AppraisalStatus = ddlApprStatus.SelectedValue,
                AppraisalType = ddlApprType.SelectedValue,
                AppraisalRole = ddlApprRole.SelectedValue,
                AppraisalCycle = ddlApprCycle.SelectedValue,
                EvidenceLevel = ddlEvidenceLevel.SelectedValue,
                TimeType = ddlTimeType.SelectedValue,
                Appraiser = ddlAppraiser.SelectedValue,
                Mentor = ddlMentor.SelectedValue,
                Assignment = TextAssignment.Text,
                Comments = TextComments.Text,
                UserID = TextUserID.Text,
                EmployeeID = TextEmployeeID.Text,
                StartDate = DateStart.Value, //  BLL.DateFC.YMD(DateStart.Value),
                EndDate = DateEnd.Value //BLL.DateFC.YMD(DateEnd.Value),

            };

            return appraiseeInfo;
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

        private void SetProgrammingSP()
        {
            BaseData.ShowSP("AppraisalManage", "Appraisee", TextUserID);
            BaseData.ShowSP("AppraisalManage", "AppraiseeEdit", btnSave);
            BaseData.ShowSP("AppraisalManage", "AppraiseeEdit", btnCopy);
            BaseData.ShowSP("AppraisalManage", "AppraiseeDelete", btnRemove);

        }

    }
}