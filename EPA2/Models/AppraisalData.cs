using BLL;
using ClassLibrary;
using DataAccess;
using EPA2.Generic.LIB;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class AppraisalData : BaseData
    {
        public AppraisalData()
        {

        }
        //public static List<T> GeneralList<T>(string sp, object parameter)
        //{
        //    return AppraisalCommon.CommonList<T>(sp, parameter);
        //}
        //public static List<T> GeneralList<T>(string className, string action, object parameter)
        //{
        //    return AppraisalCommon.CommonList<T>(className, action, parameter);
        //}
        //public static  T GeneralValue<T>(string sp, object parameter)
        //{
        //    return AppraisalCommon.CommonValue<T>(sp, parameter);
        //}
        //public static  T GeneralValue<T>(string className, string action, object parameter)
        //{
        //    return AppraisalCommon.CommonValue<T>(className, action, parameter);
        //}


        public static List<LookFors> LookForsList(object parameter)
        {
            return AppraisalContentsDomain.LookForsbyCompetency(parameter);
        }

        public static List<AppraisalCommentsHistory> TextHistroy(string action, object parameter)
        {
            string para = " @SchoolYear,@SchoolCode,@EmployeeID,@ItemCode";
            string sp = "dbo.EPA_Appr_AppraisalData_TextHistory" + para;
            if (action == "DomainHistroy") sp = "dbo.EPA_Appr_AppraisalData_TextHistoryDomain" + para + ",@DomainID,@CompetencyID";
            if (action == "AGPHistroy") sp = "dbo.EPA_Appr_AppraisalData_TextHistoryAGP" + para + ",@Category,@Area";

            return GeneralList<AppraisalCommentsHistory>(sp, parameter);//  myDs = AppraisalDataDomain.DomainTextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, domainId, competencyId);


        }
        public static void StrLabelContent(ref Label myLabel, string action, AppraisalCommentSTR parameter)
        {

            if (action == "Get")
            {
                myLabel.Text = AppraisalContentsStrategy.ContentLabel(parameter); // userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
            }

        }
        public static void StrLabelContent(ref Label myLabel, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            if (action == "Get")
            {
                myLabel.Text = AppraisalDataStrategy.LabelContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
            }

        }
        public static void StrTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, AppraisalCommentSTR parameter)
        {

            parameter.Column = myText.ID.Substring(8, 1);
            if (action == "Get")
            {
                myText.Text = AppraisalContentsStrategy.ContentText(parameter);//  AppraisalDataStrategy.TextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                parameter.Value = myText.Text;
                string result = AppraisalContentsStrategy.ContentTextSave(parameter); // AppraisalDataStrategy.TextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column, value);
            }
        }
        public static void StrTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            string column = myText.ID.Substring(8, 1);
            if (action == "Get")
            {
                myText.Text = AppraisalDataStrategy.TextContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataStrategy.TextContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column, value);
            }
        }
        public static void StrCheckBoxContent(ref CheckBox myCheck, string action, AppraisalCommentSTR parameter)
        {

            if (action == "Get")
            {
                string value = AppraisalContentsStrategy.ContentCheckBox(parameter);// // AppraisalDataStrategy.CheckContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                if (value == "1")
                { myCheck.Checked = true; }
                else
                { myCheck.Checked = false; }
            }
            else
            {

                parameter.Value = myCheck.Checked ? "1" : "0";
                string result = AppraisalContentsStrategy.ContentCheckBoxSave(parameter);//  AppraisalDataStrategy.CheckContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, value);
            }
        }
        public static void StrCheckBoxContent(ref CheckBox myCheck, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            if (action == "Get")
            {
                string value = AppraisalDataStrategy.CheckContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
                if (value == "1")
                { myCheck.Checked = true; }
                else
                { myCheck.Checked = false; }
            }
            else
            {
                string value = myCheck.Checked ? "1" : "0";
                string result = AppraisalDataStrategy.CheckContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, value);
            }
        }

        public static void TextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            if (action == "Get" || action == "RollOver")
            {
                myText.Text = AppraisalDataAC.TextContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataAC.TextContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, value);
            }
        }
        public static void TextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, int fix = 0)
        {
            AppraisalNotes appraisalnote = new AppraisalNotes()
            {
                Action = "Get",
                UserID = userId,
                Category = category,
                Area = area,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalSchool,
                SessionID = appraisalSession,
                ItemCode = itemCode,
                EmployeeID = employeeId
            };

            IAppraisal<AppraisalNotes, string> repository = Factory.Get<IAppraisalNote>(); // new IAppraisalNote();

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = repository.GetResult(employeeId, appraisalnote, action);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                appraisalnote.Comments = myText.Text;
                string result = repository.GetResult(employeeId, appraisalnote, action);
            }
        }
        public static void Comments(ref TextBox myText, ref HtmlInputText myCount, int textLength, string action, AppraisalComment parameters)
        {
            // AppraisalComment paramaters = AppraisalCommentMethod.GetParameters(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, itemCode, category, area); //  new AppraisalComment()

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = AppraisalContents.AppraisalText(parameters); //   AppraisalExecute.ValueofT<AppraisalComment>(paramaters, action);// AppraisalExecute.Comments(comm);
                                                                           // myText.Text = AppraisalExecute<AppraisalComment>.AnyValueofT(comm);// AppraisalExecute.Comments(comm);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                parameters.Value = myText.Text;
                string result = AppraisalContents.AppraisalTextSave(parameters); AppraisalExecute.ValueofT<AppraisalComment>(parameters, action);//AppraisalExecute.Comments(comm);
            }
        }
        public static void Comments(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            AppraisalComment paramaters = AppraisalCommentMethod.GetParameters(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area); //  new AppraisalComment()

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = AppraisalExecute.ValueofT<AppraisalComment>(paramaters, action);// AppraisalExecute.Comments(comm);
                                                                                              // myText.Text = AppraisalExecute<AppraisalComment>.AnyValueofT(comm);// AppraisalExecute.Comments(comm);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                paramaters.Value = myText.Text;
                string result = AppraisalExecute.ValueofT<AppraisalComment>(paramaters, action);//AppraisalExecute.Comments(comm);
            }
        }
        public static void Comments(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, AppraisalComment parameter)
        {
            // AppraisalComment paramaters = AppraisalCommentMethod.GetParameters(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, itemCode, category, area); //  new AppraisalComment()

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = AppraisalContents.AppraisalText(parameter);// AppraisalExecute.ValueofT<AppraisalComment>(paramaters, action);// AppraisalExecute.Comments(comm);
                                                                         // myText.Text = AppraisalExecute<AppraisalComment>.AnyValueofT(comm);// AppraisalExecute.Comments(comm);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                parameter.Value = myText.Text;
                string result = AppraisalContents.AppraisalTextSave(parameter);// AppraisalExecute.ValueofT<AppraisalComment>(paramaters, action);//AppraisalExecute.Comments(comm);
            }
        }
        public static string TextContentDomain(string action, string userId, string appraisalYear, string appraisalschool, string employeeId, string appraisalSession, string category, string area, string itemCode, string domainId, string competencyId, string rate, string value)
        {
            AppraisalNotes2 apprnote = new AppraisalNotes2()
            {
                Action = action,
                UserID = userId,
                Category = category,
                Area = area,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                SessionID = appraisalSession,
                ItemCode = itemCode,
                EmployeeID = employeeId,
                DomainID = domainId,
                CompetencyID = competencyId,
                Rate = rate,
                Comments = value
            };

            IAppraisal<AppraisalNotes2, string> repository = Factory.Get<IAppraisalNote2>(); // new IAppraisalNote();
            string rValue = repository.GetResult(employeeId, apprnote, action);
            return rValue;
        }
        public static void TextContentB(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string column)
        {

            if (action == "Get" || action == "RollOver")
            {

                myText.Text = AppraisalDataAC.TextContentB(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataAC.TextContentB(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column, value);
            }
        }
        public static void DateTextContent(ref TextBox myText, ref HtmlInputText myDate, ref HtmlInputText myCount, int textLength, string action, AppraisalDateText parameter)
        {
            if (action == "Get")
            {
                AppraisalCommentAPM myApm = AppraisalContentsAGP.AppraisalTextAPMList(parameter)[0];

                myText.Text = myApm.MeetingContent;
                myDate.Value = myApm.MeetingDate;
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                parameter.Value = myText.Text;
                parameter.vDate = myDate.Value;
                string result = AppraisalContentsAGP.AppraisalTextAPMSave(parameter);//  AppraisalDataAC.TextDateContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, value, vdate);
            }
        }
        public static void DateTextContent(ref TextBox myText, ref HtmlInputText myDate, ref HtmlInputText myCount, int textLength, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            if (action == "Get")
            {
                DataTable dt = new DataTable();
                dt = AppraisalDataAC.TextDateContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
                myText.Text = dt.Rows[0]["MeetingContent"].ToString();
                myDate.Value = dt.Rows[0]["MeetingDate"].ToString();
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string vdate = myDate.Value;
                string result = AppraisalDataAC.TextDateContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, value, vdate);
            }
        }
        public static void CheckList(ref CheckBoxList cList, string action, AppraisalComment parameter)
        {

            if (action == "Get")
            {

                string sValue = AppraisalContents.NotesContent(parameter);
                if (sValue.Length > 0)
                {
                    myList.SetListValue(cList, sValue);
                }
            }
            else
            {

                parameter.Value = GetCheckBoxListValue(ref cList);
                string result = AppraisalContents.NotesContentSave(parameter);
            }
        }
        public static void CheckListB(ref CheckBoxList cList, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string column)
        {
            if (action == "Get")
            {
                string sValue = AppraisalDataAC.TextContentB(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column);
                if (sValue.Length > 0)
                {
                    myList.SetListValue(cList, sValue);
                }
            }
            else
            {
                string sValue = GetCheckBoxListValue(ref cList);
                string result = AppraisalDataAC.TextContentB(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, column, sValue);
            }
        }
        public static void CheckListB(ref CheckBoxList cList, string action, AppraisalComment parameter)
        {
            if (action == "Get")
            {
                string sValue = AppraisalContents.AppraisalTextBPA(parameter); //  AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column);
                if (sValue.Length > 0)
                {
                    myList.SetListValue(cList, sValue);
                }
            }
            else
            {
                string sValue = GetCheckBoxListValue(ref cList);
                string result = AppraisalContents.AppraisalTextBPASave(parameter); // AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column, sValue);
            }
        }
        private static string GetCheckBoxListValue(ref CheckBoxList cList)
        {
            string rVal = "";
            foreach (ListItem item in cList.Items)
            {
                rVal = rVal + (item.Selected ? "1" : "0");
            }
            return rVal;
        }
        public static void ListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataAC.ListContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalDataAC.ListContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, sValue);
            }
        }
        public static void RatingListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataAC.RatingListContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalDataAC.RatingListContent(userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, sValue);
            }
        }
        //public static void RatingListRate(ref RadioButtonList rList, string action, AppraisalComment parameter)
        //{

        //    if (action == "Get")
        //    {
        //        string sValue = AppraisalContents.RatingListRate(parameter);//  AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole);
        //        myList.SetListValue(rList, sValue);
        //    }
        //    else
        //    {
        //        parameter.Value = rList.SelectedValue;
        //        string result = AppraisalContents.RatingListRateSave(parameter);// AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole, sValue);
        //    }
        //}
        public static void RatingListContent(ref RadioButtonList rList, string action, AppraisalComment parameter)
        {

            if (action == "Get")
            {
                string sValue = AppraisalContents.RatingListContent(parameter);//  AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                parameter.Value = rList.SelectedValue;
                string result = AppraisalContents.RatingListContentSave(parameter);// AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole, sValue);
            }
        }

        public static void ListPermission(ref RadioButtonList rList, string action, AppraisalCommentSignOff parameter)
        {

            if (action == "Get")
            {
                string sValue = AppraisalSignOff.CheckViewPermission(parameter);//  AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                parameter.Value = rList.SelectedValue;
                string result = AppraisalSignOff.CheckViewPermissionSave(parameter);// AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole, sValue);
            }
        }
        public static void AutoNoticeSignOffAction(ref CheckBox chb, string action, AppraisalCommentSignOff parameter)
        {

            if (action == "Get")
            {
                string value = AppraisalSignOff.CheckAutoNotice(parameter);
                chb.Checked = value == "Auto" ? true : false;
            }
            else
            {
                parameter.Value = chb.Checked ? "Auto" : "Manual";
                string result = AppraisalSignOff.CheckAutoNoticeSave(parameter);// AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole, sValue);
            }
        }
        public static void ListPermission(ref RadioButtonList rList, string action, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string category, string area, string code)
        {

            if (action == "Get")
            {
                string sValue = AppraisalProcess.CheckPageViewPermission(action, userId, appraisalYear, appraisalSchool, appraisalSession, employeeId, category, area, code, WorkingProfile.UserRole);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalProcess.CheckPageViewPermission(action, userId, appraisalYear, appraisalSchool, appraisalSession, employeeId, category, area, code, WorkingProfile.UserRole, sValue);
            }
        }

        public static void DomainTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId)
        {
            var paramaters = AppraisalCompetencyCommentMethod.GetParameters(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, domainId, competencyId); //  new AppraisalComment()

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = AppraisalExecute.ValueofT<AppraisalCompetency>(paramaters, action);// AppraisalExecute.Comments(comm);
                                                                                                 // myText.Text = AppraisalExecute<AppraisalComment>.AnyValueofT(comm);// AppraisalExecute.Comments(comm);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                paramaters.Value = myText.Text;
                string result = AppraisalExecute.ValueofT<AppraisalCompetency>(paramaters, action);//AppraisalExecute.Comments(comm);
                                                                                                   // string result = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, value);
                                                                                                   //  string result = ITextContentDomain(action,userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, "",value);
            }


        }
        public static void DomainTextContent(ref HtmlTextArea myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId)
        {
            //  var parameter = CommonParameters.GetCompetencyParameter(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, itemCode, category, area, domainID, competencyID, "", "");
            var parameters = AppraisalCompetencyCommentMethod.GetParameters(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, domainId, competencyId); //  new AppraisalComment()


            if (action == "Get")
            {
                // myText.Value = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
                myText.Value = AppraisalExecute.ValueofT<AppraisalCompetency>(parameters, action);

                myCount.Value = (textLength - myText.Value.Length).ToString();
            }
            else
            {
                //  string result = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, myText.Value);
                parameters.Value = myText.Value;
                string result = AppraisalExecute.ValueofT<AppraisalCompetency>(parameters, action);

            }
        }
        public static void DomainListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId)
        {
            var parameter = CommonParameters.GetCompetencyParameter(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, domainId, competencyId, "", "");

            if (action == "Rate")
            {
                //   string sValue = AppraisalDataDomain.DomainListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
                string sValue = AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);
                AssemblingList.SetValue(rList, sValue); // myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                parameter.Rate = sValue;
                //  string result = AppraisalDataDomain.DomainListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, sValue);
                string result = AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);
            }
        }
        public static void DomainTextLog(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId, string actionRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataDomain.DomainTextContentLOG(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, domainId, competencyId, actionRole);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataDomain.DomainTextContentLOG(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, domainId, competencyId, actionRole, value);
            }
        }

        public static void DomainTextEnrichment(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId, string actionRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataDomain.DomainTextContentLOG(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, domainId, competencyId, actionRole);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataDomain.DomainTextContentLOG(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, domainId, competencyId, actionRole, value);
            }
        }
        public static void ObservationDate(ref HtmlInputText myDate, AppraisalDate parameter, string action)
        {

            if (action == "GetDate")
            {
                myDate.Value = AppraisalContents.ObservationDate(parameter);//    AppraisalExecute.ValueofT<AppraisalDate>(parameter);//  AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
            }
            else
            {
                string date = myDate.Value;
                parameter.Date = date;
                string result = AppraisalContents.ObservationDateSave(parameter);//  AppraisalExecute.ValueofT<AppraisalDate>(parameter);
                //   string result = AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, date);
            }
        }
        public static void ObservationDate(ref HtmlInputText myDate, string action, string type, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            AppraisalDate parameter = CommonParameters.GetDateParameter(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, "", ""); //  new AppraisalComment()


            if (action == "GetDate")
            {
                myDate.Value = AppraisalExecute.ValueofT<AppraisalDate>(parameter);//  AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);

            }
            else
            {
                string date = myDate.Value;
                parameter.Date = date;
                string result = AppraisalExecute.ValueofT<AppraisalDate>(parameter);
                //   string result = AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, date);
            }
        }
        public static void ObservationDate(ref HtmlInputText myDate, ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            AppraisalDate parameter = CommonParameters.GetDateParameter(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, "", ""); //  new AppraisalComment()

            if (action == "Get")
            {
                parameter.Operate = "GetDate";
                myDate.Value = AppraisalExecute.ValueofT<AppraisalDate>(parameter);//  AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                parameter.Operate = "GetText";
                myText.Text = AppraisalExecute.ValueofT<AppraisalDate>(parameter);
                //myText.Text = AppraisalDataObservation.ObservationDate("Text", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                //myDate.Value = AppraisalDataObservation.ObservationDate("Date", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myCount.Value = (textLength - myText.Text.Length).ToString();

            }
            else
            {
                parameter.Operate = "Save";
                string value = myText.Text;
                string date = myDate.Value;
                parameter.Date = date;
                parameter.Value = value;
                string result = AppraisalExecute.ValueofT<AppraisalDate>(parameter);
                //    string result = AppraisalDataObservation.ObservationDate("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, date, value);
            }
        }
        public static void ObservationList(ref GridView myDataView, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string domainId, string competencyId)
        {
            AppraisalObservation parameter = CommonParameters.GetObservationListParameter(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, domainId, competencyId, "", ""); //  new AppraisalComment()

            if (action == "Get")
            {
                // var gridData = BLL.AppraisalExecute<ObservationList>.AnyListofT(parameter); // BLL.AppraisalExecute.ApprList(parameter);
                var gridData = BLL.AppraisalExecute.ListofT<ObservationList>(parameter); // works// BLL.AppraisalExecute.ApprList(parameter);

                //  DataTable gridData = AppraisalDataObservation.ObservationList(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
            else
            {
                string check = myDataView.SelectedRow.DataItem.ToString();
                string value = myDataView.SelectedRow.DataItem.ToString();
                parameter.Check = check;
                parameter.Value = value;
                string result = AppraisalExecute.ValueofT<ObservationList>(parameter);
                //  string result = AppraisalDataObservation.ObservationList("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, check, value);
            }
        }

        public static string ObservationList(string action, string userId, string appraisalYear, string appraisalSchool, string employeeId, string appraisalSession, string category, string area, string itemCode, string domainId, string competencyId, string check, string value)
        {
            AppraisalObservation parameter = CommonParameters.GetObservationListParameter(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, itemCode, category, area, domainId, competencyId, check, value); //  new AppraisalComment()
            string result = AppraisalExecute.ValueofT<ObservationList>(parameter);
            //  string result = AppraisalDataObservation.ObservationList("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, check, value);
            return result;

        }
        public static void AgpWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            DataTable gridData = AppraisalDataAGP.AGPWorkingList(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }

        public static List<AppraisalCommentAGP> AGPWorkingTemplate( AppraisalComment parameter)
        {
            return AppraisalContentsAGP.AppraisalTextAGPList(parameter);//  AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);
         }
        public static void AGPWorkingTemplate(ref GridView myDataView, AppraisalComment parameter)
        {
            List<AppraisalCommentAGP> gridData = AppraisalContentsAGP.AppraisalTextAGPList(parameter);//  AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }
        public static void APPWorkingTemplate(ref GridView myDataView, AppraisalComment parameter)
        {
            List<AppraisalCommentAPP> gridData = AppraisalContentsAGP.AppraisalTextAPPList(parameter);//  AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }
        public static void IMPWorkingTemplate2(ref GridView myDataView, AppraisalComment parameter)
        {
            List<AppraisalIMP> gridData = AppraisalContentsAGP.AppraisalTextIMP2List(parameter);//  AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);

            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        public static void IMPWorkingTemplate5(ref GridView myDataView, AppraisalComment parameter)
        {
            List<AppraisalIMP5> gridData = AppraisalContentsAGP.AppraisalTextIMP5List(parameter);//  AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);

            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        public static void APPWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            DataTable gridData = AppraisalDataAPP.APPWorkingList(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        public static void IMPWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            DataTable gridData = AppraisalDataAIP.WorkingList(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }

        public static List<AppraisalDataAIP> AipWorkingTemplateDataSource(string action, string userId, string category, string area)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<AppraisalDataAIP>(action, userId, category, area);
            return AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);
        }

        public static void AipWorkingTemplate2(ref GridView myDataView, string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            DataTable gridData = AppraisalDataAIP.WorkingList2(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];

            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }



        public static List<AppraisalDataAIP> AipWorkingTemplate2DataSource(string action, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {
            AppraisalComment2 parameter = AppraisalIMP.GetParameters(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode);

            return AppraisalExecute.ListofT<AppraisalDataAIP>(parameter);
        }

        public static void LtoAssignmentData(string action, ref HtmlInputText myDateS, ref HtmlInputText myDateE, ref HtmlInputText month, ref TextBox subject, ref TextBox sapNo, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {


            if (action == "Get")
            {
                var parameter = new
                {
                    Operate = "Get",
                    UserID = userId,
                    Category = category,
                    Area = area,
                    Code = itemCode,
                    SchoolYear = appraisalYear,
                    SchoolCode = appraisalSchool,
                    EmployeeID = employeeId,
                    SessionID = appraisalSession
                };
                var assignmentData = AppraisalCommon.CommonList<LTOAssignment>("AppraisalContentsLTO", "AssignmentDataList", parameter)[0];
                // DataTable assignmentData = AppraisalDataLTO.AssignmentData("Get", userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];
                myDateS.Value = assignmentData.StartDate; // .Rows[0][1].ToString();
                myDateE.Value = assignmentData.EndDate;  // .Rows[0][2].ToString();
                month.Value = assignmentData.LengthMonth; //.Rows[0][3].ToString();
                subject.Text = assignmentData.Assignment; // .Rows[0][4].ToString();
                sapNo.Text = assignmentData.SAPNo; //.Rows[0][5].ToString();
            }
            else
            {
                var parameter = new
                {
                    Operate = "Save",
                    UserID = userId,
                    Category = category,
                    Area = area,
                    Code = itemCode,
                    SchoolYear = appraisalYear,
                    SchoolCode = appraisalSchool,
                    EmployeeID = employeeId,
                    SessionID = appraisalSession,
                    StartDate = myDateS.Value,
                    EndDate = myDateE.Value,
                    Month = month.Value,
                    Subject = subject.Text,

                };


                string result = AppraisalCommon.CommonValue<string>("AppraisalContentsLTO", "AssignmentDataListSave", parameter);
            }
        }
        public static void BpaInformation(string action, ref HtmlInputText reviewDateFrom, ref HtmlInputText reviewDateTo, ref HtmlInputText reviewDateMid, ref HtmlInputText reviewDateFinal, ref Label employeeName, ref Label employeeTitle, ref Label appraiserName, ref Label appraiserTitle, ref Label boardName, string category, string area, string itemCode, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId)
        {

            if (action == "Get")
            {
                DataTable informationData = AppraisalDataBPA.AssignmentData("Get", userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode).Tables[0];
                employeeName.Text = informationData.Rows[0][1].ToString();
                employeeTitle.Text = informationData.Rows[0][2].ToString();
                appraiserName.Text = informationData.Rows[0][3].ToString();
                appraiserTitle.Text = informationData.Rows[0][4].ToString();
                boardName.Text = informationData.Rows[0][5].ToString();
                reviewDateFrom.Value = informationData.Rows[0][6].ToString();
                reviewDateTo.Value = informationData.Rows[0][7].ToString();
                reviewDateMid.Value = informationData.Rows[0][8].ToString();
                reviewDateFinal.Value = informationData.Rows[0][9].ToString();

            }
            else
            {
                string dateFrom = reviewDateFrom.Value;
                string dateTo = reviewDateTo.Value;
                string dateMid = reviewDateMid.Value;
                string dateFinal = reviewDateFinal.Value;
                string result = AppraisalDataBPA.AssignmentData("Save", userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, category, area, itemCode, dateFrom, dateTo, dateMid, dateFinal);
            }
        }
        public static void AssemblingLtoCompetencyList(Page myPage, string category, string area, string itemCode, string userId)
        {
            var parameter = new { Operate = "List", UserID = userId, Category = category, Area = area, Code = itemCode};
            var compencylist = AppraisalCommon.CommonList<LTOCompetency>( "AppraisalContentsLTO", "LTOAppraisalCompetencyList", parameter);
           foreach (var item  in compencylist)
            {
                string title = item.Context; 
                string cId = item.CompetencyID;
                AddCompentencyList(myPage, cId, title, category, area, itemCode, userId);
            }

            //DataSet ds = new DataSet();
           // string schoolyear = WorkingAppraisee.AppraisalYear;
            //ds = AppraisalDataLTO.LTOAppraisalCompetencyList("Get", userId, category, area, itemCode, schoolYear);

            //foreach (DataRow row in ds.Tables[0].Rows)
            //{
            //    string title = row[3].ToString();
            //    string cId = row[1].ToString();
            //    AddCompentencyList(myPage, cId, title, category, area, itemCode, userId);
            //}

        }
        private static void AddCompentencyList(Page myPage, string compentencyId, string title, string category, string area, string itemCode, string userId)
        {
            HtmlGenericControl myDiv = (HtmlGenericControl)myPage.FindControl("Compentency" + compentencyId);
            Label myTitle = new Label();

            myTitle.Text = title;
            myTitle.CssClass = "CompentencyTitle";
            myDiv.Controls.Add(myTitle);
            HtmlGenericControl myUl = new HtmlGenericControl("ul");

            try
            {
                var parameter = new { Operate = "List", UserID = userId, Category = category, Area = area, Code = itemCode , Competency = compentencyId };
                var lookingforslist = AppraisalCommon.CommonList<LTOCompetency>("AppraisalContentsLTO", "LTOAppraisalLookingForList", parameter);

                //DataSet ds1 = new DataSet();

                //string schoolyear = WorkingAppraisee.AppraisalYear;
                //ds1 = AppraisalDataLTO.LTOAppraisalCompetencyList("Get", userId, category, area, itemCode, schoolyear, compentencyId);
                foreach (var item in lookingforslist)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    li.InnerText =  item.Context;
                    li.Attributes.Add("class", "LookforList");
                    myUl.Controls.Add(li);
                }
                myDiv.Controls.Add(myUl);

            }
            catch
            { }

        }


        public static void NotesContent(ref TextBox myText, string action, string userId, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeId, string apprRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataAC.NotesContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, apprRole);
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataAC.NotesContent(action, userId, appraisalYear, appraisalSchool, employeeId, appraisalSession, apprRole, value);
            }
        }
        public static void NotificationContent(ref TextBox myText, string action, string userId, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string subject)
        {

            if (action == "Get")
            {
                myText.Text = BLL.eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, "Notice");
            }
            else
            {
                string value = myText.Text;
                string result = BLL.eMailNotification.NotificationeTemplate(action, userId, category, noticeType, noticeArea, noticeGo, noticeFrom, "Notice", subject, value);
            }
        }
        public static string DomainTextEvidenceLog(object parameter)
        {
            // string SP = "dbo.EPA_Appr_AppraisalData_TextDomainEvidenceLog";

            return AppraisalContentsDomain.CommonValue<string>("TextDomainEvidenceLog", parameter);
        }

        public static string IsTwoSatisfactory(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "IsTwoSatisfactory", parameter);
        }
        public static string IsPrincipalInitialSTR(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "IsPrincipalInitialSTR", parameter);
        }
        public static string NotesContent(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "NotesContent", parameter);
        }
        public static string NotesContentSave(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "NotesContentSave", parameter);
        }
        public static string RatingListContent(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "RatingListContent", parameter);
        }
        public static string RatingListContentSave(object parameter)
        {
            return GeneralValue<string>("AppraisalContents", "RatingListContentSave", parameter);
        }

    }

}