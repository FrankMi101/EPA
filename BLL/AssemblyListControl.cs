using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BLL
{
   public  class AssemblyListControl<T>
    {

        public static void SetList(System.Web.UI.WebControls.ListControl myListControl, object parameter)
        {
             var myList = AppraisalExecute.ListofT<T>(parameter); 
             AssemblingMyList(myListControl, myList, "myValue", "myText");
        }
    
        public static void SetList(System.Web.UI.WebControls.ListControl myListControl, object parameter, object initialValue)
        {
            SetList(myListControl, parameter);
            SetValue(myListControl, initialValue);
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
        public static void SetList2(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, object parameter)
        {
            var myList = AppraisalExecute.ListofT<T>(parameter);
            AssemblingMyList(myListControl1, myList,"myValue", "myValue");
            AssemblingMyList(myListControl2, myList, "myValue", "myText");
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
}
