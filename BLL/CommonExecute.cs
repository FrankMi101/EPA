using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommonExecute<T>
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SP"> store procedure name and @parameters, for example dbo.tcdsb_LTO_PageGeneral_List @Operate,@Para1,@Para1,@Para2,@Para3</param>
        /// <param name="parameter"> store procedure parameters data object. for example List2Item { Operate = "PostingRound", Para0 = "20192020", Para1 = "0529" }</param>
        /// <returns> general list of T class type </returns>
        public static List<T> ListOfT(string SP, object parameter)
        {

            var mylist = new CommonOperate<T>();
            SP = CheckSP(SP, parameter);
            return mylist.ListOfT(SP, parameter);

        }
        public static T ValueOfT(string SP, object parameter)
        {

            var myvalue = new CommonOperate<T>();
            SP = CheckSP(SP, parameter);
            return myvalue.ValueOfT(SP, parameter);

        }
        public static String ValueOfString(string SP, object parameter)
        {

            var myvalue = new CommonOperate<string>();
            SP = CheckSP(SP, parameter);
            return myvalue.ValueOfString(SP, parameter);

        }
        private static string CheckSP(string SP, object parameter)
        {
            return SP;
 
            //if (SP.Contains("@"))
            //    return SP;
            //else
            //    return AppraisalCommon.GetParamerters(SP, parameter);
        }

    }
}
