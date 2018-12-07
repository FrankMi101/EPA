using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2
{
    public partial class DefaultSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                assemblePage();
                GetUserLastWorkingValue();
                GetStatements();
            }
        }
        private void setPageAttribution()
        {
            Session["HomePage"] = "Loading.aspx?pID=Summary";
            hfCategory.Value = "EPA";
            hfPageID.Value = "Summary";
            hfArea.Value = "Summary";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void assemblePage()
        {
            title_EPA11.Text = getMyTitle("Title", "EPA11");
            title_EPA12.Text = getMyTitle("Title", "EPA12");
            title_EPA13.Text = getMyTitle("Title", "EPA13");
            title_EPA21.Text = getMyTitle("Title", "EPA21");
            title_EPA22.Text = getMyTitle("Title", "EPA22");
            title_EPA31.Text = getMyTitle("Title", "EPA31");
            title_EPA32.Text = getMyTitle("Title", "EPA32");
            title_EPA33.Text = getMyTitle("Title", "EPA33");
            title_EPA34.Text = getMyTitle("Title", "EPA34");
            subtitle_EPA31.Text = getMyTitle("SubTitle", "EPA31");
        }
        private string getMyTitle(string itemType, string itemCode)
        {
            return TitleContext.Content(itemType, User.Identity.Name, hfCategory.Value, hfPageID.Value, itemCode);
        }

        private void GetUserLastWorkingValue()
        {
            LabelRole.Text = WorkingProfile.UserRoleLogin;
            if (WorkingProfile.UserRole == "Teacher")
            {
                LabelAppraisalPhase.Text = "";
                LabelAppraisalProcess.Text = "";
            }
            LabelWorkingItem.Text = UserLastWorking.AppraisalItemName;
            LabelWorkingUserName.Text = UserLastWorking.EmployeeName;
            LabelWorkingList.Text = UserLastWorking.WorkingListName;
            LabelWorkingListArea.Text = UserLastWorking.WorkingListAreaName;



        }
        private void GetStatements()
        {

            LabelBoardStatement.Text = MessageContext.Statement("Get", User.Identity.Name, "Board", WorkingProfile.SchoolYear, "0000", WorkingProfile.UserRole);
            LabelSchoolStatement.Text = MessageContext.Statement("Get", User.Identity.Name, "School", WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, WorkingProfile.UserRole);
        }

    }
}