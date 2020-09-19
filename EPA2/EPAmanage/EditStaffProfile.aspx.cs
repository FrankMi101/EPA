using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using ClassLibrary;

namespace EPA2.EPAmanage
{

    public partial class EditStaffProfile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // LabelName.Text = Page.Request.QueryString["tName"];
                SetPageAttribution();
                BindStaffInformation();
                SetProgrammingSP();
            }
        }

        private void SetPageAttribution()
        {
            var parameter = new CommonListParameter
            {
                Operate = "SchoolList",
                UserID = User.Identity.Name,
                Para1 = WorkingProfile.UserRole,
                Para2 = Page.Request.QueryString["yID"],
                Para3 = Page.Request.QueryString["cID"]
            };
            AppraisalPage.BuildingList(ddlSchoolCodeSAP, ddlSchoolNameSAP, "SchoolList", parameter, WorkingProfile.SchoolCode); // User.Identity.Name, WorkingProfile.UserRole, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);

            parameter.Para1 = WorkingProfile.SchoolYear;
            parameter.Para2 = WorkingProfile.SchoolCode;
            AppraisalPage.BuildingList(ddlStatus, "AppraisalStatus", parameter);// User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            AppraisalPage.BuildingList(ddlPostionType, "UserRole", parameter);// User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            AppraisalPage.BuildingList(ddlTimeType, "TimeType", parameter);// User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);
            AppraisalPage.BuildingList(ddlGender, "Gender", parameter);//User.Identity.Name, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode);


            hfCategory.Value = "EPA";
            hfPageID.Value = "NotesEdit";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }

        private Employee GetEditDataSource()
        {
            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                IDs = Page.Request.QueryString["IDs"],
                EmployeeID = Page.Request.QueryString["tID"]
            };

            return StaffManagement.Employee(parameter)[0];
        }

        private void BindStaffInformation()
        {
            var employee = GetEditDataSource();

            try
            {
                hfIDs.Value = employee.IDs;
                TextUserID.Text = employee.UserID;
                TextEmployeeID.Text = employee.EmployeeID.ToString();
                TextFirstName.Text = employee.FirstName.ToString();
                TextLastName.Text = employee.LastName.ToString();
                TextEmail.Text = employee.Email.ToString();
                AppraisalPage.SetListValue(ddlStatus, employee.EmployeeStatus.ToString());
                AppraisalPage.SetListValue(ddlGender, employee.Gender.ToString());
                TextPosition.Text = employee.EmployeePosition.ToString();
                AppraisalPage.SetListValue(ddlPostionType, employee.PositionType.ToString());
                AppraisalPage.SetListValue(ddlTimeType, employee.TimeType.ToString());
                dateStart.Value = employee.StartDate.ToString();
                dateEnd.Value = employee.EndDate.ToString();
                TextAssignment.Text = employee.Assignment.ToString();
                TextComments.Text = employee.Comments.ToString();
                AppraisalPage.SetListValue(ddlSchoolNameSAP, employee.UnitID);
                AppraisalPage.SetListValue(ddlSchoolCodeSAP, employee.UnitID);
                if (employee.IsInAppraisalList.ToString().Length > 2)
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

        private Employee getEmployeeInfoFromPage(string action)
        {
            var ids = (action == "Update") ? hfIDs.Value : "0";

            var appraiseeInfo = new Employee()
            {
                Operate = action, // "Update",
                IDs = ids,
                UnitID = ddlSchoolCodeSAP.SelectedValue,
                EmployeeID = TextEmployeeID.Text,
                EmployeeStatus = ddlStatus.SelectedValue,
                EmployeePosition = TextPosition.Text,
                PositionType = ddlPostionType.SelectedValue,
                Gender = ddlGender.SelectedValue,
                TimeType = ddlTimeType.SelectedValue,
                FirstName = TextFirstName.Text,
                LastName = TextLastName.Text,
                Assignment = TextAssignment.Text,
                Comments = TextComments.Text,
                UserID = TextUserID.Text,
                StartDate = dateStart.Value, //BLL.DateFC.YMD(dateStart.Value),
                EndDate = dateEnd.Value //  BLL.DateFC.YMD(dateEnd.Value),
            };

            return appraiseeInfo;
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            var _employee = getEmployeeInfoFromPage("Update");
             string saveResult = StaffManagement.EmployeeEdit(_employee);

            ShowMessage(saveResult, "Update");
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

        protected void BtnAddTo_Click(object sender, EventArgs e)
        {
            var parameter = new
            {
                Operate = "AddToApprList",
                UserID = TextUserID.Text,
                IDs = hfIDs.Value,
                EmployeeID = TextEmployeeID.Text
            };
  
            string saveResult = StaffManagement.EmployeeAddToApprList(parameter);// DataAccess.StaffProfile.EmployeeStaffEdit("AddToApprList", ids, userId, WorkingProfile.SchoolYear, employeeId, unitId);

            ShowMessage(saveResult, "Add to Appr List");
        }

        protected void BtnNew_Click(object sender, EventArgs e)
        {
            hfIDs.Value = "0";
            TextUserID.Text = "";
            TextEmployeeID.Text = "";
            TextFirstName.Text = "";
            TextLastName.Text = "";
            TextEmail.Text = "";
            TextPosition.Text = "";
            ddlStatus.ClearSelection();
            ddlGender.ClearSelection();
            ddlPostionType.ClearSelection();
            ddlTimeType.ClearSelection();
            dateStart.Value = "";
            dateEnd.Value = "";
            TextAssignment.Text = "";
            TextComments.Text = "";
            ddlSchoolNameSAP.ClearSelection();
            ddlSchoolCodeSAP.ClearSelection();
            //  mySchoolList.SetListsValue(ddlSchoolNameSAP, ddlSchoolCodeSAP, WorkingProfile.SchoolCode);
            AppraisalPage.SetListValue(ddlSchoolNameSAP, WorkingProfile.SchoolCode);
            AppraisalPage.SetListValue(ddlSchoolCodeSAP, WorkingProfile.SchoolCode);
            chbAppraisal.Checked = false;
        }
        private void SetProgrammingSP()
        {
            BaseData.ShowSP("AppraisalManage", "Employee", TextUserID);
            BaseData.ShowSP("AppraisalManage", "AddToApprList", btnAddTo);
            BaseData.ShowSP("AppraisalManage", "EmployeeEdit", btnSave);

        }
    }
}