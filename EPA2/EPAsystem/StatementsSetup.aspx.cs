using BLL;
using ClassLibrary;
using DataAccess;
using System;
using System.Web.UI;
//using System.IO;
//using System.Text;
namespace EPA2.EPAsystem
{
    public partial class StatementsSetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {

                SetPageAttribution();
                GetLastStatement();
            }
        }
        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "Statement";
            string code = "StatementTop";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = category;
            hfArea.Value = area;
            hfCode.Value = code;


           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);

            labelTitle.Text = Page.Request.QueryString["cID"] + " Level " + labelTitle.Text;
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Statement";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            string statementType = Page.Request.QueryString["cID"];
            var parameter = new CommonListParameter() { Operate = "", UserID = User.Identity.Name,Para1 = WorkingProfile.SchoolYear , Para2 = hfSchoolCode.Value };

            AppraisalPage.BuildingList(ddlArea, "StatementArea", parameter);
            AppraisalPage.BuildingList(ddlCategory, "StatementCategory", parameter);
            myList.SetLists(ddlArea, "StatementArea", User.Identity.Name);
            //  myList.SetListValue(ddlArea, statementType);
            //myList.SetLists(ddlCategory, "StatementCategory", User.Identity.Name);
            //   myList.SetListValue(ddlArea, statementType);
            string schoolcode = WorkingProfile.SchoolCode;
            if (statementType == "Board")
            {
                schoolcode = "0000";
            }
            hfSchoolCode.Value = schoolcode;
            AppraisalPage.BuildingList(ddlNo, "StatementNumber", parameter, 0);
          //  myList.SetLists(ddlNo, "StatementNumber", User.Identity.Name, WorkingProfile.SchoolYear, hfSchoolCode.Value);
          //  myList.SetListValue(ddlNo, 0);
            hfIDs.Value = "0";
        }
        private void GetLastStatement()
        {
            var statement = MyStatements();
            try
            {
                hfIDs.Value = statement.IDs.ToString();
                DateStart.Value = DateFC.YMD(statement.StartDate);
                DateEnd.Value = DateFC.YMD(statement.EndDate);
                TextSubject.Text = statement.Subject;
                myText.Text = statement.Statements;


                AppraisalPage.SetListValue(ddlNo, statement.No);
                AppraisalPage.SetListValue(ddlCategory, statement.Category);
                AppraisalPage.SetListValue(ddlArea, statement.Area);
                hfContentChange.Value = "0";
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
            }



        }

        protected void ddlNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetLastStatement();
        }
        private AppStatement MyStatements()
        {
            try
            {
                var parameter = new
                {
                    Operate = "Get",
                    UserID = User.Identity.Name,
                    SchoolYear = WorkingProfile.SchoolYear,
                    SchoolCode = hfSchoolCode.Value,
                    IDs = hfIDs.Value,
                    No = ddlNo.SelectedValue
                };
                return AppraisalManage.Statement(parameter)[0];
            }
            catch (Exception ex)
            {
                string em = ex.StackTrace;
                return null;
            }


        }

        private void ShowMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
            }
            catch { }

        }

        public static string ToUniversalTime(DateTime dt)
        {
            string dateFormat = "yyyyMMddTHHmmssZ";

            return dt.ToUniversalTime().ToString(dateFormat);
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            int lastone = ddlNo.Items.Count -1;
            ddlNo.SelectedIndex = lastone;
            int myNo = Int32.Parse(ddlNo.SelectedValue) + 1;
           System.Web.UI.WebControls.ListItem myNoItem = new System.Web.UI.WebControls.ListItem();
             myNoItem.Text = myNo.ToString();
            myNoItem.Value = myNo.ToString();
            ddlNo.Items.Add(myNoItem);
            AppraisalPage.SetListValue(ddlNo, myNo);

            hfIDs.Value = "0";
            ddlCategory.ClearSelection();
            ddlArea.ClearSelection();
            TextSubject.Text = "";
            myText.Text = "";
            DateStart.Value = DateFC.YMD(DateTime.Now);
            DateEnd.Value = DateFC.YMD(DateTime.Now);

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            AppStatement myStatements = new AppStatement()
            {  No = Int32.Parse(ddlNo.SelectedValue),
                IDs = Int32.Parse(hfIDs.Value),  //   if (Int32.TryParse(hfIDs.Value, out int numValue) )   
                SchoolYear = WorkingProfile.SchoolYear,
                SchoolCode = hfSchoolCode.Value,
                Area = ddlArea.SelectedValue,
                Category = ddlCategory.SelectedValue,
                StartDate = DateFC.YMD(DateStart.Value),
                EndDate = DateFC.YMD(DateEnd.Value),
                Subject = TextSubject.Text,
                Statements = myText.Text,
                Active = true,
                Publisher = User.Identity.Name,
                UserID =User.Identity.Name,
                Operate = hfIDs.Value =="0" ? "Insert" :"Update"
                

            };

            string result = AppraisalManage.SaveSatement(myStatements);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var parameter = new
            {
                Operate = "Delete",
                UserID = User.Identity.Name,
                SchoolYear = WorkingProfile.SchoolYear,
                SchoolCode = hfSchoolCode.Value,
                IDs = hfIDs.Value,
                No = ddlNo.SelectedValue
            };
            string result = AppraisalManage.DeleteSatement(parameter);
            hfIDs.Value = "0";
            GetLastStatement();
        }
    }
}