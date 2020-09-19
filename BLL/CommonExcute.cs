using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary;
namespace BLL
{
    public class CommonExcute<T>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SP"> store procedure name and @parameters, for example dbo.tcdsb_LTO_PageGeneral_List @Operate,@Para1,@Para1,@Para2,@Para3</param>
        /// <param name="parameter"> store procedure parameters data object. for example List2Item { Operate = "PostingRound", Para0 = "20192020", Para1 = "0529" }</param>
        /// <returns> general list of T class type </returns>
        public static List<T> ListOfT(string SP, object parameter)
        {
            var mylist = new CommonList<T>();
            return mylist.GeneralList(SP, parameter);
        }
        public static List<T> ListOfT( object parameter, string page, string action)
        {
            var mylist = new CommonList<T>();
            return mylist.GeneralList(parameter,page,action);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SP"> store procedure name and @parameters. for example dbo.tcdsb_LTO_PagePublish_Operation @Operate, @UserID, @SchoolYear,@SchoolCode,@PositionID, @PositionType</param>
        /// <param name="parameter"> store procedure parameters data object. foxe example PositionPublish {Operate ="Update", UserID ="",SchoolYear="20192020",PositionID="11575"........} </param>
        /// <returns> single text value for example, school name or successfully/Failed </returns>

        public static string ValueOfT(string SP, T parameter)
        {
            var myval = new CommonValue<T>();
            return myval.GeneralValue(SP, parameter);
        }
        public static string ValueOfT(string SP, object parameter)
        {
            var myval = new CommonValue<T>();
            return myval.GeneralValue(SP, parameter);
        }
        public static string ValueOfT(  T parameter, string page, string action)
        {
            var myval = new CommonValue<T>();
            return myval.GeneralValue(  parameter ,page,action);
        }
    }

    public  class CommonExcute
    {
        public static string SPNameAndParameters(string JsonFile, string page, string action)
        {
            if (JsonFile == "")
            {
                return SPandParameters.GetSPNameAndParameters(page, action);
            }
            else
            {
               

                return GetSPandPara_FromItemList(JsonFile, page, action);  // for DataAccess.json
               //    return GetSPandPara_FromPageList(JsonFile, page, action); // for DataAccessSP.json 

            }
        }
        public static List<CommonList> GetNameValueList(string JsonFile, string listType, string action)
        {
   
            string sp = SPNameAndParameters(JsonFile, listType, action);
            CommonListParameter parameter = new CommonListParameter() {  Operate = listType } ;
         
            return CommonExcute<CommonList>.ListOfT(sp,parameter);
        }
        private static string GetSPandPara_FromItemList(string JsonFile, string page, string action)
        {
            SPName myspname = JsonFileReader<SPName>.GetSP_fromList(JsonFile, page, action);

            var mylist = from p in myspname.General
                         where p.Action == action
                         select p.ObjName.ToString() + p.Parameters.ToString();

            switch (page)
            {
                case "General":
                    mylist = from p in myspname.General
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Request":
                    mylist = from p in myspname.Request
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Approve":
                    mylist = from p in myspname.Approve
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Publish":
                    mylist = from p in myspname.Publish
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Candidate":
                    mylist = from p in myspname.Candidate
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Hiring":
                    mylist = from p in myspname.Hiring
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Hired":
                    mylist = from p in myspname.Hired
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Interview":
                    mylist = from p in myspname.Interview
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                case "Apply":
                    mylist = from p in myspname.Apply
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
                default:
                    mylist = from p in myspname.General
                             where p.Action == action
                             select p.ObjName.ToString() + p.Parameters.ToString();
                    break;
            }

            return mylist.FirstOrDefault();
        }
        private static string GetSPandPara_FromPageList(string JsonFile, string page, string action)
        {
            DataSourcePageList myspname = JsonFileReader<DataSourcePageList>.GetSP_fromList(JsonFile, page, action);

            var mylist = from p in myspname.DataAccessSource
                         where p.page == page
                         select p.SourceList;

            var myNewListOne = mylist.FirstOrDefault();


            var mylistOne = from s in myNewListOne
                            where s.action == action
                            select s.objName.ToString() + s.parameters.ToString();

            return mylistOne.FirstOrDefault();
        }
    }





    public class SPAndParaItem
    {
        public string Action { get; set; }
        public string ObjName { get; set; }
        public string Parameters { get; set; }
    }
    public class SPName
    {
        public List<SPAndParaItem> General { get; set; }
        public List<SPAndParaItem> Request { get; set; }
        public List<SPAndParaItem> Approve { get; set; }
        public List<SPAndParaItem> Publish { get; set; }
        public List<SPAndParaItem> Candidate { get; set; }
        public List<SPAndParaItem> Interview { get; set; }
        public List<SPAndParaItem> Hiring { get; set; }
        public List<SPAndParaItem> Hired { get; set; }
        public List<SPAndParaItem> Apply { get; set; }

    }

     


    public class NameValueList
    {
        public List<CommonList> SearchBy { get; set; }
        public List<CommonList> SearchByShort { get; set; }
        public List<CommonList> SchoolArea { get; set; }
        public List<CommonList> RoundCycle { get; set; }
        public List<CommonList> PostingState { get; set; }
        public List<CommonList> Panel { get; set; }
    }

}
 
