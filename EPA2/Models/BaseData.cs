using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class BaseData : System.Web.UI.Page
    {
        public static List<T> GeneralList<T>(string sp, object parameter)
        {
            sp = CheckSP(sp, parameter);
            return AppraisalCommon.CommonList<T>(sp, parameter);
        }
        public static List<T> GeneralList<T>(string sp, object parameter, WebControl actionControl)
        {
            sp = CheckSP(sp, parameter);
            if (WebConfig.RunningModel() == "Design") actionControl.ToolTip = sp;
            return GeneralList<T>(sp, parameter);
        } 
        public static List<T> GeneralList<T>(string className, string action, object parameter)
        {
            string sp = SPName(className, action);
            return GeneralList<T>(sp, parameter);  //AppraisalCommon.CommonList<T>(className, action, parameter);
        } 
 
        public static List<T> GeneralList<T>(string className, string action, object parameter, WebControl actionControl)
        {
            string sp = SPName(className, action);
//            if (WebConfig.RunningModel() == "Design") btnControl.ToolTip = sp;
            return GeneralList<T>(sp, parameter, actionControl);           
        }
        public static T GeneralValue<T>(string sp, object parameter)
        {
            return AppraisalCommon.CommonValue<T>(sp, parameter);
        }
        public static T GeneralValue<T>(string className, string action, object parameter)
        {
            string sp = SPName(className, action);
            return     GeneralValue<T>(sp, parameter); // AppraisalCommon.CommonValue<T>(className, action, parameter);
        }
        public static T GeneralValue<T>(string className, string action, object parameter, WebControl btnControl)
        {
            string sp = SPName(className, action);
            if (WebConfig.RunningModel() == "Design") btnControl.ToolTip = sp;
            return GeneralValue<T>(sp, parameter);   
        }
        public static string SPName( string className, string action)
        {
            return AppraisalCommon.GetSPFromClassAction(className, action);
        }
        public static void ShowSP(   string claseName, string action,WebControl btnControl)
        {
            if (WebConfig.RunningModel() == "Design") btnControl.ToolTip  = SPName(claseName, action);
        }
        public static string GetParaStrFromParameterObj(object parameter)
        {
            return AppraisalCommon.GetParameterStrFromParameterObj(parameter);
        }
        private static string CheckSP(string SP, object parameter)
        {
            if (SP.Contains("@"))
                return SP;
            else
                return AppraisalCommon.GetParamerters(SP, parameter);
        }
    }
   
}