using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public  class AppraisalExecuteData<T>
    {
        public string MyValue(object parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<T>();
                var value = MyDapper.GeneralDataAccess.GetValueofTypeT<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "";
            }
        }
        public string MyValue(object parameter, string action)
        {
            try
            {
                string sp = SPandParameters.GetValue<T>(action);
                var value = MyDapper.GeneralDataAccess.GetValueofTypeT<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "";
            }
        }
        public List<T> MyList(object parameter)
        {
            try
            {

                string sp = SPandParameters.GetList<T>();
                var list = MyDapper.GeneralDataAccess.GetListofTypeT<T>(sp, parameter);
                return list;
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public List<T> MyList(object parameter, string action)
        {
            try
            {

                string sp = SPandParameters.GetList<T>(action);
                var list = MyDapper.GeneralDataAccess.GetListofTypeT<T>(sp, parameter);
                return list;
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public static List<T> ListOfT(string sp, object parameter)
        {
            try
            {
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string sp, object parameter)
        {
            try
            {
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
}
