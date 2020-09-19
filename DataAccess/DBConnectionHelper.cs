using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class DBConnectionHelper
    {
        public static string ConnectionSTR()
        {
            string currentDB = ConfigurationManager.ConnectionStrings["currentDB"].ConnectionString;
            //  return ConfigurationManager.ConnectionStrings[currentDB].ConnectionString;
            return ConnectionSTR(currentDB);
        }
        public static string ConnectionSTR(string name)
        {
            return ConfigurationManager.ConnectionStrings[name].ConnectionString;
        }
    }
}
