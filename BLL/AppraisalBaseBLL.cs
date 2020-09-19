using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public  class AppraisalBaseBLL
    {
        public static List<T> CommonListB<T>(string action, object parameter)
        {
            try
            {
               
                string sp =  GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }

        }
        public static T CommonValueB<T>(string action, object parameter)
        {
            try
            {
                  
                  string sp =  GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        private static  string GetSP(string action)
        { return ""; }
    }
}
