using MyDapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommonValue<T> : ICommonValue<T>
    {
        public string GeneralValue(object parameters)
        {
            try
            {
                string sp = SPandParameters.GetSPNameAndParameters((typeof(T)).Name,"Update");
                return GeneralValue(sp, parameters);
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "Failed";
            }
        }
        public string GeneralValue(object parameters,string page, string action)
        {
            try
            {
               string sp = SPandParameters.GetSPNameAndParameters(page, action);
                return GeneralValue(sp, parameters);
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "Failed";
            }
        }
        public string GeneralValue( string sp,object parameters)
        {
            try
            {
                var result = GeneralDataAccess.TextValue(sp, parameters);
                return result;
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "Failed";
            }
        }

    }
}
