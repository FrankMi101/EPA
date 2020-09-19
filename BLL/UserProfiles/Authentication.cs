using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices;
using System.Security.Principal;
using System.Text;
using System.Web.Configuration;

namespace BLL
{

    public class Authentication
    {
        public Authentication()
        { }
        public static bool IsAuthenticated1(string _domain, string username, string pwd)
        {
            string _path = WebConfigurationManager.AppSettings["LDAP"];//  WebConfig.getValuebyKey("LDAP");
            string domainAndUsername = _domain + "\\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);
            try
            {
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry)
                {
                    Filter = "(SAMAccountName=" + username + ")"
                };
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();


                if (result == null)
                    return false;
                else
                    return true;
            }
            catch (Exception ex)
            {
                // throw new Exception("Error authenticating user." + ex.Message);
                var exm = ex.Message;
                return false;
            }

        }

        public static bool IsAuthenticated(string _domain, string username, string pwd)
        {

            try
            {
                string authenticationMethod = WebConfigurationManager.AppSettings["AuthenticateMethod"];// WebConfig.getValuebyKey("AuthenticateMethod");
                var windowsCurrent = WindowsIdentity.GetCurrent();
                if (authenticationMethod == "NameOnly" || windowsCurrent.IsAuthenticated)
                {
                    return true;
                }
                else
                {
                    string _path = WebConfigurationManager.AppSettings["LDAP"]; // WebConfig.getValuebyKey("LDAP");
                    string domainAndUsername = _domain + "'\'" + username;
                    DirectoryEntry entry = new DirectoryEntry(_path, username, pwd);
                    try
                    {
                        Object obj = entry.NativeObject; //  .NativeObject;
                        DirectorySearcher search = new DirectorySearcher(entry)
                        {
                            Filter = "(SAMAccountName=" + username + ")"
                        };
                        search.PropertiesToLoad.Add("cn");
                        SearchResult result = search.FindOne();

                        if (result == null)
                            return false;
                        else
                            return true;

                    }
                    catch (Exception ex)
                    {
                        string em = ex.Message;
                        return false; ;

                    }

                }
            }
            catch (Exception ex)
            {
                string myEx = ex.Message;
                return false;
            }

        }
        //public static string UserRole(string userID)
        //{
        //    try
        //    {
        //        return UserProfile.UserLoginRole(userID);
        //    }
        //    catch (Exception ex)
        //    {
        //        string myEx = ex.Message;
        //        return "Other";
        //    }
        //    finally
        //    { }
        //}

        public static string GetCurrentUserName(string type, string cUser)
        { 
            int sIndex = cUser.IndexOf("\\");
            var sLeng = cUser.Length;
            if (type == "Domain")
                return cUser.Substring(0, sIndex);
            else
                return cUser.Substring(sIndex + 1, sLeng - sIndex - 1);
        }
    }
}
