
using System;
using System.Web.UI.WebControls;
using System.Data;

namespace DataAccess
{

    public class myList
    {
        static string SP = "dbo.EPA_sys_getListsValuePara";

        public myList()
        { }
        public static DataSet Contents(string _UserID, string _filedID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_UploadFile";
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[2];
                SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@UserID", _UserID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 50, "@FileID", _filedID);
                return SetSQLParameter.getMyDataSet(_SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
            finally
            { }


        }

        public static void SetListValue(System.Web.UI.WebControls.DropDownList myListControl, object _Value)
        {
            myListControl.ClearSelection();
            if (myListControl.Items.Count == 1)
            {
                myListControl.SelectedIndex = 0;
            }
            else
            {
                if (_Value.ToString() == "0")
                {
                    myListControl.SelectedIndex = 0;
                }
                else
                {
                    foreach (ListItem _item in myListControl.Items)
                    {
                        if (_item.Value.ToString().ToLower() == _Value.ToString().ToLower())
                        {
                            _item.Selected = true;
                            break;
                        }
                    }
                }
            }
        }
        public static void SetListValue(System.Web.UI.WebControls.CheckBoxList myListControl, object _Value)
        {
            int x = 0;
            myListControl.ClearSelection();
            if (myListControl.Items.Count == 1)
            {
                myListControl.SelectedIndex = 0;
            }
            else
            {
                foreach (ListItem _item in myListControl.Items)
                {
                    if (_Value.ToString().Substring(x, 1) == "1")
                    {
                        _item.Selected = true;
                    }
                    x++;
                }
            }
        }
        public static void SetListValue(System.Web.UI.WebControls.RadioButtonList myListControl, object _Value)
        {
            myListControl.ClearSelection();
            if (myListControl.Items.Count == 1)
            {
                myListControl.SelectedIndex = 0;
            }
            else
            {
                foreach (ListItem _item in myListControl.Items)
                {
                    if (_item.Value.ToString().ToLower() == _Value.ToString().ToLower())
                    {
                        _item.Selected = true;
                        break;
                    }
                }
            }
        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, DataSet myData)
        {
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID)
        {
            DataSet myData = myListReader(operate, userID);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string Para1)
        {
            DataSet myData = myListReader(operate, userID, Para1);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string Para1, string Para2)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.DropDownList myListControl, string operate, string userID, string Para1, string Para2, string Para3)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2, Para3);
            AssemblingList(myListControl, myData);
        }

        public static void SetLists(System.Web.UI.WebControls.CheckBoxList myListControl, DataSet myData)
        {
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.CheckBoxList myListControl, string operate, string userID)
        {
            DataSet myData = myListReader(operate, userID);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.CheckBoxList myListControl, string operate, string userID, string Para1)
        {
            DataSet myData = myListReader(operate, userID, Para1);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.CheckBoxList myListControl, string operate, string userID, string Para1, string Para2)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.CheckBoxList myListControl, string operate, string userID, string Para1, string Para2, string Para3)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2, Para3);
            AssemblingList(myListControl, myData);
        }

        public static void SetLists(System.Web.UI.WebControls.RadioButtonList myListControl, DataSet myData)
        {
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.RadioButtonList myListControl, string operate, string userID)
        {
            DataSet myData = myListReader(operate, userID);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.RadioButtonList myListControl, string operate, string userID, string Para1)
        {
            DataSet myData = myListReader(operate, userID, Para1);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.RadioButtonList myListControl, string operate, string userID, string Para1, string Para2)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2);
            AssemblingList(myListControl, myData);
        }
        public static void SetLists(System.Web.UI.WebControls.RadioButtonList myListControl, string operate, string userID, string Para1, string Para2, string Para3)
        {
            DataSet myData = myListReader(operate, userID, Para1, Para2, Para3);
            AssemblingList(myListControl, myData);
        }

        private static DataSet myListReader(string operate, string userID)
        {
            try
            {
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[2];
                myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID);
                return SetSQLParameter.getMyDataSet(SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        private static DataSet myListReader(string operate, string userID, string vPara1)
        {
            try
            {
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[3];
                myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1);
                return SetSQLParameter.getMyDataSet(SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        private static DataSet myListReader(string operate, string userID, string vPara1, string vPara2)
        {
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[4];
            myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1, vPara2);
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }
        private static DataSet myListReader(string operate, string userID, string vPara1, string vPara2, string vPara3)
        {
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
            myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1, vPara2, vPara3);
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }
        private static void AssemblingList(System.Web.UI.WebControls.ListControl myListControl, DataSet myData)
        {
            try
            {
                myListControl.Items.Clear();
                myListControl.DataSource = myData;
                myListControl.DataTextField = "myText";
                myListControl.DataValueField = "myValue";
                myListControl.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

    }
    public class mySchoolList
    {
        public mySchoolList()
        { }

        static string SP = "dbo.EPA_sys_getSchoolList";

        public static void SetListsValue(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, string _Value)
        {
            try
            {
                myListControl.ClearSelection();
                if (myListControl.Items.Count == 1)
                {
                    myListControl.SelectedIndex = 0;
                    myListControl2.SelectedIndex = 0;
                }
                else
                {
                    foreach (ListItem _item in myListControl.Items)
                    {
                        if (_item.Value == _Value)
                        {
                            _item.Selected = true;
                            break;
                        }
                    }
                    foreach (ListItem _item in myListControl2.Items)
                    {
                        if (_item.Value == _Value)
                        {
                            _item.Selected = true;
                            break;
                        }
                    }



                }

            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }

        }
        public static void SetLists2(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, string operate, string userID)
        {
            DataSet ListData = myListReader2(operate, userID);
            AssemblingSchoolList(myListControl, myListControl2, ListData);
        }
        public static void SetLists2(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, string operate, string userID, string vPara1, string vPara2)
        {
            DataSet ListData = myListReader2(operate, userID, vPara1, vPara2);
            AssemblingSchoolList(myListControl, myListControl2, ListData);
        }
        public static void SetLists2(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, string operate, string userID, string vPara1, string vPara2, string vPara3)
        {
            DataSet ListData = myListReader2(operate, userID, vPara1, vPara2, vPara3);
            AssemblingSchoolList(myListControl, myListControl2, ListData);
        }
        private static void AssemblingSchoolList(System.Web.UI.WebControls.DropDownList myListControl, System.Web.UI.WebControls.DropDownList myListControl2, DataSet myData)
        {
            try
            {
                DataSet ListData = myData;
                myListControl.Items.Clear();
                myListControl.DataSource = ListData;
                myListControl.DataTextField = "myText";
                myListControl.DataValueField = "myValue";
                myListControl.DataBind();

                DataView dvList = ListData.Tables[0].DefaultView;
                dvList.Sort = "myValue";
                myListControl2.Items.Clear();
                myListControl2.DataSource = dvList;
                myListControl2.DataTextField = "myValue";
                myListControl2.DataValueField = "myValue";
                myListControl2.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }
        private static DataSet myListReader2(string operate, string userID)
        {
            try
            {
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[2];
                myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID);
                return SetSQLParameter.getMyDataSet(SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        private static DataSet myListReader2(string operate, string userID, string vPara1)
        {
            try
            {
                MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[3];
                myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1);
                return SetSQLParameter.getMyDataSet(SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return null;
            }
        }
        private static DataSet myListReader2(string operate, string userID, string vPara1, string vPara2)
        {
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[4];
            myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1, vPara2);
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }
        private static DataSet myListReader2(string operate, string userID, string vPara1, string vPara2, string vPara3)
        {
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[5];
            myBaseParametersL.SetupBaseParameters(ref myPara, operate, userID, vPara1, vPara2, vPara3);
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }

        public static void SetListsbyPara(System.Web.UI.WebControls.DropDownList myListControl, string vType, string Para1, string Para2)
        {
            try
            {
                myListControl.Items.Clear();
                myListControl.DataSource = myListReader2(vType, Para1, Para2);
                myListControl.DataTextField = "myText";
                myListControl.DataValueField = "myValue";
                myListControl.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }


        }
    }
}


