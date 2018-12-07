using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Web;

namespace DataAccess
{

    public class SetSQLParameter
    {
        public static string myDBConStr
        {
            get { return myCommon.DataDB.dbConnectionSTR; }
            set { myCommon.DataDB.dbConnectionSTR = value; }

        }

        public static string myApplication
        {
            get { return myCommon.DataDB.applicationName; }
            set { myCommon.DataDB.applicationName = value; }
        }

        public static void setParameterArray(myCommon.MyParameterDB[] _ParaArray, System.Data.DbType _Type, int X, int _Leng, string _Name, object _Value)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                //_ParaArray(X) = new DataAccessWebService.MyParameter;
                // ****************Base classs get data************************************************
                //  myCommon.MyParameter[]  _ParaArray1 = new  myCommon.MyParameter() ; //  New TCDSB.Student.Data.MyParameter  ' may 2 

                _ParaArray[X].pName = _Name;
                _ParaArray[X].pType = _Type;
                _ParaArray[X].pLeng = _Leng;
                _ParaArray[X].pValue = _Value;
            }
            catch (Exception e)
            { string eMsg = e.Message; }
        }
        public static void setParameterArray1(myCommon.MyParameterSQL[] _ParaArray, System.Data.SqlDbType _Type, int X, int _Leng, string _Name, object _Value)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                //_ParaArray(X) = new DataAccessWebService.MyParameter;
                // ****************Base classs get data************************************************
                //  myCommon.MyParameter[]  _ParaArray1 = new  myCommon.MyParameter() ; //  New TCDSB.Student.Data.MyParameter  ' may 2 

                _ParaArray[X].pName = _Name;
                _ParaArray[X].pType = _Type;
                _ParaArray[X].pLeng = _Leng;
                _ParaArray[X].pValue = _Value;
            }
            catch (Exception e)
            { string eMsg = e.Message; }
        }
        public static System.Data.DataSet getMyDataSet(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {  //**************** This block is using Web services get data*******************************
                //  DataAccessWebService.DataWS ws1 ; '  DataAccessWebService2.DataWS
                // Return ws1.WSDataSet(_sp, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myDataSet(_SP, _myParameter);

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return null;
            }
        }
        public static System.Data.DataSet getMyDataSet(string _SP, myCommon.MyParameterDB[] _myParameter, Int16 _Timeout)
        {
            try
            {  //**************** This block is using Web services get data*******************************
                //  DataAccessWebService.DataWS ws1 ; '  DataAccessWebService2.DataWS
                // Return ws1.WSDataSet(_sp, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myDataSet(_SP, _myParameter,_Timeout );

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return null;
            }
        }
        public static System.Data.IDataReader getMyDataList(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {  //**************** This block is using Web services get data*******************************
                //  DataAccessWebService.DataWS ws1 ; '  DataAccessWebService2.DataWS
                // Return ws1.WSDataSet(_sp, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myDataReader (_SP, _myParameter,0);

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return null;
            }
        }
        public static System.Data.IDataReader  getMyDataList(string _SP, myCommon.MyParameterDB[] _myParameter, Int16 _Timeout)
        {
            try
            {  //**************** This block is using Web services get data*******************************
                //  DataAccessWebService.DataWS ws1 ; '  DataAccessWebService2.DataWS
                // Return ws1.WSDataSet(_sp, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myDataReader(_SP, _myParameter, _Timeout);

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return null;
            }
        }
        public static string getMyDataValue(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myValue(_SP, _myParameter);

               

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return "";
            }

        }
        public static string getMyDataValue(string _SP, myCommon.MyParameterDB[] _myParameter, Int16 _Timeout)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myValue(_SP, _myParameter,_Timeout );



            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return "";
            }

        }
        public static DateTime  getMyDateTime(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myDateTime(_SP, _myParameter);



            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return DateTime.Now ;
            }

        }
        public static Boolean  getMyBoolean(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                return myCommon.DataDB.myBool(_SP, _myParameter);



            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                return false ;
            }

        }
        public static void SaveMyData(string _SP, myCommon.MyParameterDB[] _myParameter)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                myCommon.DataDB.SaveData(_SP, _myParameter);

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
               
            }
        }
        public static void SaveMyData1(string _SP, myCommon.MyParameterSQL[] _myParameter)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
                // DataAccessWebService.DataWS ws1 ;
                // return ws1.WSValue(_SP, mypara1);
                // ****************Base classs get data************************************************
                myCommon.DataSQL.SaveData(_SP, _myParameter);

            }
            catch (Exception ex)
            {
                string eMsg = ex.Message;
                ;
            }
        }
 
       


  
    }
    public class AddSQLParameter
    {
      public static void SQLParameters(System.Data.SqlClient.SqlCommand myCommand, SqlDbType _Type, int _Leng, string _Name, string Value)
        {
            System.Data.SqlClient.SqlParameter myPara = new System.Data.SqlClient.SqlParameter(_Name, _Type, _Leng);
            myPara.Value = Value;
            myCommand.Parameters.Add(myPara);
        }
        public static void SQLParameters(System.Data.SqlClient.SqlCommand myCommand, SqlDbType _Type, int _Leng, string _Name, int Value)
        {
            System.Data.SqlClient.SqlParameter myPara = new System.Data.SqlClient.SqlParameter(_Name, _Type, _Leng);
            myPara.Value = Value;
            myCommand.Parameters.Add(myPara);
        }
        public static void SQLParameters(System.Data.SqlClient.SqlCommand myCommand, SqlDbType _Type, int _Leng, string _Name, Byte[] Value)
        {
            System.Data.SqlClient.SqlParameter myPara = new System.Data.SqlClient.SqlParameter(_Name, _Type);
            myPara.Value = Value;
            myCommand.Parameters.Add(myPara);
        }
        public static void SQLParameters(System.Data.SqlClient.SqlCommand myCommand, SqlDbType _Type, int _Leng, string _Name, DateTime Value)
        {
            System.Data.SqlClient.SqlParameter myPara = new System.Data.SqlClient.SqlParameter(_Name, _Type);
            myPara.Value = Value;
            myCommand.Parameters.Add(myPara);
        }
        public static void SQLParameters(System.Data.SqlClient.SqlCommand myCommand, SqlDbType _Type, int _Leng, string _Name, float  Value)
        {
            System.Data.SqlClient.SqlParameter myPara = new System.Data.SqlClient.SqlParameter(_Name, _Type);
            myPara.Value = Value;
            myCommand.Parameters.Add(myPara);
        }
    }

    /*
    public class SetSQLParameterWS
    {
        public SetSQLParameterWS() { }


        public static void setParameterArray3( DataAccessWebService.MyParameter[]  _ParaArray, System.Data.DbType _Type, int X, int _Leng, string _Name,   object _Value)
        {
            try
            {
                //**************** This block is using Web services get data*******************************
              //  _ParaArray[X] = new DataAccessWebService.MyParameter;
                // ****************Base classs get data************************************************
                //  myCommon.MyParameter[]  _ParaArray1 = new  myCommon.MyParameter() ; //  New TCDSB.Student.Data.MyParameter  ' may 2 

                _ParaArray[X].pName = _Name;
                _ParaArray[X].pType =  (DataAccessWebService.DbType) _Type;
                _ParaArray[X].pLeng = _Leng;
                _ParaArray[X].pValue =  (string) _Value;
            }
            catch (Exception e)
            { string eMsg = e.Message; }
        }

        public static DataSet getMyDataSet3(string SP, object[]  mypara   ) {
            try
            {
                DataAccessWebService.DataWS ws = new DataAccessWebService.DataWS();
                return ws.WSDataSet(SP, ref  mypara );
            }
            catch (Exception e)
            {
                string eMsg = e.Message;
                return null;
            }

        }
        public static string getMyDataValue3(string SP,  object[] mypara)
        {
            try
            {
                DataAccessWebService.DataWS ws = new DataAccessWebService.DataWS();
                return ws.WSValue(SP, ref  mypara);
            }
            catch (Exception e)
            {
                string eMsg = e.Message;
                return "";
            }

        }
         
    }
    */

 
}
