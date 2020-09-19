using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.IO;

namespace BLL
{
   public  class JsonFileReader
    {
        public static string JsonString(string JsonFile)
        {
            try
            {
                using (StreamReader sr = new StreamReader(JsonFile))  // Server.MapPath("~/test.json")))
                {
                    string jsonString = sr.ReadToEnd();
                    return jsonString;
                }
            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
                return "";
            }
            finally
            { }
        }
    
        public static List<CommonList> GetNameValueList(string JsonFile, string valueType)
        {
            var jsonString = JsonString(JsonFile);
            var result = JsonConvert.DeserializeObject<NameValueList>(jsonString);
            //  var result = JsonConvert.DeserializeObject<dynamic>(jsonString);

            switch (valueType)
            {
                case "Area":
                    return result.SchoolArea;

                case "PostingCycle":
                    return result.RoundCycle;

                case "Panel":
                    return result.Panel;

                case "PostingState":
                    return result.PostingState;

                case "SearchByShort":
                    return result.SearchByShort;

                default:
                    return result.SearchBy;
            }
        }

        public static string DataAccessSP(string JsonFile, string pType, string action)
        {
            try
            {
                var jsonString = JsonString(JsonFile);
                var result = JsonConvert.DeserializeObject<DataSourceItemList>(jsonString);
                  

                List<DataSourceItem> mylist;
                switch (pType)
                {
                    case "General":
                        mylist = result.General ;
                        break;
                   
                    default:
                        mylist = result.General;
                        break;
                }

                foreach (var item in mylist)
                {
                    if (item.action == action)
                    {
                        // newSingleList.AddRange(item);   
                        return item.objName + item.parameters;
                    }
                }

                return "";


            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
                return "";
            }


        }
        public static SPName GetSP(string JsonFile, string pType, string action)
        {
            try
            {
                var jsonString = JsonString(JsonFile);
                var result = JsonConvert.DeserializeObject<SPName>(jsonString);
                return result;

            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
                return null;
            }

        }

        

    }

    public class JsonFileReader<T>
    {
        private static string JsonString(string JsonFile)
        {
            try
            {
                using (StreamReader sr = new StreamReader(JsonFile))  // Server.MapPath("~/test.json")))
                {
                    string jsonString = sr.ReadToEnd();
                    return jsonString;
                }
            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
                return "";
            }
            finally
            { }
        }
        public static T GetSP_fromList(string JsonFile)
        {
            var jsonString = JsonString(JsonFile);
            try
            {
                var result = JsonConvert.DeserializeObject<T>(jsonString);
                return result;
            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
                throw;
            }

        }

        public static T GetSP_fromList(string JsonFile, string pType, string action)
        {
            var jsonString = JsonString(JsonFile);
            try
            {
                //  var result = JsonConvert.DeserializeObject<SPName1>(jsonString);
                var result = JsonConvert.DeserializeObject<T>(jsonString);

                return result;

            }
            catch (System.Exception ex)
            {
                var em = ex.Message;
              throw;
            }

        }
    }
    public class DataSourceItem
    {
        public string source { get; set; }
        public string action { get; set; }
        public string objName { get; set; }
        public string parameters { get; set; }

    }
    public class DataSourcePage
    {
        public string page { get; set; }
        public DataSourceItem[] SourceList { get; set; }
    }

    public class DataSourcePageList
    {
        public List<DataSourcePage> DataAccessSource { get; set; }
    }

    public class DataSourceItemList
    {
        public List<DataSourceItem> General { get; set; }
        public List<DataSourceItem> AppraisalContents { get; set; }
        public List<DataSourceItem> AppraisalContentsDomain { get; set; }
        public List<DataSourceItem> AppraisalContentsStrategy{ get; set; }
        public List<DataSourceItem> AppraisalManage { get; set; }
        public List<DataSourceItem> AppraisalProcess { get; set; }
        public List<DataSourceItem> SystemSetup { get; set; }
        public List<DataSourceItem> Staff { get; set; }
        public List<DataSourceItem> Summary { get; set; }

    }
}
