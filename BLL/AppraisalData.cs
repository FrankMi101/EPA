using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AppraisalData
    {

        public string Comment(AppraisalComment parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<AppraisalComment>();// getPositionsSP(className);
                var value = MyDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public string DomainComment(AppraisalCommentOnDomain parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<AppraisalCommentOnDomain>();// getPositionsSP(className);
                var value = MyDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public string DomainRate(AppraisalRateOnDomain parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<AppraisalRateOnDomain>();// getPositionsSP(className);
                var value = MyDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }

    }
    public class AppraisalData<T>
    {
        public string MyComment(object parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<T>();
                var value = MyDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return "";
            }
        }
        
    }
}

