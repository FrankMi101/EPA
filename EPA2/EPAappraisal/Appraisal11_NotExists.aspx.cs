using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11_NotExists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Label1.Text = Page.Request.QueryString["pID"];
                setPageAttribution();
                AssemblingPageTitle();
                BindMyData();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = WorkingAppraisee.AppraisalType;
            hfPageID.Value =  WorkingAppraisee.AppraisalArea;
            hfCode.Value = WorkingAppraisee.AppraisalCode;
            hfArea.Value = WorkingAppraisee.AppraisalArea;
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfContentChange.Value = "0";  // initila page content for not a change statue
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            Labelcategory.Text = category;
            LabelArea.Text = area;
            LabelCode.Text = code;
            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);

            string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);
            
        }
        protected void BindMyData()
        {
            OperationMyData("Get");
        }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save");
                hfContentChange.Value = "0";
            }
        }
        protected void OperationMyData(string action)
        {
            TextBox myBox = new TextBox();
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code,User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
      
        protected void btnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        private void GoToNewPage( string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code =hfCode.Value;
            string goPage =  AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
    }
}
 