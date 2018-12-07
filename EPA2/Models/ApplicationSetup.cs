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
using System.Collections.Generic;

namespace EPA2
{
    public class ApplicationSetup : System.Web.UI.Page
    {
        public ApplicationSetup()
        {

        }
        public static void OBJList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.UserRoleManagement(action, userID, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string OBJList(ref GridView myDataView, string action, string userID, string category, string area, string IDs, string roleCode, string roleName, string comments, string active)
        {

            string result = ApplicationSetupData.UserRoleManagement(action, userID, category, area, IDs, roleCode, roleName, comments, active);
            return result;
        }
        public static void UsersList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.UsersManagement(action, userID, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string UsersList(string action, string userID, string category, string area, string IDs, string usersID, string usersName, string userRole, string comments, string active)
        {

            string result = ApplicationSetupData.UsersManagement(action, userID, category, area, IDs, usersID, usersName, userRole, comments, active);
            return result;
        }

        public static void MultipleSchoolUser(ref GridView myDataView, string action, string userID, string category, string area, string schoolyear)
        {

            DataTable gridData = ApplicationSetupData.UsersManagementMultipleSchool(action, userID, category, area, schoolyear).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }

        public static void DistrictList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.SchoolDistrict(action, userID, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string DistrictList(ref GridView myDataView, string action, string userID, string category, string area, string IDs, string roleCode, string roleName, string comments, string active)
        {

            string result = ApplicationSetupData.SchoolDistrict(action, userID, category, area, IDs, roleCode, roleName, comments, active);
            return result;
        }

        public static void RegionList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.RegionAreaList(action, userID, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string RegionList(string action, string userID, string category, string area, string IDs, string roleCode, string roleName, string comments, string active, string district, string superID, string officer)
        {

            string result = ApplicationSetupData.RegionAreaList(action, userID, category, area, IDs, roleCode, roleName, comments, active, district, superID, officer);
            return result;
        }
        public static void SchoolList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.SchoolList(action, userID, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string SchoolList(string action, string userID, string category, string area, string IDs, string schoolCode, string schoolName, string comments, string active, string district, string header, string supervisor)
        {

            string result = ApplicationSetupData.SchoolInformation(action, userID, category, area, IDs, schoolCode, schoolName, comments, active, district, header, supervisor, "1", "1", "1");
            return result;
        }
        public static void SystemItems(ref GridView myDataView, string action, string userID, string category, string ItemType)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.SystemItems(action, userID, category, ItemType).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static void CategoryList(ref GridView myDataView, string action, string userID)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.Category(action, userID).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }

        public static void DomainList(ref GridView myDataView, string action, string userID, string category, string area)
        {

            if (action == "Get")
            {
                IRepository<Domain2,int> repository = new GenericDomain2();
                
               IList<Domain2> mylsit = repository.GetListItems(action,userID,category,area);


               //   DataTable gridData = ApplicationSetupData.Domain(action, userID, category, area).Tables[0];
                myDataView.DataSource = mylsit;// gridData;//
                myDataView.DataBind();
            }
        }

        public static void CompetencyList(ref GridView myDataView, string action, string userID, string category, string area)
        {
            IRepository<Competency2, int> repository = new GenericCompetency2();
            IList<Competency2> mylsit = repository.GetListItems(action, userID, category, area);

            //  DataTable gridData = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];
            myDataView.DataSource = mylsit; //gridData;
            myDataView.DataBind();

        }
        public static void CompetencyList(ref GridView myDataView, string action, string userID, string category, string area,string lookfor)
        {
            IRepository<Competency3, int> repository = new GenericCompetency3();
            IList<Competency3> mylsit = repository.GetListItems(action, userID, category, area);

            //  DataTable gridData = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];
            myDataView.DataSource = mylsit; //gridData;
            myDataView.DataBind();

        }
        public static void LookForsList(ref GridView myDataView, string action, string userID, string category, string area, string competencyID)
        {
            IRepository<Lookfors2, int> repository = new GenericLookfors2();
            IList<Lookfors2> mylsit = repository.GetListItems(action, userID, category, area, competencyID);

           // DataTable gridData = ApplicationSetupData.LookFors(action, userID, category, area, competencyID).Tables[0];
            myDataView.DataSource = mylsit;//  gridData;
            myDataView.DataBind();

        }
        public static void CommentBankList(ref GridView myDataView, string action, string userID, string category, string area, string type, string owner)
        {
            DataTable gridData = ApplicationSetupData.CommentsBank(action, userID, category, area, type, owner).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();
        }
        /*
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

               public static void DomainTextContent(ref TextBox myText, ref HtmlInputText myCount, string action, int textLength, string category, string area, string itemCode, string userID, string appraisalYear, string appraisalSchool, string appraisalSession, string employeeID, string domainID, string competencyID)
               {

                   if (action == "Get")
                   {
                       myText.Text = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
                       myCount.Value = (textLength - myText.Text.Length).ToString();
                   }
                   else
                   {
                       string value = myText.Text;
                       string result = AppraisalDataDomain.DomainTextContent(userID, appraisalYear, appraisalSchool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID, value);
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
             */

        public static void Statements(ref TextBox myText, ref TextBox myTopic, ref HtmlInputText startDate, ref HtmlInputText endDate, string schoolyear, string schoolcode, string statementType, string area, string action, string userID, string IDs)
        {
            if (action == "New")
            {
                string result = ApplicationSetupData.Statements(action, userID, schoolyear, schoolcode, statementType, area);
            }
            else if (action == "Get" )
            {
                DataTable DT = ApplicationSetupData.Statements(action, userID, schoolyear, schoolcode, statementType, area, IDs).Tables[0];
                if (DT.Rows.Count > 0)
                {
                    myText.Text = DT.Rows[0][1].ToString();
                    myTopic.Text = DT.Rows[0][2].ToString();
                    startDate.Value = DT.Rows[0][3].ToString();
                    endDate.Value = DT.Rows[0][4].ToString();
                }
            }
            else
            {
                string statement = myText.Text;
                string topic = myTopic.Text;
                string dateStart = startDate.Value;
                string dateEnd = endDate.Value;

                string result = ApplicationSetupData.Statements(action, userID, schoolyear, schoolcode, statementType, area, IDs, statement, topic, dateStart, dateEnd);
            }
        }

    }

}