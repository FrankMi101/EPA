using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class AppraisalCommon
    {

        public static string GetSP(string action, string className)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, className);
                default:
                    return GetSPInClass(action);
            }

        }

        public static List<T> CommonList<T>(string action, object parameter)
        {
            string sp = GetSP(action, "General");
            return CommonExecute<T>.ListOfT(sp, parameter);
        }
        public static T CommonValue<T>(string action, object parameter)
        {
            string sp = GetSP(action, "General");
            return CommonExecute<T>.ValueOfT(sp, parameter);
        }
        public static List<T> CommonList<T>(string className, string action, object parameter)
        {
            var sp = GetSPFromClassAction(className, action);
            return CommonExecute<T>.ListOfT(sp, parameter);
        }

        public static T CommonValue<T>(string className, string action, object parameter)
        {
            var sp = GetSPFromClassAction(className, action);
            return CommonExecute<T>.ValueOfT(sp, parameter);
        }
        public static string GetSPFromClassAction(String className, string action)
        {
            try
            {
                switch (className)
                {
                    case "AppraisalContents":
                        return AppraisalContents.GetSP(action);
                    case "AppraisalActivity":
                        return AppraisalActivity.GetSP(action);
                    case "AppraisalContentsAGP":
                        return AppraisalContentsAGP.GetSP(action);
                    case "AppraisalContentsLTO":
                        return AppraisalContentsLTO.GetSP(action);
                    case "AppraisalContentsDomain":
                        return AppraisalContentsDomain.GetSP(action);
                    case "AppraisalContentsCompetency":
                        return AppraisalContentsCompetency.GetSP(action);
                    case "AppraisalContentsStrategy":
                        return AppraisalContentsStrategy.GetSP(action);
                    case "AppraisalManage":
                        return AppraisalManage.GetSP(action);
                    case "AppraisalSignOff":
                        return AppraisalSignOff.GetSP(action);
                    case "AppraisalSetup":
                        return AppraisalSetup.GetSP(action);
                    case "CommentsBank":
                        return CommentsBank.GetSP(action);
                    case "AppraisalPageHelp":
                        return AppraisalPageHelp.GetSP(action);
                    case "AppraisalGeneral":
                        return AppraisalGeneral.GetSP(action);
                    default:
                        return action;
                }
            }
            catch (Exception ex)
            {
                var exm = ex.Message;
                return action;
            }
        }

        private static string GetSPInClass(string action)
        {
            string parameter = " @Operate,@UserID,@Type";
            switch (action)
            {
                case "General":
                    return "dbo.EPA_sys_GeneralList" + parameter;

                case "DDList":
                    return "dbo.EPA_sys_getListsValuePara" + parameter;
                case "SchoolList":
                    return "dbo.EPA_sys_getSchoolList" + parameter;
                default:
                    return action;

            }
        }
        public static string GetParamerters(string sp, object obj)
        {
            if (sp.Contains("@"))
                return sp;
            else
                return sp + GetParameterStrFromParameterObj(obj);             
        }
     
        public static string GetParameterStrFromParameterObj(object obj)
        {
            var myP = PropertiesOfType<string>(obj);
            int x = 0;
            var para = "";
            foreach (var item in myP)
            {
                if (item.Value != null)
                {
                    if (x == 0)
                        para = " @" + item.Key;
                    else
                        para = para + ",@" + item.Key;
                    x++;
                }

            };
            return para;
        }
        private static IEnumerable<KeyValuePair<string, T>> PropertiesOfType<T>(object obj)
        {
            return from p in obj.GetType().GetProperties()
                   where p.PropertyType == typeof(T)
                   select new KeyValuePair<string, T>(p.Name, (T)p.GetValue(obj));
        }

        public static string GetParamertersFormList(string sp, List<Parameters> lPara)
        {
            if (sp.Contains("@"))
                return sp;
            else
            {
                var para = "";
                foreach (var item in lPara)
                {
                    if (item.Value != null)
                    {
                        if (item.Seq == 0)
                            para = " @" + item.Key;
                        else
                            para = para + ",@" + item.Key;
                    }

                };
                return sp + para;

            }

        }

    }
    public enum ApprClassName
    {
        AppraisalContents,
        AppraisalActivity,
        AppraisalContentsAGP,
        AppraisalContentsLTO,
        AppraisalContentsDomain,
        AppraisalContentsCompetency,
        AppraisalContentsStrategy,
        AppraisalManage,
        AppraisalSignOff,
        AppraisalSetup,
        CommentsBank,
        AppraisalPageHelp
    }




}
