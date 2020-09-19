using ClassLibrary;
using System;
using System.Collections.Generic;

namespace BLL
{
    public class AppraisalExecute
    {
        public static string Comments(AppraisalComment parameter)
        {
            var ad = new AppraisalText();
            return ad.Comment(parameter);
        }
        public static string CompetencyComments(AppraisalCompetency parameter)
        {
            var myValue = new AppraisalText();
            return myValue.CompetencyComment(parameter);
        }
        public static string CompetencyRate(AppraisalCompetency parameter)
        {
            var myValue = new AppraisalText();
            return myValue.CompetencyComment(parameter);
        }
        public static List<AppraisalList> ApprList(AppraisalListParameter parameter)
        {

            var mylist = new AppraisalList<AppraisalList>();
            return mylist.MyList(parameter);
        }
        public static List<AppraisalHistory> ApprHistory(AppraisalListParameter parameter)
        {

            var mylist = new AppraisalList<AppraisalHistory>();
            return mylist.MyList(parameter);
        }


        public static List<T> ListofT<T>(object parameter)
        {
            var list = new AppraisalExecuteData<T>();
            return list.MyList(parameter);
        }
        public static List<T> ListofT<T>(object parameter, string action)
        {
            var list = new AppraisalExecuteData<T>();
            return list.MyList(parameter, action);
        }
        public static string ValueofT<T>(object parameter)
        {
            var value = new AppraisalExecuteData<T>();
            return value.MyValue(parameter);
        }
        public static string ValueofT<T>(object parameter, string action)
        {
            var value = new AppraisalExecuteData<T>();
            return value.MyValue(parameter, action);
        }

    }
    public class AppraisalExecute<T>
    {

        public static List<T> AnyList(AppraisalListParameter parameter)
        {
            var list = new AppraisalExecuteData<T>();
            return list.MyList(parameter);
        }

        public static List<T> AnyListofT(object parameter)
        {
            var list = new AppraisalExecuteData<T>();
            return list.MyList(parameter);
        }


        public static string AnyValue(AppraisalComment parameter)
        {
            var value = new AppraisalExecuteData<T>();
            return value.MyValue(parameter);
        }
        public static string AnyValueofT(object parameter)
        {
            var value = new AppraisalExecuteData<T>();
            return value.MyValue(parameter);
        }


        public static List<T> ListOfT(string sp, object parameter)
        {
            try
            {
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string sp, object parameter)
        {
            try
            {
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }

        public static List<T> ListofT(string action, string sp, object parameter)
        {
            switch (action)
            {
                case "AppraisalActivity":
                    return AppraisalGeneralData.AppraisalActivity<T>.ListOfT(sp, parameter);

                case "AppraisalContents":
                    return AppraisalGeneralData.AppraisalContents<T>.ListOfT(sp, parameter);
                default:
                    return AppraisalGeneralData.AppraisalContents<T>.ListOfT(sp, parameter);
            }
        }

    }

}
