using System;
using System.Collections.Generic;

namespace BLL
{
    public interface ICommonOperate<T>
    {
        List<T> ListOfT(string sp, object parameter);
        string ValueOfString(string sp, object parameter);
        T ValueOfT(string sp, object parameter);
    }

    public class CommonOperate<T> : ICommonOperate<T>
    {

        public List<T> ListOfT(string sp, object parameter)
        {
            try
            {
                var list = MyDapper.EasyDataAccess<T>.ListOfT(sp, parameter);
                return list;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {  
            }
        }
        public string ValueOfString(string sp, object parameter)
        {
            try
            {
                var result = MyDapper.EasyDataAccess<String>.ValueOfT(sp, parameter);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public T ValueOfT(string sp, object parameter)
        {
            try
            {
                var result = MyDapper.EasyDataAccess<T>.ValueOfT(sp, parameter);
                return result;
            }
            catch (Exception ex)
            {
               
                throw ex;
                
            }
        }
    }

    
}

