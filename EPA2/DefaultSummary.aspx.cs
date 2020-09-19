using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace EPA2
{
    public partial class DefaultSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                GetUserLastWorkingValue();
                GetStatements();
            }
        }
        private void SetPageAttribution()
        {
            Session["HomePage"] = "Loading.aspx?pID=Summary";
            hfCategory.Value = "EPA";
            hfPageID.Value = "Summary";
            hfArea.Value = "Summary";
            hfCode.Value = "DefaultSummary";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void AssemblePage()
        {
            title_EPA11.Text = GetMyTitle("Title", "EPA11");
            title_EPA12.Text = GetMyTitle("Title", "EPA12");
            title_EPA13.Text = GetMyTitle("Title", "EPA13");
            title_EPA21.Text = GetMyTitle("Title", "EPA21");
            title_EPA22.Text = GetMyTitle("Title", "EPA22");
            title_EPA31.Text = GetMyTitle("Title", "EPA31");
            title_EPA32.Text = GetMyTitle("Title", "EPA32");
            title_EPA33.Text = GetMyTitle("Title", "EPA33");
            title_EPA34.Text = GetMyTitle("Title", "EPA34");
            subtitle_EPA31.Text = GetMyTitle("SubTitle", "EPA31");
        }
        private string GetMyTitle(string itemType, string itemCode)
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
         
            Link_21.HRef = AppraisalPage.LastWorkingItemLink("WorkingItem", User.Identity.Name);
            Link_22.HRef = AppraisalPage.LastWorkingItemLink("WorkingArea", User.Identity.Name);

        }
        private void GetStatements()
        {

            LabelBoardStatement.Text = MessageContext.Statement("Get", User.Identity.Name, "Board", WorkingProfile.SchoolYear, "0000", WorkingProfile.UserRole);
            LabelSchoolStatement.Text = MessageContext.Statement("Get", User.Identity.Name, "School", WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, WorkingProfile.UserRole);
        }

    }
}