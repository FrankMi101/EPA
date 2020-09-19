using MyDapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
 
namespace BLL
{
    public class CommonList<T>:ICommonList<T>
    {
        public List<T> GeneralList(object parameter )
        {
            try
            {
                string sp = SPandParameters.GetSPNameAndParameters(typeof(T).Name, "List");
                return GeneralList (sp,parameter);
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public List<T> GeneralList(object parameter, string page, string action)
        {
            try
            {
                string sp = SPandParameters.GetSPNameAndParameters(page, action);
                return GeneralList(sp, parameter);
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }

        public List<T> GeneralList(string sp, object parameter)
        {
            try
            {
                var list = GeneralDataAccess.GetListofTypeT<T>(sp, parameter);
                return list;
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }

      

     
    }
}
