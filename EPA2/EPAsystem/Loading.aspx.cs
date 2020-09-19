using System;
using System.IO;
using System.Web.UI;

namespace EPA2.EPAsystem
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];

                PageURL.HRef = GetGoPage(goPage);
            }
        }
        private string GetGoPage(string goPage)
        {
            string cId = "";
            switch (goPage)
            {
                case "AppraisalCategory":
                    goPage = "AppraisalCategorySetup.aspx";
                    break;
                case "AppraisalArea":
                    goPage = "AppraisalAreaSetup.aspx";
                    break;
                case "ApplicationRole":
                    goPage = "ApplicationRoleManage.aspx";
                    break;
                case "UserCategory":
                    goPage = "TabExample.aspx";
                    break;
                case "UserManagement":
                    goPage = "ApplicationUsers.aspx";
                    break;
                case "MultipleSchoolUser":
                    goPage = "ApplicationUsersMultipleSchools.aspx";
                    break;
                case "SchoolDistrictSetup":
                    goPage = "SchoolDistrictSetup.aspx";
                    break;
                case "SchoolRegionSetup":
                    goPage = "SchoolRegionSetup.aspx";
                    break;
                case "SchoolManagement":
                    goPage = "SchoolManagement.aspx";
                    break;
                case "SystemStatements":
                    goPage = "ApplicationStatement";
                    break;
                case "EmailTemplate":
                    goPage = "EmailTemplateEdit.aspx";
                    break;
                case "StaffRollOver":
                    goPage = "AppraisalStaffRollOver.aspx";
                    break;
                case "Domain":
                    goPage = "DomainSetup.aspx";
                    break;
                case "Competency":
                    goPage = "DomainCompetencySetup.aspx";
                    break;
                case "LookFors":
                    goPage = "DomainLookForsSetup.aspx";
                    break;
                case "PrincipalBank":
                    cId = "Personal";
                    goPage = "CommentsBankSetup.aspx";
                    break;
                case "SchoolBank":
                    cId = "School";
                    goPage = "CommentsBankSetup.aspx";
                    break;
                case "BoardBank":
                    cId = "Board";
                    goPage = "CommentsBankSetup.aspx";
                    break;
                case "BoardStatements":
                    cId = "Board";
                    goPage = "StatementsSetup.aspx";
                    break;
                case "SchoolStatements":
                    cId = "School";
                    goPage = "StatementsSetup.aspx";
                    break;
                case "TestPage.aspx":
                    goPage = "Appraisal00.aspx";
                    break;
                default:
                    cId = goPage;
                 //   goPage = "ListItemsSetup.aspx";
                    break;
            }
            return CheckGoPagebyCode(goPage) + "?cID=" + cId;


        }
        private string CheckGoPagebyCode(string goPage)
        {
            string rVal = goPage;
            try
            {
                if (!File.Exists(Server.MapPath(goPage)))
                { rVal = "ListItemsSetup.aspx"; }
            }
            catch
            {
                rVal = "ListItemsSetup.aspx";
            }
            return rVal;
        }
    }
}