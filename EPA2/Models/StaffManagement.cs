using BLL;
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPA2
{
    public class StaffManagement:BaseData
    {
        public StaffManagement() { }

        public static List<Appraisee> Appraisee(object parameter)
        {
            return AppraisalManage.Appraisee(parameter);
        }
        public static string  AppraiseeEdit(object parameter)
        {
            return AppraisalManage.AppraiseeEdit(parameter);
        }
        
        public static string  AppraiseeRemove(object parameter)
        {
            return AppraisalManage.AppraiseeDelete(parameter);
        }
        public static string AppraiseeCopyToNew(object parameter)
        {
            return AppraisalManage.AppraiseeCopyToNew(parameter);
        }
        public static List<Employee> Employee(object parameter)
        {
            return AppraisalManage.Employee(parameter);
        }
        public static string EmployeeEdit(object parameter)
        {
            return AppraisalManage.EmployeeEdit(parameter);
        }
        public static string EmployeeAddToApprList(object parameter)
        {
            return AppraisalManage.EmployeeAddToApprList(parameter);
        }
        

        public static List<AppraisalNotice> AppraisalStaffsNotice(object parameter)
        {
            return AppraisalManage.CommonList<AppraisalNotice>("AppraisalStaffsNotice", parameter);
        }
        public static List<AppraisalHistory> AppraisalStaffHistory(object parameter)
        {
           return  AppraisalManage.CommonList<AppraisalHistory>("AppraisalStaffHistory", parameter);
        }

        public static List<AppraisalList> AppraisalStaffs(object parameter)
        {
            
            return AppraisalManage.CommonList<AppraisalList>("AppraisalStaffs", parameter);

        }

    }
}