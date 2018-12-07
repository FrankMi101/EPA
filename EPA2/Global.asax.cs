using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace EPA2
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles); 
            // Code to set up a database connection str when the application start
            string currentDB = DataAccess.DBConnection.CurrentDB;
            string connectSTR = DataAccess.DBConnection.ConnectionSTR(currentDB);
            DataAccess.SetSQLParameter.myDBConStr = connectSTR;
        }

     

    }
}