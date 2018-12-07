
using System;
using System.Data;
using System.Web;

namespace DataAccess
{
    public class MessagesTips
    {
        public MessagesTips()
        { }
        public static string Message(string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleMessage";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, "UPA", _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static string Message(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleMessage";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 200, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
        public static string Tips(string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleTips";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, "UPA", _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static string Tips(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleTips";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 200, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
    }
    public class Title
    {
        public Title()
        { }
        public static string Url(string _model, string _iID, string _labelTitle)
        {
            string _url = _url = "<a title =" + '"' + "Edit DropDown List" + '"' + " href=" + '"' + "javascript:openListEditPage('" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";

            return _url;
        }
        public static string Url(string myOBJ, string _model, string _aID, string _cID, string _pID, string _iID, string _labelTitle)
        {
            string _url = "";
            switch (_model)
            {
                case "Design":
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "Upload":
                    _url = "<a title =" + '"' + "Upload file" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Upload','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    // _url = "<A title =" + "'Upload file" + " href=" + "'javascript:openEditPage('Show','Upload','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + "'>";
                    break;
                case "DDLEdit":
                    _url = "<a title =" + '"' + "Edit DropDown List" + '"' + " href=" + '"' + "javascript:openListEditPage('" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "DDLEdit2":
                    _url = "<a title =" + '"' + "Edit DropDown List" + '"' + " href=" + '"' + "javascript:openListEditPage('" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "MenuItem":
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openMenuEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                default:
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
            }
            return _url;
        }
        public static string Url(string myOBJ, string _model, string _aID, string _cID, string _pID, string _iID, string _gID, string _labelTitle)
        {
            string _url = "";
            switch (_model)
            {
                case "Design":
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "Upload":
                    _url = "<a title =" + '"' + "Upload file" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Upload','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    // _url = "<A title =" + "'Upload file" + " href=" + "'javascript:openEditPage('Show','Upload','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + "'>";
                    break;
                case "DDLEdit":
                    _url = "<a title =" + '"' + "Edit DropDown List" + '"' + " href=" + '"' + "javascript:openListEditPage('" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "DDLEdit2":
                    _url = "<a title =" + '"' + "Edit DropDown List" + '"' + " href=" + '"' + "javascript:openListEditPage('" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                case "ListItem":
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openListEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "','" + _gID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
                default:
                    _url = "<a title =" + '"' + "Entry Title" + '"' + " href=" + '"' + "javascript:openEditPage('Show','Title','" + myOBJ + "','" + _aID + "','" + _cID + "','" + _pID + "','" + _iID + "')" + '"' + ">" + _labelTitle + "</a> ";
                    break;
            }
            return _url;
        }
        public static string Name(string _UserID, string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_Title";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static string Name(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {
            try
            {
                string _SP = "dbo.EPA_sys_Title";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 200, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
        public static string Message(string _UserID, string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleM";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static void Message(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleM";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 200, "@Value", _value);
                SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            {  var em= ex.Message; }
            finally
            { }

        }
        public static string NameLong(string _UserID, string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_Title2";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message;
                return ""; }
            finally
            { }
        }
        public static string NameLong(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {

            try
            {
                string _SP = "dbo.EPA_sys_Title2";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 500, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
        public static string NameHelp(string _UserID, string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleHelp";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static string NameHelp(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {

            try
            {
                string _SP = "dbo.EPA_sys_TitleHelp";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 2000, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
        public static string NameHelpShow(string _UserID, string _aID, string _cID, string _pID, string _iID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_TitleHelpShow";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "" + ex.Message; }
            finally
            { }
        }
        public static string NameHelpShow(string _UserID, string _aID, string _cID, string _pID, string _iID, string _value)
        {

            try
            {
                string _SP = "dbo.EPA_sys_TitleHelpShow";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersA.SetupBaseParameters(ref myPara, _UserID, _aID, _cID, _pID, _iID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 10, "@Value", _value);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { return "Fail - " + ex.Message; }
            finally
            { }

        }
    }
    public class HelpContext
    {
        private static string sp = "dbo.EPA_sys_HelpTextContent";
        public HelpContext()
        { }    
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode,string helpType)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 10, "@HelpType", helpType);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return ""; }

        }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode, string helpType, string value)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 10, "@HelpType", helpType);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(value));
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return ""; }

        }
     
    }
    public class MessageContext
    {
        private static string sp = "dbo.EPA_sys_HelpTextMessage";
        public MessageContext()
        { }
        public static string Message(string operate, string userID, string categoryID, string areaID, string itemCode,string userrole)
        {
            try
            {
                sp = "dbo.EPA_sys_HelpTextMessageForRole";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 20, "@UserRole", userrole);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        public static string Message(string operate, string userID, string categoryID, string areaID, string itemCode, string userrole, string value)
        {
            try
            {
                sp = "dbo.EPA_sys_HelpTextMessageForRole";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5,20, "@UserRole", userrole);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(value));
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode, string value)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(value));
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }
         public static string Statement(string operate, string userID, string category, string schoolYear, string schoolCode, string userRole)
        {
            try
            {
                string sp = "dbo.EPA_sys_HelpTextStatement";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, category);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 3, 8, "@SchoolYear" ,schoolYear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 4, 8, "@SchoolCode",  schoolCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 30, "@UserRole", userRole);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }

        }


    }
    public class TitleContext
    {
        private static string sp = "dbo.EPA_sys_HelpTextTitles";

        public TitleContext()
        { }
      
        
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return ""; }

        }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode, string title, string subTitle)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[7];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 200, "@Title", HttpContext.Current.Server.HtmlDecode(title));
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 500, "@SubTitle", HttpContext.Current.Server.HtmlDecode(subTitle));
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message;
                return ""; }

        }
    }
    public class Menus
    {
        public Menus()
        { }
        private static void SetupThisParameters(ref myCommon.MyParameterDB[] myPara, string _UserID, string _aID, string _mID, string _Type, string _cID, string _gID, string _iID, string _tID)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 50, "@UserID", _UserID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 20, "@AppCode", _aID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 20, "@Model", _mID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 20, "@Type", _Type);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 20, "@CategoryID", _cID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 20, "@GroupID", _gID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 20, "@ItemID", _iID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 7, 30, "@TitleID", _tID);
        }
        public static string Items(string _UserID, string _aID, string _mID, string _Type, string _cID, string _gID, string _iID, string _tID)
        {
            try
            {
                string _SP = "dbo.EPA_sys_Menus";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[8];
                SetupThisParameters(ref myPara, _UserID, _aID, _mID, _Type, _cID, _gID, _iID, _tID);
                return SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return ""; }
            finally
            { }
        }
        public static void Items(string _UserID, string _aID, string _mID, string _Type, string _cID, string _gID, string _iID, string _tID, string _value)
        {
            try
            {
                string _SP = "dbo.EPA_sys_Menus";
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
                SetupThisParameters(ref myPara, _UserID, _aID, _mID, _Type, _cID, _gID, _iID, _tID);
                SetSQLParameter.setParameterArray(myPara, DbType.String, 8, 500, "@Value", HttpContext.Current.Server.HtmlDecode(_value));
                SetSQLParameter.getMyDataValue(_SP, myPara);
            }
            catch (Exception ex)
            { var em = ex.Message; }
            finally
            { }
        }

        public static string ItemNamebyCode(string operate, string userID, string categoryID)
        {
            string sp = "dbo.EPA_sys_MenuItemName";
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[3];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string ItemNamebyCode(string operate, string userID, string categoryID, string areaID)
        {
            string sp = "dbo.EPA_sys_MenuItemName";
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string ItemNamebyCode(string operate, string userID, string categoryID, string areaID, string itemCode)
        {
            string sp = "dbo.EPA_sys_MenuItemName";
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
    }
    public class FeedBack
    {
        private static string sp = "dbo.EPA_sys_HelpTextFeedBack";
        public FeedBack()
        { }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode, string userRole, string schoolyear, string subject,  string feedBack)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[9];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 10, "@UserRole", userRole);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 10, "@SchoolYear", schoolyear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 100, "@Subject", subject);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 2000, "@Feedback", HttpContext.Current.Server.HtmlDecode(feedBack));
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
        public static string Content(string operate, string userID, string categoryID, string areaID, string itemCode, string userRole, string schoolyear, string subject, string feedBack,string purpose)
        {
            try
            {
                myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[10];
                myBaseParametersB.SetupBaseParameters(ref myPara, operate, userID, categoryID, areaID, itemCode);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 5, 10, "@UserRole", userRole);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 6, 10, "@SchoolYear", schoolyear);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 7, 100, "@Subject", subject);
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 8, 2000, "@Feedback", HttpContext.Current.Server.HtmlDecode(feedBack));
                SetSQLParameter.setParameterArray(myPara, System.Data.DbType.String, 9, 50, "@Purpose", purpose);
                return SetSQLParameter.getMyDataValue(sp, myPara);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
                return "";
            }
        }
    }
}


