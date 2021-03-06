﻿using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AppraisalList<T>
    {  
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
        public List<T> MyList(object parameter,string action)
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
    }
  
}
