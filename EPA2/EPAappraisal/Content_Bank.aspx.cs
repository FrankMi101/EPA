
using ClassLibrary;
using System;
using System.Collections.Generic; 
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class ContentBank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                BindGridViewData("Board");
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel(); 

        }
        private void AssemblePage()
        {
          
             InitialPage();
        }
        private void InitialPage()
        { 
            
        }
        private void BindGridViewData(string type)
        {
            try
            {
                GridView1.DataSource = GetDataSource(type);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<CommentBank> GetDataSource( string type)
        {
          
            try { 
                var parameter = new
                {
                    Operate = "CommentsBank",
                    UserID = User.Identity.Name,
                    Type = type,
                    Owner = GetBankOwner(type)
                };
                var bankLst = AppraisalLibrary.GeneralList<CommentBank>("CommentsBank", "CommentsBankTree",parameter); //. AppraisalComments.CommentsBank(User.Identity.Name, type, owner);
                return bankLst;
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }
        }

        private string GetBankOwner(string type)
        {
            string owner = User.Identity.Name;
            switch (type)
            {
                case "Board":
                    hfSelectedTab.Value = "btnBoard";
                    owner = "0000";
                    break;
                case "School":
                    hfSelectedTab.Value = "btnSchool";
                    owner =  WorkingAppraisee.AppraisalSchoolCode; ;
                    break;
                case "Personal":
                    hfSelectedTab.Value = "btnPersonal";
                    owner = User.Identity.Name;
                    break;
                default:
                    owner = "";
                    break;
            }
            return owner;
        }
        protected void BtnBoard_Click(object sender, EventArgs e)
        {
            BindGridViewData("Board");
        }

        protected void BtnSchool_Click(object sender, EventArgs e)
        {
            BindGridViewData("School");
        }

        protected void BtnPersonal_Click(object sender, EventArgs e)
        {
            BindGridViewData("Personal");
        }
    }
}