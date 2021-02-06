using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtDomain.Text = WebConfig.DomainName();
                LabelAppName.Text = WebConfig.AppName();
                HostName.InnerText = System.Net.Dns.GetHostName();


                var windowsCurrent = WindowsIdentity.GetCurrent();// System.Net.CredentialCache.DefaultCredentials.ToString();

                string queryString = Page.Request.QueryString["appPara"];

                if (queryString != null)
                {
                    string decrypedPara = GetMySymetricEncryption.GetMyDecryptedValue(queryString);
                    if (decrypedPara != "")
                    {
                        IDictionary<string, string> keyValueList = StringUtility.GetQueryStringDictionary(decrypedPara);
                        string userID = StringUtility.GetValueFromQueryString("UserID", keyValueList);
                        if (userID != "")
                        {
                            txtUserName.Text = userID;
                            string role = UserProfile.UserLoginRole(userID);
                            CreateauTicket(role);
                            return;
                        }
                    }
                }

                if (windowsCurrent.IsAuthenticated)
                {
                    // txtDomain.Text = Authentication.GetCurrentUserName("Domain", windowsCurrent.Name);
                    txtUserName.Text = Authentication.GetCurrentUserName("Name", windowsCurrent.Name);
                    var cUserRole = UserProfile.UserLoginRole(txtUserName.Text);
                    if (cUserRole != "Admin") txtUserName.ReadOnly = true;

                }

                if (txtUserName.Text == "")
                    txtUserName.Focus();
                else
                    txtPassword.Focus();

                if (DBConnection.CurrentDB != "Live")
                {
                    LabelTrain.Text = DBConnection.CurrentDB;
                    LabelTrain.Visible = true;
                }
                string authenticationMethod = WebConfig.getValuebyKey("AuthenticateMethod");
                if (authenticationMethod == "NameOnly" || windowsCurrent.IsAuthenticated)
                {
                    rfPassword.Enabled = false;
                    //txtResolution.Value = "1024x768";
                    //Login_Click(Submit1,e);
                }
            }
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                var windowsCurrent = WindowsIdentity.GetCurrent();
                txtUserName.Text = txtUserName.Text.ToLower();
                if (Authentication.IsAuthenticated(txtDomain.Text, txtUserName.Text, txtPassword.Text))
                {
                    CreateAuthenticationTicket();
                }
                else
                {
                    errorlabel.Text = "Error Login User ID or Passward !";
                    errorlabel.Visible = true;
                    txtPassword.Focus();
                }
            }
            catch (Exception ex)
            {
                string exM = ex.Message;

            }

        }

        private void CreateAuthenticationTicket()
        {
            try
            {
                string loginRole = UserProfile.UserLoginRole(txtUserName.Text);//  Authentication.UserRole(txtUserName.Text);
                if (loginRole == "Other")
                {
                    errorlabel.Text = WebConfig.MessageNotAllow(); // "You are not allow to run this application ! ";
                    errorlabel.Visible = true;
                    txtUserName.Focus();
                }
                else
                {
                    CreateauTicket(loginRole);
                }
            }
            catch (Exception ex)
            {
                string exm = ex.Message;
            }

        }
        private void CreateauTicket(string loginRole)
        {
            try
            {
                WorkingProfile.UserRole = loginRole;
                WorkingProfile.UserRoleLogin = loginRole;
                WorkingProfile.ClientUserScreen = txtResolution.Value;

                Boolean iscookiepersistent = chkPersist.Checked;
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, txtUserName.Text.ToLower(), DateTime.Now, DateTime.Now.AddMinutes(60), iscookiepersistent, "");
                string encryptedTitcket = FormsAuthentication.Encrypt(authTicket);
                HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTitcket);
                if (iscookiepersistent)
                {
                    authCookie.Expires = authTicket.Expiration;
                }
                Response.Cookies.Add(authCookie);
                System.Security.Principal.GenericIdentity id = new System.Security.Principal.GenericIdentity(authTicket.Name, "LdapAuthentication");
                System.Security.Principal.GenericPrincipal principal = new System.Security.Principal.GenericPrincipal(id, null);
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text.ToLower(), chkPersist.Checked);
            }
            catch (Exception ex)
            {
                string exm = ex.Message;
            }


        }


    }
}