using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using BLL;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using EPA2.Generic.LIB;
using System.Collections.Generic;
using ClassLibrary;
using DataAccess;

namespace EPA2
{
    public class ApplicationSetup : BaseData
    {
        public ApplicationSetup()
        {

        }
        public static void ObjList(ref GridView myDataView, string action, string userId, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.UserRoleManagement(action, userId, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string ObjList(ref GridView myDataView, string action, string userId, string category, string area, string ds, string roleCode, string roleName, string comments, string active)
        {

            string result = ApplicationSetupData.UserRoleManagement(action, userId, category, area, ds, roleCode, roleName, comments, active);
            return result;
        }
        public static void UsersList(ref GridView myDataView, string action, string userId, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.UsersManagement(action, userId, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string UsersList(string action, string userId, string category, string area, string ds, string usersId, string usersName, string userRole, string comments, string active)
        {

            string result = ApplicationSetupData.UsersManagement(action, userId, category, area, ds, usersId, usersName, userRole, comments, active);
            return result;
        }

        public static void MultipleSchoolUser(ref GridView myDataView, string action, string userId, string category, string area, string schoolyear)
        {

            DataTable gridData = ApplicationSetupData.UsersManagementMultipleSchool(action, userId, category, area, schoolyear).Tables[0];
            myDataView.DataSource = gridData;
            myDataView.DataBind();

        }

        public static void DistrictList(ref GridView myDataView, string action, string userId, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.SchoolDistrict(action, userId, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string DistrictList(ref GridView myDataView, string action, string userId, string category, string area, string ds, string roleCode, string roleName, string comments, string active)
        {

            string result = ApplicationSetupData.SchoolDistrict(action, userId, category, area, ds, roleCode, roleName, comments, active);
            return result;
        }

        public static void RegionList(ref GridView myDataView, string action, string userId, string category, string area)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.RegionAreaList(action, userId, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string RegionList(string action, string userId, string category, string area, string ds, string roleCode, string roleName, string comments, string active, string district, string superId, string officer)
        {

            string result = ApplicationSetupData.RegionAreaList(action, userId, category, area, ds, roleCode, roleName, comments, active, district, superId, officer);
            return result;
        }
        public static void SchoolList(ref GridView myDataView, string action, string userId, string category, string area)
        {
            
            if (action == "Get")
            { var parameter = new { Operate = action, UserID = userId, Category = category, Area = area };
               var gridData = ApplicationSetup.GeneralList<SchoolList>("AppraisalSetup","Schools", parameter);// Data.SchoolList(action, userId, category, area).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static string SchoolList(string action, string userId, string category, string area, string ds, string schoolCode, string schoolName, string comments, string active, string district, string header, string supervisor)
        {
            var parameter = new { Operate = action, UserID = userId, Category = category, Area = area,IDs = ds,Code =schoolCode,Name = schoolName,Comments = comments,Active =active ,District = district,Header = header,AreaCode = supervisor,Panel ="1",TPA ="1",PPA ="1"};
            return ApplicationSetup.GeneralValue<string>("AppraisalSetup", "SchoolInformationSave", parameter);//  ApplicationSetupData.SchoolInformation(action, userId, category, area, ds, schoolCode, schoolName, comments, active, district, header, supervisor, "1", "1", "1");
           
        }
     
        public static void CategoryList(ref GridView myDataView, string action, string userId)
        {

            if (action == "Get")
            {
                DataTable gridData = ApplicationSetupData.Category(action, userId).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }

  
        public static List<DomainList> DomainListDataSource(string action, string userId, string category, string area)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<DomainList>(action, userId, category, area);
            return BLL.AppraisalExecute.ListofT<DomainList>(parameter);
        }
        public static string DomainListDataSave(string action, string userId, string category, string area, string ids)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<DomainList>(action, userId, category, area, ids);

            var result = BLL.AppraisalExecute.ValueofT<DomainList>(parameter, action);  
            return result;
        }
        public static string DomainListDataSave(string action, string userId, string category, string area, string ids, string code, string name, string comments, int active)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<DomainList>(action, userId, category, area, ids, code, name, comments, active);

            var result = BLL.AppraisalExecute.ValueofT<DomainList>(parameter, action);  
            return result;
        }
        public static void DomainListOld(ref GridView myDataView, string action, string userId, string category, string area)
        {

            IRepository<Domain2, int> repository = new GenericDomain2();
            IList<Domain2> mylsit = repository.GetListItems(action, userId, category, area);

            DataTable gridData = ApplicationSetupData.Domain(action, userId, category, area).Tables[0];
            myDataView.DataSource = gridData;// gridData;//
            myDataView.DataBind();
        }

        public static void CompetencyList(ref GridView myDataView, string action, string userId, string category, string area)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<ClassLibrary.CompetencyList>(action, userId, category, area);

            if (action == "AddNew")
            {
                parameter.IDs = "0";
                string result = BLL.AppraisalExecute.ValueofT<CompetencyList>(parameter, action);
                parameter.Operate = "Get";
            }
            // IRepository<Competency2, int> repository = new GenericCompetency2();
            // IList<Competency2> mylsit = repository.GetListItems(action, userID, category, area);

            // SetupListParameter parameter = CommonParameters.GetSetupListParameters(action, userID, category, area, "", "", "", "", 0, "");
            var gridData = BLL.AppraisalExecute.ListofT<ClassLibrary.CompetencyList>(parameter, action); // BLL.AppraisalExecute.ApprList(parameter);

            //  DataTable gridData = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];
            myDataView.DataSource = gridData; //gridData;
            myDataView.DataBind();

        }
        public static string CompetencyList(string action, string userId, string category, string area, string ids, string code, string name, string comments, int active, string epa, string ntp, string lto)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<CompetencyList>(action, userId, category, area, ids, code, name, comments, active, "", epa, ntp, lto);

            var result = BLL.AppraisalExecute.ValueofT<CompetencyList>(parameter, action); // BLL.AppraisalExecute.ApprList(parameter);
            return result;
        }
        public static void CompetencyList(ref GridView myDataView, string action, string userId, string category, string area, string lookfor)
        {
            // IRepository<Competency3, int> repository = new GenericCompetency3();
            //  IList<Competency3> mylsit = repository.GetListItems(action, userID, category, area);

            SetupListParameter parameter = CommonParameters.GetSetupListParameters<ClassLibrary.CompetencyList>("LookFors", userId, category, area, "", "", "", "", 0, "");
            var gridData = BLL.AppraisalExecute.ListofT<ClassLibrary.CompetencyList>(parameter, action); // BLL.AppraisalExecute.ApprList(parameter);

            //  DataTable gridData = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];
            myDataView.DataSource = gridData; //gridData;
            myDataView.DataBind();

        }
        public static void LookForsList(ref GridView myDataView, string action, string userId, string category, string area, string competencyId)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<LookForsList>(action, userId, category, area, "0", "", "", "", 0, competencyId);

            if (action == "AddNew")
            {
                string result = BLL.AppraisalExecute.ValueofT<LookForsList>(parameter, action);
                parameter.Operate = "Get";
            }

            // IRepository<Lookfors2, int> repository = new GenericLookfors2();
            // IList<Lookfors2> mylsit = repository.GetListItems(action, userID, category, area, competencyID);

            //  SetupListParameter parameter = CommonParameters.GetSetupListParameters<LookForsList>(action, userID, category, area, competencyID);

            var gridData = BLL.AppraisalExecute.ListofT<LookForsList>(parameter); // BLL.AppraisalExecute.ApprList(parameter);

            //  DataTable gridData = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];
            myDataView.DataSource = gridData; //gridData;
            myDataView.DataBind();
        }
        public static string LookForsList(string action, string userId, string category, string area, string competencyId, string ids, string code, string name, string comments, int active)
        {
            SetupListParameter parameter = CommonParameters.GetSetupListParameters<LookForsList>(action, userId, category, area, ids, code, name, comments, active, competencyId);


            var result = BLL.AppraisalExecute.ValueofT<LookForsList>(parameter, action); // BLL.AppraisalExecute.ApprList(parameter);
            return result;
        }
        public static void CommentBankList(ref GridView myDataView, string action, string userId, string category, string area, string type, string owner)
        {
            var parameter = new { Operate = action, UserID = userId, Category = category, Area = area, Type = type, Owner = owner };
            var gridData = AppraisalCommon.CommonList<CommentBank>("CommentsBank", "CommentsBankList", parameter);// ApplicationSetup.CommentBankList( Data.CommentsBank(action, userId, category, area, type, owner).Tables[0];
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

        public static void Statements(ref TextBox myText, ref TextBox myTopic, ref HtmlInputText startDate, ref HtmlInputText endDate, string schoolyear, string schoolcode, string statementType, string area, string action, string userId, string ds)
        {
            if (action == "New")
            {
                string result = ApplicationSetupData.Statements(action, userId, schoolyear, schoolcode, statementType, area);
            }
            else if (action == "Get")
            {
                DataTable dt = ApplicationSetupData.Statements(action, userId, schoolyear, schoolcode, statementType, area, ds).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    myText.Text = dt.Rows[0][1].ToString();
                    myTopic.Text = dt.Rows[0][2].ToString();
                    startDate.Value = dt.Rows[0][3].ToString();
                    endDate.Value = dt.Rows[0][4].ToString();
                }
            }
            else
            {
                string statement = myText.Text;
                string topic = myTopic.Text;
                string dateStart = startDate.Value;
                string dateEnd = endDate.Value;

                string result = ApplicationSetupData.Statements(action, userId, schoolyear, schoolcode, statementType, area, ds, statement, topic, dateStart, dateEnd);
            }
        }


        public static List<SchoolList> UsersManagementMultipleSchool(string operate, string userID, string category, string area, string schoolyear)
        {
           // string sp = "dbo.EPA_sys_ApplicationUsersMultipleSchool @Operate,@UserID,@Category,@Area,@SchoolYear";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                SchoolYear = schoolyear
            };
            return AppraisalSetup.CommonList<SchoolList>("MultipleSchoolUser", parameter);// GeneralList<SchoolList>(sp, parameter); 

           
        }
        public static string UsersManagementMultipleSchool(string operate, string userID, string category, string area, string schoolyear, string IDs, string principalID, string schoolcode, string comments, string active)
        {
           // string sp = "dbo.EPA_sys_ApplicationUsersMultipleSchool @Operate,@UserID,@Category,@Area,@SchoolYear,@SchoolCode,@IDs,@PrincipalID,@Comments,@Active";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                SchoolYear = schoolyear,
                SchoolCode =schoolcode,
                IDs = IDs,
                PrincipalID = principalID,
                Comments = comments,
                Active = active
            };
            return     AppraisalSetup.CommonValue<string>("MultipleSchoolUserSave", parameter);  //GeneralValue<string>(sp, parameter);
 
        }
        public static List<T> UserRoleManagement<T>(string operate, string userID, string category, string area)
        {
          //  string sp = "dbo.EPA_sys_ApplicationRole @Operate,@UserID,@Category,@Area";

            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area 
            };
            return AppraisalSetup.CommonList<T>("AppRole", parameter); // GeneralList<T>(sp, parameter);
        
        }
        public static string UserRoleManagement(string operate, string userID, string category, string area, string IDs, string roleCode, string roleName, string comments, string active)
        {
          //  string sp = "dbo.EPA_sys_ApplicationRole @Operate,@UserID,@Category,@Area,@IDs,@RoleCode,@RoleName,@Comments,@Active";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                RoleCode = roleCode,
                RoleName = roleName,
                Comments = comments,
                Active = active
            };

            return AppraisalSetup.CommonValue<string>("AppRoleSave", parameter); // GeneralValue<string>(sp, parameter);
        }


