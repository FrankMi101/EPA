using System;
using System.Collections.Generic;

namespace BLL.AppraisalGeneralData
{

    public class AppraisalSetup<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalSetup.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalSetup.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalSignOff<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalSignOff.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalSignOff.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalManage<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalManage.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalManage.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalContentsStrategy<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContentsStrategy.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContentsStrategy.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalContentsDomain<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContentsDomain.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContentsDomain.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalContents<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContents.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalContents.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
    public class AppraisalActivity<T>
    {
        public static List<T> ListOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalActivity.GetSP(action);
                return CommonExecute<T>.ListOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
        public static T ValueOfT(string action, object parameter)
        {
            try
            {
                string sp = AppraisalActivity.GetSP(action);
                return CommonExecute<T>.ValueOfT(sp, parameter);
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                throw;
            }
        }
    }
}

