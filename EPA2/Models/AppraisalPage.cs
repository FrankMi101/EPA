/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using BLL;
using ClassLibrary;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class AppraisalPage : BaseData
    {
        public AppraisalPage()
        {

        }
        public static QueryValue GetQueryValue(Page page)
        {

            var queryStr = new QueryValue
            {
                SchoolYear = page.Request.QueryString["yID"],
                SchoolCode = page.Request.QueryString["cID"],
                EmployeeID = page.Request.QueryString["tID"],
                SessionID = page.Request.QueryString["sID"],
                Phase = page.Request.QueryString["phase"],
                Category = page.Request.QueryString["type"],
                TeacherName = page.Request.QueryString["tName"]
                //PageID = page.Request.QueryString["pID"],
                //ItemCode = page.Request.QueryString["pID"],
                //Area = page.Request.QueryString["pID"].Substring(0, 3),
            };

            return queryStr;
        }
        public static string GetQueryString(QueryValue queryV)
        {
            return "yID=" + queryV.SchoolYear + "&cID=" + queryV.SchoolCode + "&tID=" + queryV.EmployeeID + "&tName=" + queryV.TeacherName + "&phase=" + queryV.Phase + "&sID=" + queryV.SessionID + "&type=" + queryV.Category;

        }

        public static string GetQueryString(string schoolyear, string schoolcode, string employeeid, string tName, string phase, string sessionid, string category)
        {
            return "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionid + "&type=" + category;

        }


        public static void SetPageAttribute(Page myPage)
        {
            try
            {
                var myControl = (HiddenField)myPage.FindControl("hfContentChange");
                myControl.Value = "0";
                myControl = (HiddenField)myPage.FindControl("hfUserLoginRole");
                myControl.Value = WorkingProfile.UserRoleLogin;
                myControl = (HiddenField)myPage.FindControl("hfRunningModel");
                myControl.Value = WebConfig.RunningModel();

                myControl = (HiddenField)myPage.FindControl("hfCategory");
                myControl.Value = WorkingAppraisee.AppraisalType;
                myControl = (HiddenField)myPage.FindControl("hfPageID");
                myControl.Value = WorkingAppraisee.AppraisalArea;
                myControl = (HiddenField)myPage.FindControl("hfCode");
                myControl.Value = WorkingAppraisee.AppraisalCode;
                myControl = (HiddenField)myPage.FindControl("hfArea");
                myControl.Value = WorkingAppraisee.AppraisalArea;


                myControl = (HiddenField)myPage.FindControl("hfApprYear");
                myControl.Value = WorkingAppraisee.AppraisalYear;
                myControl = (HiddenField)myPage.FindControl("hfApprSchool");
                myControl.Value = WorkingAppraisee.AppraisalSchoolCode;
                myControl = (HiddenField)myPage.FindControl("hfApprSession");
                myControl.Value = WorkingAppraisee.SessionID;
                myControl = (HiddenField)myPage.FindControl("hfApprEmployeeID");
                myControl.Value = WorkingAppraisee.EmployeeID;
            }
            catch
            {

            }
            try
            {
                string sectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
                var mybutton = (Button)myPage.FindControl("btnPrevious");
                if (sectionStartPage.IndexOf(WorkingAppraisee.AppraisalCode) == -1)
                { mybutton.Enabled = true; }
                else
                {
                    mybutton.Enabled = false;
                }
                mybutton = (Button)myPage.FindControl("btnNext");
                if (WorkingAppraisee.AppraisalCode == "99")
                { mybutton.Enabled = false; }
                else
                {
                    mybutton.Enabled = true;
                }

            }
            catch
            { }


        }
        public static void SetPageAttribute2(Page myPage)
        {
            try
            {
                var myControl = (HiddenField)myPage.FindControl("hfCategory");
                myControl.Value = WorkingProfile.PageCategory;
                myControl = (HiddenField)myPage.FindControl("hfPageID");
                myControl.Value = WorkingProfile.PageItem;
                myControl = (HiddenField)myPage.FindControl("hfCode");
                myControl.Value = WorkingProfile.PageItem;
                myControl = (HiddenField)myPage.FindControl("hfArea");
                myControl.Value = WorkingProfile.PageArea;
                myControl = (HiddenField)myPage.FindControl("hfUserLoginRole");
                myControl.Value = WorkingProfile.UserRoleLogin;
                myControl = (HiddenField)myPage.FindControl("hfRunningModel");
                myControl.Value = WebConfig.RunningModel();
                myControl = (HiddenField)myPage.FindControl("hfContentChange");
                myControl.Value = "0";
            }
            catch
            {

            }
        }

        public static void CheckPageReadOnly(Page myPage, string checkType, string loginUserId)
        {
            var parameter = new TitleHelp
            {
                Operate = "PageHelp",
                UserID = myPage.User.Identity.Name,
                Category = WorkingAppraisee.AppraisalType,
                Area = WorkingAppraisee.AppraisalArea,
                Code = WorkingAppraisee.AppraisalCode
            };
            string pageHelpe = AppraisalPageHelp.PageHelp("PageHelp", parameter);//  AppraisalProcess.AppraisalPageItem("PageHelp", myPage.User.Identity.Name, category, area, code);
            string pageFor = AppraisalPageHelp.PageHelp("PageActiveFor", parameter);// Process.AppraisalPageItem("PageActiveFor", myPage.User.Identity.Name, category, area, code);
            string pageEp = AppraisalPageHelp.PageHelp("PageEP", parameter);// AppraisalProcess.AppraisalPageItem("PageEP", myPage.User.Identity.Name, category, area, code);
            string pageRecover = "No"; //*** no need recover feature o page tile ***//  AppraisalPageHelp.PageHelp("PageRecover", parameter);//  AppraisalProcess.AppraisalPageItem("PageRecover", myPage.User.Identity.Name, category, area, code);

            string appraislRole = WorkingProfile.UserAppraisalRole; //  AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);


            var signoffP = new AppraisalCommentSignOff
            {
                Operate = checkType,
                UserID = myPage.User.Identity.Name,
                SchoolYear = WorkingAppraisee.AppraisalYear,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                EmployeeID = WorkingAppraisee.EmployeeID,
                SessionID = WorkingAppraisee.SessionID,
                Category = WorkingAppraisee.AppraisalType,
                ItemCode = WorkingAppraisee.AppraisalArea,
                UserRole = WorkingProfile.UserRole
            };

            string signOff = AppraisalSignOff.SignOffComplete(signoffP); // SignatureProcess.SignOffComplete(checkType, myPage.User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, WorkingProfile.UserRole);
            var hfSignOff = (HiddenField)myPage.FindControl("hfSignOff");
            hfSignOff.Value = signOff;
            var hfPageReadonly = (HiddenField)myPage.FindControl("hfPageReadonly");
            hfPageReadonly.Value = "No";
            var imgSignOff = (HtmlImage)myPage.FindControl("imgSignOff");
            try
            {
                imgSignOff.Visible = false;

                if (signOff == "Complete")
                {
                    hfPageReadonly.Value = "Yes";
                    imgSignOff.Visible = true;
                }
                else
                {
                    if (myPage.User.Identity.Name.ToLower() == WorkingAppraisee.UserID.ToLower() || myPage.User.Identity.Name.ToLower() == WorkingAppraisee.AppraiserID.ToLower())
                    {
                        if (pageFor == "Both")
                        { hfPageReadonly.Value = "No"; }
                        else
                        {
                            if (pageFor == appraislRole)
                            { hfPageReadonly.Value = "No"; }
                            else
                            { hfPageReadonly.Value = "Yes"; }
                        }
                    }
                    else
                    {
                        if (appraislRole == pageFor) //(WorkingProfile.UserRole == "Admin")
                        { hfPageReadonly.Value = "No"; }
                        else
                        { hfPageReadonly.Value = "Yes"; }
                    }
                }
            }
            catch
            { }

            try
            {

                hfPageReadonly = (HiddenField)myPage.FindControl("hfPageReadonly");
                var imgRecovery = (HtmlImage)myPage.FindControl("imgRecovery");
                var imgCommentsMenu = (HtmlImage)myPage.FindControl("imgCommentsMenu");
                var imgEp = (HtmlImage)myPage.FindControl("imgEP");

                if (hfPageReadonly.Value == "Yes")
                {
                    if (imgRecovery != null) imgRecovery.Visible = false;
                    if (imgCommentsMenu != null) imgCommentsMenu.Visible = false;
                }
                else
                {
                    if (imgCommentsMenu != null) imgCommentsMenu.Visible = true;
                 
                    if (pageRecover == "Y")
                    { if (imgRecovery != null) imgRecovery.Visible = true; }
                }
                if (pageEp == "Y")
                {
                   if (imgEp != null)  imgEp.Visible = true;
                }
            }
            catch
            { }

        }

        public static string GoPage(object parameter)
        {
            return AppraisalActivity.AppraisalPageItem(parameter);
        }
        public static string GoPage(string action, string userID, string category, string area, string code)
        {
            var parameter = new
            {
                Operate = action,
                UserID = userID,
                Category = category,
                Area = area,
                Code = code
            };
            return AppraisalActivity.AppraisalPageItem(parameter);
        }
        public static string ReportName(string action, string userID, string category, string area, string code)
        {
            var parameter = new
            {
                Operate = action,
                UserID = userID,
                Category = category,
                Area = area,
                Code = code
            };
            return AppraisalPageHelp.ReportName(parameter);
        }
        public static void BuildingTextMessage(ref TextBox myMessage, object parameter)
        {

            myMessage.Text = AppraisalSetup.MessageForRole(parameter);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = true;// false;
            }

        }
        public static void BuildingTextMessage(ref Label myMessage, object parameter)
        {

            myMessage.Text = AppraisalSetup.MessageForRole(parameter);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = true;// false;
            }

        }
        public static void BuildingTextMessage(ref Label myMessage, string type, string userId, string category, string area, string code)
        {
            var parameter = new TitleHelp()
            {
                Operate = "Read",
                UserID = userId,
                Category = category,
                Area = area,
                Code = code,
                ContentType = type
            };

            myMessage.Text = BLL.HelpTitleMessage.GetContent(parameter); //BLL.MessageContext.Content(type, userId, category, area, code);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = false;
            }

        }
        public static void BuildingTextMessage(ref TextBox myMessage, string type, string userId, string category, string area, string code, string userRole)
        {

            myMessage.Text = BLL.MessageContext.Message(type, userId, category, area, code, userRole);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = true;// false;
            }

        }
        public static void BuildingTextTitle(ref Label myTitle, string type, TitleHelp parameter)
        {
            try
            {
               // parameter.Operate = type;
                parameter.ContentType = type;
                myTitle.Text = BLL.HelpTitleMessage.GetContent(parameter);
                if (myTitle.Text.Length == 0)
                {
                    myTitle.Visible = false;
                }
            }
            catch (System.Exception)
            {

                throw;
            }


        }
        public static void BuildingTextTitle(ref Label myTitle, string type, string userId, string category, string area, string code)
        {
            try
            {
                var parameter = new TitleHelp()
                {
                    Operate = "Read",
                    UserID = userId,
                    Category = category,
                    Area = area,
                    Code = code,
                    ContentType = type
                };
                myTitle.Text = BLL.HelpTitleMessage.GetContent(parameter); //BLL.TitleContext.Content(type, userId, category, area, code);
                if (myTitle.Text.Length == 0)
                {
                    if (type == "SubTitle") myTitle.Visible = false;
                    if (type == "Message") myTitle.Visible = false;
                }
            }
            catch (System.Exception)
            {

                throw;
            }


        }
        public static void BuildingTitleTab(ref HtmlGenericControl myDiv, TitleHelp parameter)
        {
            myDiv.InnerHtml = "";
            parameter.Operate = "Title";
            string title = BLL.TitleContext.Content(parameter);       // AppraisalProcess.AppraisalPageTitle("0", category,area,code,role);
            HtmlGenericControl span = new HtmlGenericControl("span");
            span.ID = "title_" + parameter.Code;
            span.Attributes.Add("class", "pageTitle");
            span.InnerText = title;
            span.Attributes.Add("title", parameter.Category + "-" + parameter.Area + "-" + parameter.Code);
            myDiv.Controls.Add(span);
            HtmlImage img = new HtmlImage();
            img.ID = "img_" + parameter.Code;
            img.Src = "../images/help2.png";
            img.Attributes.Add("class", "helpImg");


            myDiv.Controls.Add(img);
        }

        public static void BuildingTitleTab(ref HtmlGenericControl myDiv, string userId, string category, string area, string code)
        {
            myDiv.InnerHtml = "";

            string title = BLL.TitleContext.Content("Title", userId, category, area, code);       // AppraisalProcess.AppraisalPageTitle("0", category,area,code,role);
            HtmlGenericControl span = new HtmlGenericControl("span");
            span.ID = "title_" + code;
            span.Attributes.Add("class", "pageTitle");
            span.InnerText = title;
            span.Attributes.Add("title", category + "-" + area + "-" + code);
            myDiv.Controls.Add(span);
            HtmlImage img = new HtmlImage();
            img.ID = "img_" + code;
            img.Src = "../images/help2.png";
            img.Attributes.Add("class", "helpImg");


            myDiv.Controls.Add(img);
        }

        public static void SetListValue(System.Web.UI.WebControls.ListControl myListControl, object value)
        {
            AssemblingList.SetValue(myListControl, value);
        }

        public static void BuildingList(System.Web.UI.WebControls.ListControl myListControl, string action, CommonListParameter parameter)
        {
            AssemblingList.SetLists("", myListControl, action, parameter);
        }

        public static void BuildingList(System.Web.UI.WebControls.ListControl myListControl, string action, CommonListParameter parameter, object initialValue)
        {
            AssemblingList.SetLists("", myListControl, action, parameter, initialValue);
        }

        public static void BuildingList(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2, string para3)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);
            BuildingList(myListControl, operate, parameter);
        }
        public static void BuildingList(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2, string para3, object initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);
            BuildingList(myListControl, operate, parameter, initialvalue);
        }

        public static void BuildingList(System.Web.UI.WebControls.ListControl myCodeListControl, System.Web.UI.WebControls.ListControl myListNameControl, string action, CommonListParameter parameter)
        {
            AssemblingList.SetListSchool(myCodeListControl, myListNameControl, action, parameter);
        }
        public static void BuildingList(System.Web.UI.WebControls.ListControl myCodeListControl, System.Web.UI.WebControls.ListControl myListNameControl, string action, CommonListParameter parameter, object initialValue)
        {
            AssemblingList.SetListSchool(myCodeListControl, myListNameControl, action, parameter, initialValue);
        }






        public static void BuildingListControlInitial(System.Web.UI.WebControls.ListControl myListControl, object initialValue)
        {
            AssemblyListControl<CommonList>.SetValue(myListControl, initialValue);
        }
        public static void BuildingListControl(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, "", "", "");

            AssemblyListControl<CommonList>.SetList(myListControl, parameter);

        }
        public static void BuildingListControlAndInitialValue(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, object initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, "", "", "");

            AssemblyListControl<CommonList>.SetList(myListControl, parameter, initialvalue);

        }

        public static void BuildingListControl(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, "", "");

            AssemblyListControl<CommonList>.SetList(myListControl, parameter);

        }
        public static void BuildingListControlAndInitialValue(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, object initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, "", "");

            AssemblyListControl<CommonList>.SetList(myListControl, parameter, initialvalue);

        }
        public static void BuildingListControl(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, "");
            AssemblyListControl<CommonList>.SetList(myListControl, parameter);

        }
        public static void BuildingListControlAndInitialValue(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2, object initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, "");

            AssemblyListControl<CommonList>.SetList(myListControl, parameter, initialvalue);

        }
        public static void BuildingListControl(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2, string para3)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);

            AssemblyListControl<CommonList>.SetList(myListControl, parameter);

        }
        public static void BuildingListControlAndInitialValue(System.Web.UI.WebControls.ListControl myListControl, string operate, string userId, string para1, string para2, string para3, object initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);
            AssemblyListControl<CommonList>.SetList(myListControl, parameter, initialvalue);
        }
        public static void BuildingListControl2(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, string operate, string userId, string para1, string para2, string para3)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);

            AssemblyListControl<CommonListSchool>.SetList2(myListControl1, myListControl2, parameter);

        }
        public static void BuildingListControl2(System.Web.UI.WebControls.ListControl myListControl1, System.Web.UI.WebControls.ListControl myListControl2, string operate, string userId, string para1, string para2, string para3, string initialvalue)
        {
            var parameter = CommonParameters.GetListParameters(operate, userId, para1, para2, para3);
            AssemblyListControl<CommonListSchool>.SetList2(myListControl1, myListControl2, parameter, initialvalue);
        }

        public static string ItemNamebyCode(string operate, string userID, string categoryID, string areaID)
        {

            return Menus.ItemNamebyCode(operate, userID, categoryID, areaID);

        }
        public static string ItemNamebyCode(string operate, string userID, string categoryID, string areaID, string itemCode)
        {
            return Menus.ItemNamebyCode(operate, userID, categoryID, areaID, itemCode);

        }

        public static string LastWorkingItemLink(string operate, string userID)
        {
            var parameter = new
            {
                Operate = operate,
                UserID = userID
            };
            return GeneralValue<string>("AppraisalGeneral","WorkingItemLink", parameter);
        }
    }

}