using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
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
            hfApprEmployeeID.Value = WorkingProfile.UserEmployeeID;
            hfTeacherName.Value = WorkingProfile.UserName;

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



            myList.SetLists(rblLoginAS, "UserRole", User.Identity.Name);
            myList.SetListValue(rblLoginAS, WorkingProfile.UserRole);

            LoginUserRole.InnerText = UserProfile.LoginUserName + " as " + rblLoginAS.SelectedItem.Text;

            hfCurrentUserRole.Value = WorkingProfile.UserRole;

            GetUserLastWorkingValue();

            string pID = Page.Request.QueryString["pID"];
            if (WorkingProfile.UserRole == "Teacher")
            {
                pID = "EPAmanage/Loading.aspx?pID=AppraisalHistory";
            }
            else
            {
                if (pID == "Summary")
                { pID = "Loading.aspx?pID=Summary"; }
                else
                {
                    if (Session["HomePage"] != null)
                    {
                        pID = Session["HomePage"].ToString();
                    }
                    else
                    {
                        pID = "Loading.aspx?pID=Summary";
                    }
                }
            }
            GoList.Attributes.Add("src", pID);
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

        }
        private void SaveUserWorkingEnvironment()
        {
            string ScreenSize = WorkingProfile.ClientUserScreen;
            string machine_name = Server.MachineName;
            string browser_type = HttpContext.Current.Request.Browser.Type;
            string browser_version = HttpContext.Current.Request.Browser.Version;

            string lastValue = UserLastWorking.LastValue(User.Identity.Name, "LastValue", WorkingProfile.UserRole, machine_name, ScreenSize, browser_type, browser_version);

        }
    }
}