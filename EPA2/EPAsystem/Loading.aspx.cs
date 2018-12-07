using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace EPA2.EPAsystem
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"];
                string cID = "";
                switch (GoPage)
                {
                    case "AppraisalCategory":
                        GoPage = "AppraisalCategorySetup.aspx";
                        break;
                    case "ApplicationRole":
                        GoPage = "ApplicationRoleManage.aspx";
                        break;
                    case "UserCategory":
                        GoPage = "TabExample.aspx";
                        break;
                    case "UserManagement":
                        GoPage = "ApplicationUsers.aspx";
                        break;
                    case "MultipleSchoolUser":
                        GoPage = "ApplicationUsersMultipleSchools.aspx";
                        break;
                    case "SchoolDistrictSetup":
                        GoPage = "SchoolDistrictSetup.aspx";
                        break;
                    case "SchoolRegionSetup":
                        GoPage = "SchoolRegionSetup.aspx";
                        break;
                    case "SchoolManagement":
                        GoPage = "SchoolManagement.aspx";
                        break;
                    case "SystemStatements":
                        GoPage = "ApplicationStatement";
                        break;
                    case "EmailTemplate":
                        GoPage = "EmailTemplateEdit.aspx";
                        break;
                    case "StaffRollOver":
                        GoPage = "AppraisalStaffRollOver.aspx";
                        break;
                    case "Domain":
                        GoPage = "DomainSetup.aspx";
                        break;
                    case "Competency":
                        GoPage = "DomainCompetencySetup.aspx";
                        break;
                    case "LookFors":
                        GoPage = "DomainLookForsSetup.aspx";
                        break;
                    case "PrincipalBank":
                        cID = "Personal";
                        GoPage = "CommentsBankSetup.aspx";
                        break;
                    case "SchoolBank":
                        cID = "School";
                        GoPage = "CommentsBankSetup.aspx";
                        break;
                    case "BoardBank":
                        cID = "Board";
                        GoPage = "CommentsBankSetup.aspx";
                        break;
                    case "BoardStatements":
                        cID = "Board";
                        GoPage = "StatementsSetup.aspx";
                        break;
                    case "SchoolStatements":
                        cID = "School";
                        GoPage = "StatementsSetup.aspx";
                        break;
                    case "TestPage.aspx":
                        GoPage = "Appraisal00.aspx";
                        break;
                    default:
                        cID = GoPage;
                        GoPage = "ListItemsSetup.aspx";
                        break;
                }
                GoPage = getGoPagebyCode(GoPage) + "?cID=" + cID;
                PageURL.HRef = GoPage;
            }


        }
        private string getGoPagebyCode(string GoPage)
        {
            string rVal = GoPage;

            try
            {
                if (!File.Exists(Server.MapPath(GoPage)))
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