using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace BLL
{
    public class AppraisalGeneral
    {
        public static string GetSP(string action)
        {
            switch (SPSource.SPFile)
            {
                case "JsonFile":
                    return GetSPFrom.JsonFile(action);
                case "DBTable":
                    return GetSPFrom.DbTable(action, "AppraisalGeneral");
                default:
                    return GetSPInClass(action);
            }
        }
        public static List<T> CommonList<T>(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action) ;          
                return CommonExecute<T>.ListOfT(sp , parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }

        }
        public static T CommonValue<T>(string action, object parameter)
        {
            try
            {
                string sp = GetSP(action); 
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }

        }

        private static string GetSPInClass(string action)
        {
            string parameter = " @Operate,@UserID,@Para1,@Para2,@Para3";

            switch (action)
            {

                case "DDList":
                    return "dbo.EPA_sys_getListsValuePara"; // + parameter;
                case "SchoolList":
                    return "dbo.EPA_sys_getSchoolList"; //  + parameter;
                case "WorkingItemLink":
                    return "dbo.EPA_sys_getLastWorkingLink @Operate, @UserID";
                case "ApprType":
                    return "dbo.EPA_sys_getListsValuePara";
                default:
                    return action;

            }


        }

    }

}

