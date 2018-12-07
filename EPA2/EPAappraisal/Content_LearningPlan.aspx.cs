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
    public partial class Content_LearningPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindTreeViewData("Board");
            }
        }
        private void setPageAttribution()
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
                TreeView1.Nodes.Clear();
                TreeNode myroot = new TreeNode("RootStrategies");
                myroot.Text = "School Leaarning Plan";
                myroot.Expand();
                TreeView1.Nodes.Add(myroot);
                // TreeNode parentNode = new TreeNode();

                string panel = GetPanelbyType(type);
                string owner = GetOwnerbyType(type);
                DataSet myDS = new DataSet();
                //   myDS = AppraisalComments.StrategyBank(User.Identity.Name, panel);
                myDS = AppraisalComments.SchoolLearningPlan(User.Identity.Name, type, owner);
                string DomainName = "";
                string Shared = "";
                string Comments = "";
                string RowNo = "";

                int n1 = 0;
                int n2 = 0;
                int n3 = 0;
                foreach (DataRow row in myDS.Tables[0].Rows)
                {

                    if (DomainName != row["DomainName"].ToString())
                    {
                        RowNo = "T-" + row["DomainID"].ToString();
                        DomainName = row["DomainName"].ToString();
                        TreeNode myNode = getLevelNode(RowNo, DomainName);


                        // mylevel1.Text = DomainName;
                        // TreeNode mylevel1 = new TreeNode(RowNo);

                        myroot.ChildNodes.Add(myNode);
                        n1++;
                        n2 = 0;
                    }
                    if (Shared != row["Shared"].ToString())
                    {
                        try
                        {
                            RowNo = "T-" + row["DomainID"].ToString() + "-" + row["SharedID"].ToString();
                            Shared = row["Shared"].ToString();
                            TreeNode myNode = getLevelNode(RowNo, Shared);

                            //TreeNode mylevel2 = new TreeNode(RowNo);
                            //mylevel2.Text = Shared;
                            myroot.ChildNodes[n1 - 1].ChildNodes.Add(myNode);
                            n2++;
                            n3 = 0;
                        }
                        catch { }
                    }
                    if (Comments != row["Comments"].ToString())
                    {
                        try
                        {
                            Comments = row["Comments"].ToString();
                            RowNo = "T-" + row["DomainID"].ToString() + "-" + row["SharedID"].ToString() + " -" + row["IDs"].ToString();
                            TreeNode myNode = getLevelNode(RowNo, Comments);
                            //      TreeNode mylevel3 = new TreeNode(RowNo);
                            //     mylevel3.Text = Comments;
                            myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(myNode);
                            n3++;
                        }
                        catch { }
                    }


                }
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private static TreeNode getLevelNode(string nodecode, string nodeText)
        {
            TreeNode mylevelx = new TreeNode(nodecode);
            mylevelx.Text = nodeText;
            return mylevelx;
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
        //private void BindGridViewData(string type)
        //{
        //    try
        //    {
        //        GridView1.DataSource = GetDataSource(type);
        //        GridView1.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        var em = ex.Message;
        //    }

        //}
        private DataTable GetDataSource(string type)
        {
            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeID = WorkingAppraisee.EmployeeID;
            string sessionID = WorkingAppraisee.SessionID;
            string owner = User.Identity.Name;
            switch (type)
            {
                case "Board":
                    hfSelectedTab.Value = "btnBoard";
                    owner = "0000";
                    break;
                case "School":
                    hfSelectedTab.Value = "btnSchool";
                    owner = schoolcode;
                    break;
                case "Personal":
                    hfSelectedTab.Value = "btnPersonal";
                    owner = User.Identity.Name;
                    break;
                default:
                    owner = "";
                    break;
            }

            try
            {
                DataSet myDS = new DataSet();
                myDS = AppraisalComments.CommentsBank(User.Identity.Name, type, owner);
                return myDS.Tables[0];
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }
        }

        protected void btnBoard_Click(object sender, EventArgs e)
        {
            BindTreeViewData("Board"); // BindGridViewData("Board");
        }

        protected void btnSchool_Click(object sender, EventArgs e)
        {
            BindTreeViewData("School");// BindGridViewData("School");
        }

        protected void btnPersonal_Click(object sender, EventArgs e)
        {
            BindTreeViewData("Personal");// BindGridViewData("Personal");
        }
    }
}