using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class JsonFileReadSP
    {
        public static string GetSPFromJsonFile(string action)
        {
            try
            {
                string JsonFile = SPSource.SPFile;
                DataSourceItemList myspname = JsonFileReader<DataSourceItemList>.GetSP_fromList(JsonFile); //.JsonFileReader(JsonFile);
                var mylist = from p in myspname.AppraisalManage
                             where p.action == action
                             select p.objName.ToString() + p.parameters.ToString();
                return mylist.FirstOrDefault();
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                string es = ex.StackTrace;
                throw;
            }

        }
        public static string GetSPFromJsonFile(string action, string page)
        {
            try
            {
                string JsonFile = SPSource.SPFile;
                DataSourceItemList myspname = JsonFileReader<DataSourceItemList>.GetSP_fromList(JsonFile); //.JsonFileReader(JsonFile);
                var mylist = from p in myspname.SystemSetup
                             where p.action == action
                             select p.objName.ToString() + p.parameters.ToString();
                return mylist.FirstOrDefault();
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                string es = ex.StackTrace;
                throw;
            }

        }
    }
    public class GetSPFrom
    {
        public static string JsonFile(string action)
        {
            try
            {
                string JsonFile = SPSource.SPFile;
                DataSourceItemList myspname = JsonFileReader<DataSourceItemList>.GetSP_fromList(JsonFile); //.JsonFileReader(JsonFile);
                var mylist = from p in myspname.AppraisalManage
                             where p.action == action
                             select p.objName.ToString() + p.parameters.ToString();
                return mylist.FirstOrDefault();
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                string es = ex.StackTrace;
                throw;
            }

        }
        public static string JsonFile(string action, string page)
        {
            try
            {
                string JsonFile = SPSource.SPFile;
                DataSourceItemList myspname = JsonFileReader<DataSourceItemList>.GetSP_fromList(JsonFile); //.JsonFileReader(JsonFile);
                var mylist = from p in myspname.SystemSetup
                             where p.action == action
                             select p.objName.ToString() + p.parameters.ToString();
                return mylist.FirstOrDefault();
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                string es = ex.StackTrace;
                throw;
            }

        }

        public static string DbTable(string action, string className)
        {
            var parameter = new
            {
                Action = action,
                ClassName = className
            };
            string sp = "dbo.EPA_sys_StoreProcedureName";
            return CommonExecute<string>.ValueOfT(sp, parameter);
        }
    }
}
