using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using DataAccess;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using EPA2.Generic.LIB;

namespace EPA2
{
    public class AppraisalData : System.Web.UI.Page
    {
        public AppraisalData()
        {

        }
        public static void BuildingTextTitle(ref Label myTitle, string type, string userID, string category, string area, string code)
        {

            myTitle.Text = TitleContext.Content(type, userID, category, area, code);
            if (myTitle.Text.Length == 0)
            {
                myTitle.Visible = false;
            }

        }
        public static void BuildingTextMessage(ref Label myMessage, string type, string userID, string category, string area, string code)
        {

            myMessage.Text = MessageContext.Content(type, userID, category, area, code);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = true;// false;
            }

        }
        public static void BuildingTextMessage(ref TextBox myMessage, string type, string userID, string category, string area, string code,string userRole)
        {

            myMessage.Text = MessageContext.Message(type, userID, category, area, code,userRole);
            if (myMessage.Text.Length == 0)
            {
                myMessage.Visible = true;// false;
            }

        }
        public static void STRLabelContent(ref Label myLabel, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                myLabel.Text = AppraisalDataStrategy.LabelContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
            }

        }
        public static void STRTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            string column = myText.ID.Substring(8, 1);
            if (action == "Get")
            {
                myText.Text = AppraisalDataStrategy.TextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataStrategy.TextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column, value);
            }
        }
        public static void STRCheckBoxContent(ref CheckBox myCheck, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                string value = AppraisalDataStrategy.CheckContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                if (value == "1")
                { myCheck.Checked = true; }
                else
                { myCheck.Checked = false; }
            }
            else
            {
                string value = myCheck.Checked ? "1" : "0";
                string result = AppraisalDataStrategy.CheckContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, value);
            }
        }
        public static void TextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            if (action == "Get" || action == "RollOver")
            {   
                   myText.Text = AppraisalDataAC.TextContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            { 
                 string value = myText.Text;
               string result = AppraisalDataAC.TextContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, value);
            }
        }
        public static void ITextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            AppraisalNotes appraisalnote = new AppraisalNotes()
            {
                Action = "Get",
                UserID = userID,
                Category = category,
                Area = area,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalSchool,
                SessionID = appraisalSession,
                ItemCode = itemCode,
                EmployeeID = employeeID
            };

            IAppraisal<AppraisalNotes, string> repository = Factory.Get<IAppraisalNote>(); // new IAppraisalNote();

            if (action == "Get" || action == "RollOver")
            {
                myText.Text = repository.GetResult(employeeID, appraisalnote,action);
                 myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                appraisalnote.Comments = myText.Text;
                string result = repository.GetResult(employeeID, appraisalnote,action);
             }
        }
        public static string ITextContentDomain(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string rate, string Value)
        {
            AppraisalNotes2 apprnote = new AppraisalNotes2()
            {
                Action = action,
                UserID = userID,
                Category = category,
                Area = area,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                SessionID = appraisalSession,
                ItemCode = itemCode,
                EmployeeID = employeeID,
                DomainID =domainID,
                CompetencyID = competencyID,
                Rate =rate,
                Comments =Value
            };

            IAppraisal<AppraisalNotes2, string> repository = Factory.Get<IAppraisalNote2>(); // new IAppraisalNote();
            string rValue = repository.GetResult(employeeID, apprnote,action);
            return rValue  ;
        }
        public static void TextContentB(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string column)
        {

            if (action == "Get" || action == "RollOver")
            {

                myText.Text = AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column, value);
            }
        }
        public static void DateTextContent(ref TextBox myText, ref HtmlInputText myDate, ref HtmlInputText myCount, int textLength, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            if (action == "Get")
            {
                DataTable DT = new DataTable();
                DT = AppraisalDataAC.TextDateContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myText.Text = DT.Rows[0]["MeetingContent"].ToString();
                myDate.Value = DT.Rows[0]["MeetingDate"].ToString();
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string vdate = myDate.Value;
                string result = AppraisalDataAC.TextDateContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, value, vdate);
            }
        }

        public static void CheckList(ref CheckBoxList cList, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataAC.NotesContent("Chose", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                if (sValue.Length > 0)
                {
                    myList.SetListValue(cList, sValue);
                }
            }
            else
            {
                string sValue = getCheckBoxListValue(ref cList);
                string result = AppraisalDataAC.NotesContent("Chose", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, sValue);
            }
        }
        public static void CheckListB(ref CheckBoxList cList, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string column)
        {
            if (action == "Get")
            {
                string sValue = AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column);
                if (sValue.Length > 0)
                {
                    myList.SetListValue(cList, sValue);
                }
            }
            else
            {
                string sValue = getCheckBoxListValue(ref cList);
                string result = AppraisalDataAC.TextContentB(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, column, sValue);
            }
        }
        private static string getCheckBoxListValue(ref CheckBoxList cList)
        {
            string rVal = "";
            foreach (ListItem _item in cList.Items)
            {
                rVal = rVal + (_item.Selected ? "1" : "0");
            }
            return rVal;
        }
        public static void ListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataAC.ListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalDataAC.ListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, sValue);
            }
        }
        public static void RatingListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataAC.RatingListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalDataAC.RatingListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, sValue);
            }
        }
        public static void ListPermission(ref RadioButtonList rList, string action, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string category, string area, string code)
        {

            if (action == "Get")
            {
                string sValue = AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalProcess.CheckPageViewPermission(action, userID, appraisalYear, appraisalSchool, appraisalSession, employeeID, category, area, code, WorkingProfile.UserRole, sValue);
            }
        }
        public static void DomainTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID)
        {

            if (action == "Get")
            {
              //  myText.Text = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);

                 myText.Text = ITextContentDomain(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID,"","");
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
              // string result = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, value);
                string result = ITextContentDomain(action,userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, "",value);
            }
        }
        public static void DomainTextContent(ref HtmlTextArea myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID)
        {

            if (action == "Get")
            {
                myText.Value = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
                myCount.Value = (textLength - myText.Value.Length).ToString();
            }
            else
            {
                string value = myText.Value;
                string result = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, value);
            }
        }
        public static void DomainListContent(ref RadioButtonList rList, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID)
        {

            if (action == "Get")
            {
                string sValue = AppraisalDataDomain.DomainListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
                myList.SetListValue(rList, sValue);
            }
            else
            {
                string sValue = rList.SelectedValue;
                string result = AppraisalDataDomain.DomainListContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, sValue);
            }
        }
        public static void DomainTextLOG(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID, string actionRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole, value);
            }
        }

        public static void DomainTextEnrichment(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID, string actionRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole);
                myCount.Value = (textLength - myText.Text.Length).ToString();
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataDomain.DomainTextContentLOG(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, actionRole, value);
            }
        }
        public static void ObservationDate(ref HtmlInputText myDate, string action, string type, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                myDate.Value = AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);

            }
            else
            {
                string date = myDate.Value;
                string result = AppraisalDataObservation.ObservationDate(type, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, date);
            }
        }
        public static void ObservationDate(ref HtmlInputText myDate, ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataObservation.ObservationDate("Text", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);
                myCount.Value = (textLength - myText.Text.Length).ToString();
                myDate.Value = AppraisalDataObservation.ObservationDate("Date", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode);

            }
            else
            {
                string value = myText.Text;
                string date = myDate.Value;
                string result = AppraisalDataObservation.ObservationDate("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, date, value);
            }
        }
        public static void ObservationList(ref GridView myDataView, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID)
        {

            if (action == "Get")
            {
                DataTable gridData = AppraisalDataObservation.ObservationList(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
            else
            {
                string check = myDataView.SelectedRow.DataItem.ToString();
                string value = myDataView.SelectedRow.DataItem.ToString();

                string result = AppraisalDataObservation.ObservationList("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, check, value);
            }
        }
        public static void AGPWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            DataTable gridData = AppraisalDataAGP.AGPWorkingList(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }
        public static void APPWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            DataTable gridData = AppraisalDataAPP.APPWorkingList(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        public static void AIPWorkingTemplate(ref GridView myDataView, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            DataTable gridData = AppraisalDataAIP.WorkingList(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }
        public static void AIPWorkingTemplate2(ref GridView myDataView, string action, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            DataTable gridData = AppraisalDataAIP.WorkingList2(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        public static void LTOAssignmentData(string action, ref HtmlInputText myDateS, ref HtmlInputText myDateE, ref HtmlInputText Month, ref TextBox subject, ref TextBox sapNo, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {
            if (action == "Get")
            {
                DataTable assignmentData = AppraisalDataLTO.AssignmentData("Get", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
                myDateS.Value = assignmentData.Rows[0][1].ToString();
                myDateE.Value = assignmentData.Rows[0][2].ToString();
                Month.Value = assignmentData.Rows[0][3].ToString();
                subject.Text = assignmentData.Rows[0][4].ToString();
                sapNo.Text = assignmentData.Rows[0][5].ToString();
            }
            else
            {
                string dateS = myDateS.Value;
                string dateE = myDateE.Value;
                string month = Month.Value;
                string Subject = subject.Text;
                string result = AppraisalDataLTO.AssignmentData("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, dateS, dateE, month, Subject);
            }
        }
        public static void BPAInformation(string action, ref HtmlInputText reviewDateFrom, ref HtmlInputText reviewDateTo, ref HtmlInputText reviewDateMid, ref HtmlInputText reviewDateFinal, ref Label employeeName, ref Label employeeTitle, ref Label appraiserName, ref Label appraiserTitle, ref Label boardName, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID)
        {

            if (action == "Get")
            {
                DataTable InformationData = AppraisalDataBPA.AssignmentData("Get", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode).Tables[0];
                employeeName.Text = InformationData.Rows[0][1].ToString();
                employeeTitle.Text = InformationData.Rows[0][2].ToString();
                appraiserName.Text = InformationData.Rows[0][3].ToString();
                appraiserTitle.Text = InformationData.Rows[0][4].ToString();
                boardName.Text = InformationData.Rows[0][5].ToString();
                reviewDateFrom.Value = InformationData.Rows[0][6].ToString();
                reviewDateTo.Value = InformationData.Rows[0][7].ToString();
                reviewDateMid.Value = InformationData.Rows[0][8].ToString();
                reviewDateFinal.Value = InformationData.Rows[0][9].ToString();

            }
            else
            {
                string dateFrom = reviewDateFrom.Value;
                string dateTo = reviewDateTo.Value;
                string dateMid = reviewDateMid.Value;
                string dateFinal = reviewDateFinal.Value;
                string result = AppraisalDataBPA.AssignmentData("Save", userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, dateFrom, dateTo, dateMid, dateFinal);
            }
        }
        public static void AssemblingLTOCompetencyList(Page myPage, string category, string area, string itemCode, string userID)
        {

            DataSet ds = new DataSet();
            string _schoolyear = WorkingAppraisee.AppraisalYear;
            ds = AppraisalDataLTO.LTOAppraisalCompetencyList("Get", userID, category, area, itemCode, _schoolyear);

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                string title = row[3].ToString();
                string cID = row[1].ToString();
                AddCompentencyList(myPage, cID, title, category, area, itemCode, userID);
            }
        }
        private static void AddCompentencyList(Page myPage, string compentencyID, string title, string category, string area, string itemCode, string userID)
        {
            HtmlGenericControl myDIV = (HtmlGenericControl)myPage.FindControl("Compentency" + compentencyID);
            Label myTitle = new Label();

            myTitle.Text = title;
            myTitle.CssClass = "CompentencyTitle";
            myDIV.Controls.Add(myTitle);
            HtmlGenericControl myUL = new HtmlGenericControl("ul");

            try
            {
                DataSet ds1 = new DataSet();

                string _schoolyear = WorkingAppraisee.AppraisalYear;
                ds1 = AppraisalDataLTO.LTOAppraisalCompetencyList("Get", userID, category, area, itemCode, _schoolyear, compentencyID);
                foreach (DataRow row in ds1.Tables[0].Rows)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    li.InnerText = row[3].ToString();
                    li.Attributes.Add("class", "LookforList");
                    myUL.Controls.Add(li);
                }
                myDIV.Controls.Add(myUL);

            }
            catch
            { }

        }


        public static void NotesContent(ref TextBox myText, string action, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string apprRole)
        {

            if (action == "Get")
            {
                myText.Text = AppraisalDataAC.NotesContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, apprRole);
            }
            else
            {
                string value = myText.Text;
                string result = AppraisalDataAC.NotesContent(action, userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, apprRole, value);
            }
        }
        public static void NotificationContent(ref TextBox myText, string action, string userID, string category, string noticeType, string noticeArea, string noticeGo, string noticeFrom, string subject)
        {

            if (action == "Get")
            {
                myText.Text = eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, "Notice");
            }
            else
            {
                string value = myText.Text;
                string result = eMailNotification.NotificationeTemplate(action, userID, category, noticeType, noticeArea, noticeGo, noticeFrom, "Notice", subject, value);
            }
        }
    }

}