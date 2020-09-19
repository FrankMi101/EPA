using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BLL
{
    public class AssemblyListControl<T>
    {

        public static void SetList(System.Web.UI.WebControls.ListControl myListControl, object parameter)
        {
            var myList = AppraisalExecute.ListofT<T>(parameter);
            AssemblingMyList(myListControl, myList, "Code", "Name");
        }

        public static void SetList(System.Web.UI.WebControls.ListControl myListControl, object parameter, object initialValue)
        {
            SetList(myListControl, parameter);
            SetValue(myListControl, initialValue);
        }

        private static void AssemblingMyList(System.Web.UI.WebControls.ListControl myListControl, object myListData, string ValueField, string TextField)
        {
            try
            {
                // List<List2Item> myList = myList;
                myListControl.Items.Clear();
                myListControl.DataSource = myListData;
                myListControl.DataTextField = TextField;
                myListControl.DataValueField = ValueField;
                myListControl.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }
        public static void SetList2(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, object parameter)
        {
            var myList = AppraisalExecute.ListofT<CommonListSchool>(parameter);

            List<CommonListSchool> sortedList = myList.OrderBy(o => o.Code).ToList();

            AssemblingMyList(myListControl1, sortedList, "Code", "Code");
            AssemblingMyList(myListControl2, myList, "Code", "Name");
        }
        public static void SetList2(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, object parameter, string initialValue)
        {
            SetList2(myListControl1, myListControl2, parameter);
            SetValue(myListControl1, initialValue);
            SetValue(myListControl2, initialValue);
        }
        public static void SetValue(System.Web.UI.WebControls.ListControl myListControl, object objectValue)

        {
            try
            {
                myListControl.ClearSelection();
                if (myListControl.Items.Count > 0)
                {
                    if (myListControl.Items.Count == 1)
                    {
                        myListControl.SelectedIndex = 0;
                    }
                    else
                    {
                        if (objectValue != null)
                        {
                            if (objectValue.ToString() == "0")
                            {
                                myListControl.SelectedIndex = 0;
                            }
                            else
                            {
                                foreach (ListItem item in myListControl.Items)
                                {
                                    if (item.Value.ToString().ToLower() == objectValue.ToString().ToLower())
                                    {
                                        item.Selected = true;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                if (myListControl.Items.Count > 0)
                { myListControl.SelectedIndex = 0; }
                else
                {
                    var error = ex.Message;
                    throw new Exception(error);
                }

            }
        }


    }

    public static class AssemblingList
    {
        public static void SetLists(System.Web.UI.WebControls.ListControl myListControl, List<CommonList> myListData)
        {

            AssemblingMyList(myListControl, myListData, "Code", "Name");
        }
        public static void SetLists(System.Web.UI.WebControls.ListControl myListControl, List<CommonList> myListData, object initialValue)
        {

            SetLists(myListControl, myListData);
            SetValue(myListControl, initialValue);
        }
        public static void SetLists(string JsonSource, System.Web.UI.WebControls.ListControl myListControl, string ddlType, CommonListParameter parameter)
        {
            List<CommonList> myListData = ListDataSource(JsonSource, ddlType, parameter,"DDList");
            SetLists(myListControl, myListData);
        }
        public static void SetLists(string JsonSource, System.Web.UI.WebControls.ListControl myListControl, string ddlType, CommonListParameter parameter, object initialValue)
        {
            SetLists(JsonSource, myListControl, ddlType, parameter);
            SetValue(myListControl, initialValue);
        }
   
        public static void SetValue(System.Web.UI.WebControls.ListControl myListControl, object objectValue)

        {
            try
            {
                myListControl.ClearSelection();
                if (myListControl.Items.Count > 0)
                {
                    if (myListControl.Items.Count == 1)
                    {
                        myListControl.SelectedIndex = 0;
                    }
                    else
                    {
                        if (objectValue != null)
                        {
                            if (objectValue.ToString() == "0")
                            {
                                myListControl.SelectedIndex = 0;
                            }
                            else
                            {
                                foreach (ListItem item in myListControl.Items)
                                {
                                    if (item.Value.ToString().ToLower() == objectValue.ToString().ToLower())
                                    {
                                        item.Selected = true;
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                if (myListControl.Items.Count > 0)
                { myListControl.SelectedIndex = 0; }
                else
                {
                    var error = ex.Message;
                    throw new Exception(error);
                }

            }
        }
        public static void SetValueMultiple(System.Web.UI.WebControls.ListControl myListControl, string value)
        {
            try
            {
                if (myListControl.Items.Count > 0)
                {
                    if (value != null)
                    {
                        myListControl.ClearSelection();
                        foreach (ListItem item in myListControl.Items)
                        {
                            if (value.IndexOf(item.Value) != -1)
                            {
                                item.Selected = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        private static void AssemblingMyList(System.Web.UI.WebControls.ListControl myListControl, object myList, string ValueField, string TextField)
        {
            try
            {
                // List<List2Item> myList = myList;
                myListControl.Items.Clear();
                myListControl.DataSource = myList;
                myListControl.DataTextField = TextField;
                myListControl.DataValueField = ValueField;
                myListControl.DataBind();
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

        public static void SetListSchool(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, string ddlType, CommonListParameter parameter, object initialValue)
        {
            SetListSchool(myListControl1, myListControl2, ddlType, parameter);
            SetValue(myListControl1, initialValue);
            SetValue(myListControl2, initialValue);
        }
        public static void SetListSchool(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, string ddlType, CommonListParameter parameter)
        {
          //  string SP = SPandParameters.GetSPNameAndParameters("General", "Schools");

            List<CommonList> myListData = ListDataSource("", ddlType, parameter, "SchoolList");  // CommonExcute<CommonList>.ListOfT(SP, parameter);
            AssemblingSchoolList(myListControl1, myListControl2, myListData);

        }
        private static void AssemblingSchoolList(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, List<CommonList> myList)
        {
            try
            {
                var byList = myList.OrderBy(o => o.Code); 
                //var sList = from c in myList
                //             orderby c.Code
                //             select c;
                AssemblingMyList(myListControl2, myList, "Code", "Name"); // School Name DDL
                AssemblingMyList(myListControl1, byList, "Code", "Code"); // school Code DDL

            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

        private static List<CommonList> ListDataSource(string JsonSource, string ddlType, CommonListParameter parameter, string action)
        {
            List<CommonList> myListData;
            if (JsonSource == "")
            {
                parameter.Operate = ddlType;

                //  string SP = SPandParameters.GetSPNameAndParameters("General", "DDList");
                //   myListData = CommonListExecute<NVListItem>.GeneralList(SP, parameter);
                myListData = AppraisalGeneral.CommonList<CommonList>(action, parameter); //  CommonExcute<CommonList>.ListOfT(SP, parameter);
            }
            else
            {
                myListData = CommonExcute.GetNameValueList(JsonSource, ddlType, action);
            }
            return myListData;

        }

    }
}
