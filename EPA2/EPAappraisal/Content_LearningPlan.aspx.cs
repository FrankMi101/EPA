using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class ContentLearningPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                BindTreeViewData("Board");
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
        private void BindTreeViewData(string type)
        {
            try
            {
                TreeNode myRoot = new TreeNode("RootStrategies")
                {
                    Text = "School Leaarning Plan"
                };
                myRoot.Expand();
                // TreeNode parentNode = new TreeNode();

                string panel = GetPanelbyType(type);
                string owner = GetOwnerbyType(type);
                var myList = GetDataSource(type);


                TreeView1.Nodes.Clear();
              myRoot = TreeViewNode.GetLearningPlanTreebyLoop(myRoot, myList);

                TreeView1.Nodes.Add(myRoot);

          
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            } 
        }
        private static TreeNode GetLevelNode(string nodeCode, string nodeText)
        {
            TreeNode node = new TreeNode(nodeCode)
            {
                Text = nodeText
            };
            return node;
        }


        private string GetPanelbyType(string type)
        {
            string panel = "";
            switch (type)
            {
                case "Board":
                    hfSelectedTab.Value = "btnBoard";
                    panel = "0";
                    break;
                case "School":
                    hfSelectedTab.Value = "btnSchool";
                    panel = "1";
                    break;
                case "Personal":
                    hfSelectedTab.Value = "btnPersonal";
                    panel = "2";
                    break;
                default:
                    panel = "0";
                    break;
            }
            return panel;
        }
        private string GetOwnerbyType(string type)
        {
            string owner = "";
            switch (type)
            {
                case "Board":
                    owner = "0000";
                    break;
                case "School":
                    owner = WorkingProfile.SchoolCode;
                    break;
                case "Personal":
                    owner = User.Identity.Name;
                    break;
                default:
                    owner = "";
                    break;
            }
            return owner;
        }

        private List<CommentBank> GetDataSource(string type)
        {

            try
            {
                var parameter = new
                {
                    Operate = "SchoolLearningPlan",
                    UserID = User.Identity.Name,
                    Type = type,
                    Owner = GetOwnerbyType(type)
                };
                var bankLst = AppraisalLibrary.GeneralList<CommentBank>("CommentsBank", "SchoolLearningPlan", parameter); // CommentsBank.SchoolLearningPlan(parameter). AppraisalComments.CommentsBank(User.Identity.Name, type, owner);
                return bankLst;
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }
        }


        protected void BtnBoard_Click(object sender, EventArgs e)
        {
            BindTreeViewData("Board"); 
        }

        protected void BtnSchool_Click(object sender, EventArgs e)
        {
            BindTreeViewData("School"); 
        }

        protected void BtnPersonal_Click(object sender, EventArgs e)
        {
            BindTreeViewData("Personal"); 
        }
    }
}