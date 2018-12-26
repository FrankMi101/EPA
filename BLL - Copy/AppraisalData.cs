using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
   public  class AppraisalData
    {

        public  string  Comment( AppraisalComment parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<string>();// getPositionsSP(className);
                var value =  myDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
     
    }
}
