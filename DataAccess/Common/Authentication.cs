using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices;
using System.Text;

namespace DataAccess
{

    public class Authentication
    {
        public Authentication()
        { }
        public static bool IsAuthenticated1(string _domain, string username, string pwd)
        {
            string _path = WebConfig.getValuebyKey("LDAP");
            string domainAndUsername = _domain + "\\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd);
            try
            {
                Object obj = entry.NativeObject;
                DirectorySearcher search = new DirectorySearcher(entry);

                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
                SearchResult result = search.FindOne();


                if (result == null)
                    return false;
                else
                    return true;

                //update the new path to the user in directory
                //  _path = result.Path;
                //   string _filterAttribute =  System.Convert.ToString(result.Properties("cn")(0)); 
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
                string authenticationMethod = WebConfig.getValuebyKey("AuthenticateMethod");

                if (authenticationMethod == "NameOnly")
                {
                    return true;
                }
                else
                {
                    string _path =  WebConfig.getValuebyKey("LDAP");
                    string domainAndUsername = _domain + "'\'" + username;
                    DirectoryEntry entry = new DirectoryEntry(_path, username, pwd);
                    try
                    {
                        Object obj = entry.NativeObject; //  .NativeObject;
                        DirectorySearcher search = new DirectorySearcher(entry);

                        search.Filter = "(SAMAccountName=" + username + ")";
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
        public static string UserRole(string userID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_UserPermissionControl";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[2];
                SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@UserID", userID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 20, "@Type", "Role");
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            {
                string myEx = ex.Message;
                return "Other";
            }
            finally
            { }
        }
    }
}
