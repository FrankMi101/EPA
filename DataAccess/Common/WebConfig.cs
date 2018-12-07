using System.Configuration;
using System.Web.Configuration;

namespace DataAccess
{

    public class WebConfig
    {
        public static string getValuebyKey(string key)
        {
            return WebConfigurationManager.AppSettings[key];
        }
        public static string RunningModel()
        {
            return getValuebyKey("RunningModel");
        }
        public static string SchoolSystem()
        {
            return getValuebyKey("SchoolSystem");
        }
        public static string currentDatabase()
        {
            return getValuebyKey("currentDB");
        }
        public static string LDAPServer()
        {
            return getValuebyKey("LDAP");
        }
        public static string Reportsource()
        {
            return getValuebyKey("Reportsource");
        }
        public static string ReportServer()
        {
            return getValuebyKey("ReportServer");
        }
        public static string ReportServices()
        {
            return getValuebyKey("ReportingService");
        }
        public static string ReportPath()
        {
            return getValuebyKey("ReportPath");
        }
        public static string ReportFormat()
        {
            return getValuebyKey("ReportFormat");
        }
        public static string ReportPath2(string vSES)
        {
            return getValuebyKey("ReportPath") + vSES;
        }
        public static string ReportPathWS()
        {
            return getValuebyKey("ReportPathWS");
        }
        public static string ReportUser()
        {
            return getValuebyKey("WebServiceUser");
        }
        public static string ReportPW()
        {
            return getValuebyKey("WebServiceWP");
        }
        public static string DomainName()
        {
            return getValuebyKey("NetWorkDomain");
        }
        public static string AppName()
        {
            return getValuebyKey("Application");
        }
        public static string MessageNotAllow()
        {
            return getValuebyKey("MessageNotAllow");
        }
        public static string eMailGo()
        {
            return getValuebyKey("eMailTry");
        }


    }
    public class DBConnection
    {
        public static string CurrentDB
        {
            get { return getNamebyKey("CurrentDB"); }
        }
        public static string TestDB
        {
            get { return getNamebyKey("Test"); }
        }
        public static string LiveDB
        {
            get { return getNamebyKey("Live"); }
        }
        public static string ConnectionSTR(string name)
        {
            return getNamebyKey(name);
        }
        public static string AuthMethod()
        {
            return getNamebyKey("LDAP");
        }
        private static string getNamebyKey(string name)
        {
            return WebConfigurationManager.ConnectionStrings[name].ToString(); // .ConnectionStrings(_name).ToString;

         //   return System.Configuration.ConfigurationManager.ConnectionStrings[name].ToString();
        }
    }
}
