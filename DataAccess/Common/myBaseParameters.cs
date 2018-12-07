using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace DataAccess
{
    public class myBaseParameters
    {
        public myBaseParameters(){}

        

        public static   myCommon.MyParameterDB myParaDB  = new myCommon.MyParameterDB();

        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate )
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
         }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID)
        {
            SetupBaseParameters(ref myPara, operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear)
        {
            SetupBaseParameters(ref myPara, operate, userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 8, "@SchoolYear", schoolYear);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 8, "@SchoolCode", schoolCode);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@EmployeeID", employeeID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 20, "@SessionID", sessionID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@Category", category);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 20, "@Area", area);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string iCode)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 10, "@ItemCode", iCode);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string iCode,string domainID)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area,iCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@DomainID", domainID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string iCode, string domainID,string competencyID)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area, iCode, domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@CompetencyID", competencyID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string category, string area, string iCode, string domainID, string competencyID, string lookForsID)
        {
            SetupBaseParameters(ref myPara, operate, userID, schoolYear, schoolCode, employeeID, sessionID, category, area, iCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 10, "@LookForID", lookForsID);
        }
    }

    public class myBaseParametersA
    {
        public myBaseParametersA() { }

        public static myCommon.MyParameterDB myParaDB = new myCommon.MyParameterDB();

        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara,  string userID, string _aID, string _cID, string _pID, string _iID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@UserID", userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@ApplID", _aID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 30, "@CategoryID", _cID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 30, "@PageID", _pID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 30, "@ItemID", _iID);
        }
    }
    public class myBaseParametersB
    {
        public myBaseParametersB() { }

        public static myCommon.MyParameterDB myParaDB = new myCommon.MyParameterDB();
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID )
        {
            SetupBaseParameters(ref myPara, operate, userID);
            SetSQLParameter.setParameterArray(myPara,  DbType.String, 2, 10, "@Category", categoryID); 
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID )
        {
            SetupBaseParameters(ref myPara, operate, userID, categoryID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 20, "@Area", areaID); 

        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode)
        {
            SetupBaseParameters(ref myPara, operate, userID, categoryID,areaID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@Code", itemCode);
        }
        //public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode,  string schoolYear)
        //{
        //    SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 8, "@SchoolYear", schoolYear);
        //}
        //public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode, string schoolYear, string schoolCode)
        //{
        //    SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode, schoolYear);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 8, "@SchoolCode", schoolCode);
        //}
        //public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode, string schoolYear, string schoolCode,string sessionID)
        //{
        //    SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode, schoolYear, schoolCode);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 20, "@SessionID", sessionID);
        //}
        //public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode, string schoolYear, string schoolCode, string sessionID, string employeeID)
        //{
        //    SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode, schoolYear, schoolCode, sessionID);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 20, "@EmployeeID", employeeID);
        //}
    }
    public class myBaseParametersC
    {
        public myBaseParametersC() { }

        public static myCommon.MyParameterDB myParaDB = new myCommon.MyParameterDB();
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID)
        {
            SetupBaseParameters(ref myPara, operate, userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 10, "@Category", categoryID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID)
        {
            SetupBaseParameters(ref myPara, operate, userID, categoryID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 20, "@Area", areaID);

        }

        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string schoolYear)
        {
             SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID);
             SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 8, "@SchoolYear", schoolYear);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID,  string schoolYear, string schoolCode)
        {
            SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID,  schoolYear);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 8, "@SchoolCode", schoolCode);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string schoolYear, string schoolCode,string IDs)
        {
            SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, schoolYear, schoolCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@IDs", IDs);
        }
        //public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string categoryID, string areaID, string itemCode, string schoolYear, string schoolCode, string sessionID, string employeeID)
        //{
        //    SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode, schoolYear, schoolCode, sessionID);
        //    SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 20, "@EmployeeID", employeeID);
        //}
    }
    public class myBaseParametersL
    {
        public myBaseParametersL() { }
        public static myCommon.MyParameterDB myParaDB = new myCommon.MyParameterDB();
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string Para1)
        {
            SetupBaseParameters(ref myPara, operate, userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 30, "@Para1", Para1);
        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string Para1, string Para2)
        {
            SetupBaseParameters(ref myPara, operate, userID, Para1);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 30, "@Para2", Para2);

        }
        public static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string Para1, string Para2, string Para3)
        {
            SetupBaseParameters(ref myPara, operate, userID, Para1, Para2);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 30, "@Para3", Para3);
        }

    }

}
