using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class GeneralDataAccess
    {
        static string conSTR = DBConnectionHelper.ConnectionSTR();

        public static List<T> ListofT<T>(string sp, object parameter)
        {
            {// T will be class type. such are School, person, Staff and so on. 
                using (IDbConnection connection = new SqlConnection(conSTR))
                {
                    var mylist = connection.Query<T>(sp, parameter).ToList();
                    return mylist;
                }
            }

        }
  
        public static string TextValue(string sp, object parameter)
        {
            using (IDbConnection connection = new SqlConnection(conSTR))
            {
                //var myText = connection.QuerySingle<SingleString>(sp, parameter);
                //return myText.MyValue;
                var myText = connection.QuerySingle<string>(sp, parameter);
                return myText;//  .MyValue;
            }
        }

        public static bool BoolValue(string sp, object parameter)
        {
            using (IDbConnection connection = new SqlConnection(conSTR))
            {
                var result = connection.QuerySingle<bool>(sp, parameter);
                return result;

            }
        }
        public static DateTime  DateValue(string sp, object parameter)
        {
            using (IDbConnection connection = new SqlConnection(conSTR))
            {
                var result = connection.QuerySingle<DateTime>(sp, parameter);
                return result;

            }
        }
    }
}
