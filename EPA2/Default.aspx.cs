using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

namespace EPA2
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                WorkingProfile.WorkingOnAppr = "TPA";
                SaveUserWorkingEnvironment();
                string deviceScreen = WorkingProfile.ClientUserScreen;
                int xInt = deviceScreen.IndexOf("x");
                string devicewidth = deviceScreen.Substring(0, xInt);

                int dWidth = int.Parse(devicewidth);
                //if (dWidth < 800)
                //{
                //    Page.Response.Redirect("Mobile/DefaultM.aspx");
                //}
                //else
                //{
                //    DefaultLoad();
                //}
                CheckAppEntry();
                DefaultLoad();
            }
        }
        private void DefaultLoad()
        {

            WorkingProfile.PageCategory = "Summary";
            WorkingProfile.PageArea = "General";
            WorkingProfile.PageItem = "EPA00";
            hfPageID.Value = "Default";
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfUserID.Value = User.Identity.Name;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfApprYear.Value = WorkingProfile.SchoolYear;
            hfApprSchool.Value = WorkingProfile.SchoolCode;
            hfApprEmployeeID.Value = WorkingProfile.UserEmployeeId;
            hfTeacherName.Value = WorkingProfile.UserName;
            hfWorkingOn.Value = WorkingProfile.WorkingOnAppr;

            if (DBConnection.CurrentDB != "Live")
            {
                LabelTrain.Text = DBConnection.CurrentDB;
                LabelTrain.Visible = true;
            }
            //if (User.Identity.AuthenticationType == "Forms")
            //{
            //    WorkingProfile.UserRoleLogin = UserProfile.Role(User.Identity.Name);
            //}
            //else
            //{
            //    WorkingProfile.UserRoleLogin = UserProfile.Role(User.Identity.Name); 
            //}



            AppraisalPage.BuildingListControl(rblLoginAS, "UserRole", User.Identity.Name);
            AppraisalPage.BuildingListControlInitial(rblLoginAS, WorkingProfile.UserRole);

            LoginUserRole.InnerText = UserProfile.LoginUserName + " as " + rblLoginAS.SelectedItem.Text;

            hfCurrentUserRole.Value = WorkingProfile.UserRole;

            GetUserLastWorkingValue();

            string pId = Page.Request.QueryString["pID"];
            if (WorkingProfile.UserRole == "Teacher")
            {
                pId = "EPAmanage/Loading.aspx?pID=AppraisalHistory";
                LinkBtnWorkingOn.Visible = false;
            }
            else
            {
                LinkBtnWorkingOn.Visible = true;
                if (WorkingProfile.UserRole == "VP" && WorkingProfile.WorkingOnAppr == "PPA")
                {
                    pId = "EPAmanage/Loading.aspx?pID=AppraisalHistory";
                }
                else
                {
                    if (pId == "Summary")
                    { pId = "Loading.aspx?pID=Summary"; }
                    else
                    {
                        if (Session["HomePage"] != null)
                        {
                            pId = Session["HomePage"].ToString();
                        }
                        else
                        {
                            pId = "Loading.aspx?pID=Summary";
                        }
                    }
                }
            }
            GoList.Attributes.Add("src", pId);
        }
        private void CheckAppEntry()
        {
            //  string qs = "DlbxH6ZHFjSjvM6zCdOpdaT41lUfslUT4fJ5IurW8P+OjWJ2pHYhp6YhaxgaXngZlmwQLz2OqcfUleeO0Mhn9niEsgFaO1dFeSpIxNgTL4/J/IdkLqsMgrWOr1rhpvyYa/eO879gSKP0Yc+po/6MSJfheXgSM4rYZYegjX/GRiR+MPY/+8CepRbpaxTv4G8Z";
            string queryString = Page.Request.QueryString["appPara"]; //qs;//
            if (queryString != null)
            {
                string decrypedPara = GetMySymetricEncryption.GetMyDecryptedValue(queryString);
                if (decrypedPara != "")
                {
                    IDictionary<string, string> keyValueList = StringUtility.GetQueryStringDictionary(decrypedPara);

                    string userID = StringUtility.GetValueFromQueryString("UserID", keyValueList);
                    string schoolyear = StringUtility.GetValueFromQueryString("yID", keyValueList);
                    string schoolcode = StringUtility.GetValueFromQueryString("cID", keyValueList);
                    string employeeId = StringUtility.GetValueFromQueryString("tID", keyValueList);
                    string phase = StringUtility.GetValueFromQueryString("phase", keyValueList);
                    string tName = StringUtility.GetValueFromQueryString("tName", keyValueList);
                    if (schoolyear != "")
                        WorkingProfile.SchoolYear = schoolyear;
                    if (schoolcode != "")
                        WorkingProfile.SchoolCode = schoolcode;
                    if (employeeId != "")
                        WorkingAppraisee.AppraiserID = employeeId;
                    if (phase != "")
                        WorkingAppraisee.AppraisalPhase = phase;
                    //if (tName != "")   WorkingAppraisee.AppraiseeName = tName;
                    hfGoPageDirect.Value = "Yes";
                    hfTeacherName.Value = tName;
                    hfUserID.Value = userID;
                    hfApprEmployeeID.Value = employeeId;
                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("Account/Login.aspx");
        }


        protected void rblLoginAS_SelectedIndexChanged(object sender, EventArgs e)
        {
            WorkingProfile.UserRole = rblLoginAS.SelectedValue;
            hfCurrentUserRole.Value = WorkingProfile.UserRole;
            Page.Response.Redirect("Default.aspx");
        }
        private void GetUserLastWorkingValue()
        {
            LabelSchoolYear.Text = UserProfile.CurrentSchoolYear;
            LabelSchoolCode.Text = UserLastWorking.SchoolCode;
            LabelSchool.Text = UserLastWorking.SchoolName;
            hfSchoolArea.Value = UserLastWorking.SchoolArea;
            WorkingProfile.SchoolArea = hfSchoolArea.Value;
        }
        private void SaveUserWorkingEnvironment()
        {
            string screenSize = WorkingProfile.ClientUserScreen;
            string machineName = Server.MachineName;
            string browserType = HttpContext.Current.Request.Browser.Type;
            string browserVersion = HttpContext.Current.Request.Browser.Version;

            string lastValue = UserLastWorking.LastValue(User.Identity.Name, "LastValue", WorkingProfile.UserRole, machineName, screenSize, browserType, browserVersion);

        }

        protected void LinkBtnWorkingOn_Click(object sender, EventArgs e)
        {
            LinkBtnWorkingOn.Text = "Go " + WorkingProfile.WorkingOnAppr;
            if (WorkingProfile.WorkingOnAppr == "TPA")
                WorkingProfile.WorkingOnAppr = "PPA";
            else
                WorkingProfile.WorkingOnAppr = "TPA";

            lblApplication.Text = WorkingProfile.WorkingOnAppr == "TPA" ? "Teacher Performance Appraisal" : "Principal Performance Appraisal";
            appLink.InnerText = WorkingProfile.WorkingOnAppr;

            if (WorkingProfile.UserRoleLogin == "VP" && WorkingProfile.WorkingOnAppr == "TPA")
            {
                Session["HomePage"] = "EPAmanage/Loading.aspx?pID=AppraisalStaffList"; ;
            }

            DefaultLoad();
        }
    }
}