        public static List<T> UsersManagement<T>(string operate, string userID, string category, string area)
        {
          //  string sp = "dbo.EPA_sys_ApplicationUsers @Operate,@UserID,@Category,@Area";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area
            };
            return AppraisalSetup.CommonList<T>("AppUser", parameter); // GeneralList<T>(sp, parameter);
        }
        public static string UsersManagement(string operate, string userID, string category, string area, string IDs, string userCode, string userName, string userRole, string comments, string active)
        {
            string sp = "dbo.EPA_sys_ApplicationUsers @Operate,@UserID,@Category,@Area @IDs,@UserCode,@UserName,@Comments,@Active,@UserRole";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                UserCode =userCode,
                UserName =userName,
                UserRole =userRole,
                Comments =  comments,
                Active =active
            };

            return AppraisalSetup.CommonValue<string>("AppUserSave", parameter); // GeneralValue<string>(sp, parameter);
        }
        public static string CommentsBankSave(string operate, string userID, string category, string area, string type, string owner, string IDs, string domainID, string shared, string comments, string active)
        {
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                Type = type,
                Owner =owner,
                IDs = IDs,
                DomainID = domainID,
                Shared = shared,
                Comments = comments,
                Active = active
            };

            return CommentsBank.CommonValue<string>("CommentsBankSave", parameter);
        }

        public static List<T> SchoolDistrict<T>(string operate, string userID, string category, string area)
        {
            // string SP = "dbo.EPA_ORG_DistrictList  @Operate,@UserID,@Category,@Area";
            var parameter = new
            {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area
            };
            return AppraisalSetup.CommonList<T>("District", parameter);
          }
        public static string SchoolDistrict(string operate, string userID, string category, string area, string IDs, string districtCode, string districtName, string comments, string active)
        {
          //  string SP = "dbo.EPA_ORG_DistrictList @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                Code =districtCode,
                Name = districtName,
                Comments = comments,
                Avtive = active
            };
            return AppraisalSetup.CommonValue<string>("lDistrictSave", parameter);

        }
        public static List<T> RegionAreaList<T>(string operate, string userID, string category, string area)
        {
          //  string SP = "dbo.EPA_ORG_RegionAreaList @Operate,@UserID,@Category,@Area";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area 
            };
            return AppraisalSetup.CommonList<T>("RegionArea", parameter);

        }
        public static string RegionAreaList(string operate, string userID, string category, string area, string IDs, string regionCode, string regionName, string comments, string active, string district, string superID, string officer)
        {
            //string SP = "dbo.EPA_ORG_RegionAreaList@Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@District,@SuperID,@Officer";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                Code = regionCode,
                Name = regionName,
                Comments = comments,
                Avtive = active,
                District =district,
                SuperID = superID,
                Officer = officer
            };
            return AppraisalSetup.CommonValue<string>("RegionAreaSave", parameter);

        }
        public static List<T> SchoolList<T>(string operate, string userID, string category, string area)
        {
            //  string SP = "dbo.EPA_ORG_SchoolsList @Operate,@UserID,@Category,@Area";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area 
            };
            return AppraisalSetup.CommonList<T>("Schools", parameter);

        }
        public static List<T> SchoolInformation<T>(string operate, string userID, string category, string area, string IDs)
        {
          //  string SP = "dbo.EPA_ORG_SchoolsList @Operate,@UserID,@Category,@Area,@IDs";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs
            };
            return AppraisalSetup.CommonList<T>("SchoolInformation", parameter);

        }
        public static string SchoolInformation(string operate, string userID, string category, string area, string IDs, string code)
        {
          //  string SP = "dbo.EPA_ORG_SchoolsList @Operate,@UserID,@Category,@Area,@IDs,@Code";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                Code = code 
            };
            return AppraisalSetup.CommonValue<string>("SchoolInfomation2", parameter);
        }
        public static string SchoolInformation(string operate, string userID, string category, string area, string IDs, string schoolCode, string schoolName, string comments, string active, string district, string header, string areacode, string panel, string tpa, string ppa)
        {
          //  string SP = "dbo.EPA_ORG_SchoolsList @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@District,@Header,@AreaCode,@Panel,@TPA,@PPA";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                Code = schoolCode,
                Name = schoolName,
                Comments = comments,
                Avtive = active,
                District = district,
                Header = header,
                AreaCode =areacode,
                Panel = panel,
                TPA = tpa,
                PPA = ppa

            };
            return AppraisalSetup.CommonValue<string>("SchoolInfomationSave", parameter);

        }
        public static void SystemItems(ref GridView myDataView, string action, string userId, string category, string area)
        {

            if (action == "Get")
            {
                var parameter = new SystemItems { Operate = action, UserID = userId, Category = category, Area = area };
                var gridData = GeneralList<SystemItems>("AppraisalSetup", "SetupList" + area, parameter); //   ApplicationSetupData.SystemItems(action, userId, category, itemType).Tables[0];
                myDataView.DataSource = gridData;
                myDataView.DataBind();
            }
        }
        public static List<T> SystemItems<T>(string operate, string userID, string category, string area)
        {
          //  string SP = "dbo.EPA_sys_SystemItemsList @Operate,@UserID,@Category,@ItemType";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area 
            };
            return AppraisalSetup.CommonList<T>("SystemItems", parameter);

        }
        public static string SystemItems(string operate, string userID, string category, string area, string IDs, string code, string name, string comments, string active, string steps, string keyPoint)
        {
            //  string SP = "dbo.EPA_sys_SystemItemsList @Operate,@UserID,@Category,@Area,@IDs,@Code,@Name,@Comments,@Active,@Orders,@KeyPoint";
            var parameter = new {
                Operate = operate,
                UserID = userID,
                Category = category,
                Area = area,
                IDs = IDs,
                Code = code,
                Name = name,
                Comments = comments,
                Avtive = active,
                Orders  =steps,
                KeyPoint = keyPoint
            };
            return GeneralValue<string>("AppraisalSetup", "SetupSave" + area, parameter);

        }
    }

}