using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AppraisalExecute 
    {
        public static string Comments (AppraisalComment parameter)
        {
            var ad = new AppraisalData();
            return ad.Comment(parameter);
        }

       
        public static List<AppraisalList> ApprList(AppraisalListParameter parameter)
        {

            var mylist = new  AppraisalList<AppraisalList>();
            return mylist.Summary(parameter);
        }
        public static List<AppraisalHistory> ApprHistory(AppraisalListParameter parameter)
        {

            var mylist = new AppraisalList<AppraisalHistory>();
            return mylist.Summary(parameter);
        }
        public static string DomainComments(AppraisalCommentOnDomain parameter)
        {
            var myValue = new AppraisalData();
            return myValue.DomainComment(parameter);
        }
    }
    public class AppraisalExecute<T>
    {
        
        public static List<T> AnyList(AppraisalListParameter parameter)
        {
            var mylist = new AppraisalList<T>();
            return mylist.Summary(parameter);
        }
        public static List<T> AnyListofT(object parameter)
        {
            var mylist = new AppraisalList<T>();
            return mylist.CommonList(parameter);
        }
       
        public static string AnyValueofT(object parameter)
        {
            var myValue = new AppraisalData<T>();
            return myValue.MyComment(parameter);
        }
    }
}
