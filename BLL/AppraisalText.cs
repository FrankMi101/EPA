﻿using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AppraisalText
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
        public string CompetencyComment(AppraisalCompetency parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<AppraisalCompetency>();// getPositionsSP(className);
                var value = MyDapper.GeneralDataAccess.GetObjValue<string>(sp, parameter);
                return value.ToString();
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return null;
            }
        }
        public string CompetencyRate(AppraisalCompetency parameter)
        {
            try
            {
                string sp = SPandParameters.GetValue<AppraisalCompetency>();// getPositionsSP(className);
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
    public class AppraisalText<T>
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
    }
}

