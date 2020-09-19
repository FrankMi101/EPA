using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class ContentStrategy : System.Web.UI.Page
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
                string panel = GetPanelbyType(type);
                var parameter = new { Operate = "", UserID = User.Identity.Name, Panel = panel };
                var myList = AppraisalData.GeneralList<StrategyBank>("CommentsBank", "StrategiesBank", parameter);

                //DataSet myDs = new DataSet();
                //myDs = AppraisalComments.StrategyBank(User.Identity.Name, panel);

                var myRoot = new TreeNode("RootStrategies")
                {
                    Text = "Appraisal Strategies"
                };
                myRoot.Expand();
                myRoot = TreeViewNode.GetStrategyTreebyCase(myRoot, myList);
             //   myRoot = TreeViewNode.GetStrategyTreebyLoop(myRoot, myList);
            // myRoot = TreeViewNode.GetStrategyTreebyRecuision(myRoot, myList);


                TreeView1.Nodes.Clear();
                TreeView1.Nodes.Add(myRoot);

            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        //private TreeNode GetTreeNode(TreeNode myroot, List<StrategyBank> myList)
        //{
        //    int n1 = 0;
        //    int n2 = 0;
        //    int n3 = 0;
        //    //TreeNode myroot = new TreeNode("RootStrategies");

        //    TreeNode parentsNode = new TreeNode();
        //    foreach (var item in myList)
        //    {
        //        string level = item.TreeLevel.ToString();
        //        switch (level)
        //        {
        //            case "1":
        //                break;
        //            case "2":
        //                parentsNode = myroot;
        //                n1++;
        //                n2 = 0;
        //                break;
        //            case "3":
        //                parentsNode = myroot.ChildNodes[n1 - 1];
        //                n2++;
        //                n3 = 0;
        //                break;
        //            case "4":
        //                parentsNode = myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1];
        //                n3++;
        //                break;
        //            default:
        //                parentsNode = myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1];
        //                break;
        //        }

        //        TreeNode node = new TreeNode();// "T-" + item.RowNo.ToString());
        //        node.Text = item.Notes.ToString();
        //        parentsNode.ChildNodes.Add(node);
        //    }

        //    return myroot;
        //}
        //private void BindTreeViewData11(string type)
        //{
        //    try
        //    {
        //        TreeView1.Nodes.Clear();
        //        TreeNode myroot = new TreeNode("RootStrategies");
        //        myroot.Text = "Appraisal Strategies";
        //        myroot.Expand();
        //        TreeView1.Nodes.Add(myroot);
        //        // TreeNode parentNode = new TreeNode();

        //        string panel = GetPanelbyType(type);
        //        DataSet myDs = new DataSet();
        //        myDs = AppraisalComments.StrategyBank(User.Identity.Name, panel);
        //        int n1 = 0;
        //        int n2 = 0;
        //        int n3 = 0;
        //        foreach (DataRow row in myDs.Tables[0].Rows)
        //        {
        //            string level = row["TreeLevel"].ToString();
        //            string rowNo = "T-" + row["RowNo"].ToString();
        //            string notes = row["Notes"].ToString();
        //            //string domain = row["DomainID"].ToString();
        //            //string compentency = row["Competency"].ToString();
        //            //string lookfor = row["look_fors"].ToString();
        //            //string tips = row["Tips"].ToString();

        //            switch (level)
        //            {
        //                case "1":
        //                    break;
        //                case "2":
        //                    TreeNode mylevel1 = new TreeNode(rowNo);
        //                    mylevel1.Text = notes;
        //                    myroot.ChildNodes.Add(mylevel1);
        //                    n1++;
        //                    n2 = 0;
        //                    break;
        //                case "3":
        //                    TreeNode mylevel2 = new TreeNode(rowNo);
        //                    mylevel2.Text = notes;
        //                    myroot.ChildNodes[n1 - 1].ChildNodes.Add(mylevel2);
        //                    n2++;
        //                    n3 = 0;
        //                    break;
        //                case "4":
        //                    TreeNode mylevel3 = new TreeNode(rowNo);
        //                    mylevel3.Text = notes;
        //                    myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(mylevel3);
        //                    n3++;
        //                    break;
        //                default:
        //                    TreeNode mylevel4 = new TreeNode(rowNo);
        //                    mylevel4.Text = notes;
        //                    myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1].ChildNodes.Add(mylevel4);

        //                    break;

        //            }

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        var em = ex.Message;
        //    }

        //}
        //private void BindTreeViewData2(string type)
        // {
        //     try
        //     {

        //         TreeView1.Nodes.Clear();
        //         TreeNode myroot = new TreeNode("RootStrategies");
        //         myroot.Text = "Appraisal Strategies";
        //         myroot.Expand();
        //         TreeView1.Nodes.Add(myroot);
        //        // TreeNode parentNode = new TreeNode();

        //         string panel = GetPanelbyType(type);
        //         DataSet myDs = new DataSet();
        //         myDs = AppraisalComments.StrategyBank(User.Identity.Name, panel);
        //         int n1 = 0;
        //         int n2 = 0;
        //         int n3 = 0;

        //         string domainP = "";
        //         string compentencyP = "";
        //         string lookforP = "";

        //         foreach (DataRow row in myDs.Tables[0].Rows)
        //         {
        //             string level =   row["TreeLevel"].ToString();
        //             string rowNo = "T-" + row["RowNo"].ToString();
        //             string domain = row["DomainID"].ToString();
        //             string compentency = row["Competency"].ToString();
        //             string lookfor = row["look_fors"].ToString();
        //             string tips = row["Tips"].ToString();
        //             string notes = row["Notes"].ToString();

        //             if (domainP != domain)
        //             {
        //                 domainP = domain;
        //                 TreeNode mylevel1 = new TreeNode(rowNo);
        //                 mylevel1.Text = notes;
        //                 myroot.ChildNodes.Add(mylevel1);
        //                 //  TreeView1.Nodes[0].ChildNodes.Add(mylevel1);
        //                 n1++;
        //                 n2 = 0;
        //                 compentencyP = "";
        //              //   parentNode = mylevel1;
        //             }
        //             else
        //             {
        //                 if (compentencyP != compentency)
        //                 {
        //                     compentencyP = compentency;
        //                     TreeNode mylevel2 = new TreeNode(rowNo);
        //                     mylevel2.Text = notes;
        //                   //    parentNode.ChildNodes.Add(mylevel2);
        //                     myroot.ChildNodes[n1 - 1].ChildNodes.Add(mylevel2);
        //                     n2++;
        //                     n3 = 0;
        //                     lookforP = "";
        //                 //    parentNode = mylevel2;
        //                 }
        //                 else
        //                 {
        //                     if (lookforP != lookfor)
        //                     {
        //                         lookforP = lookfor;
        //                         TreeNode mylevel3 = new TreeNode(rowNo);
        //                         mylevel3.Text = notes;
        //                       //  parentNode.ChildNodes.Add(mylevel3);
        //                          myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(mylevel3);
        //                         n3++;
        //                       //  parentNode = mylevel3;
        //                     }
        //                     else
        //                     {
        //                         TreeNode mylevel4 = new TreeNode(rowNo);
        //                         mylevel4.Text = notes;
        //                      //   parentNode.ChildNodes.Add(mylevel4);
        //                         myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1].ChildNodes.Add(mylevel4);
        //                     }
        //                 }
        //             }
        //         }
        //     }
        //     catch (Exception ex)
        //     {
        //         var em = ex.Message;
        //     }

        // }
        // private void BindTreeViewData3(string type)
        // {
        //     try
        //     {
        //         string myKey = "";
        //         TreeView1.Nodes.Clear();
        //         string panel = GetPanelbyType(type);
        //         DataSet myDs = new DataSet();
        //         myDs = AppraisalComments.StrategyBank(User.Identity.Name, panel);

        //         TreeNode myroot = new TreeNode("RootStrategies");
        //         myroot.Text = "Appraisal Strategies";
        //         TreeView1.Nodes.Add(myroot);
        //         int n1 = 0;
        //         foreach (DataRow row in myDs.Tables[0].Rows)
        //         {
        //             myKey = row["myKey"].ToString();
        //             string domain = row["myValue"].ToString();
        //             TreeNode mylevel1 = new TreeNode(myKey);
        //             mylevel1.Text = row["myText"].ToString();
        //             TreeView1.Nodes[0].ChildNodes.Add(mylevel1);

        //             DataSet myDs2 = new DataSet();
        //             myDs2 = AppraisalComments.StrategyBank(User.Identity.Name, panel, domain);

        //             //foreach (DataRow row2 in myDS2.Tables[0].Rows)
        //             //{
        //             //    myKey = row["myKey"].ToString();
        //             //    string compentncy = row2["myValue"].ToString();
        //             //    TreeNode mylevel2 = new TreeNode(myKey);
        //             //    mylevel2.Text = row2["myText"].ToString();
        //             //    TreeView1.Nodes[0].ChildNodes[n1 - 1].ChildNodes.Add(mylevel2);

        //             //    DataSet myDS3 = new DataSet();
        //             //    myDS3 = AppraisalComments.StrategyBank(User.Identity.Name, panel, domain, compentncy);
        //             //    int n3 = 0;
        //             //    foreach (DataRow row3 in myDS3.Tables[0].Rows)
        //             //    {
        //             //        myKey = row["myKey"].ToString();
        //             //        string lookfor = row3["myValue"].ToString();
        //             //        TreeNode mylevel3 = new TreeNode(myKey);
        //             //        mylevel3.Text = row3["myText"].ToString();
        //             //        TreeView1.Nodes[0].ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(mylevel3);
        //             //        DataSet myDS4 = new DataSet();
        //             //        myDS4 = AppraisalComments.StrategyBank(User.Identity.Name, panel, domain, compentncy, lookfor);
        //             //        foreach (DataRow row4 in myDS4.Tables[0].Rows)
        //             //        {
        //             //            myKey = row["myKey"].ToString();
        //             //            string notes = row4["myValue"].ToString();
        //             //            TreeNode mylevel4 = new TreeNode(myKey);
        //             //            mylevel4.Text = row4["myText"].ToString();
        //             //            TreeView1.Nodes[0].ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1].ChildNodes.Add(mylevel4);
        //             //        }
        //             //        n3++;
        //             //    }
        //             //    n2++;
        //             //}
        //             n1++;
        //         }


        //     }
        //     catch (Exception ex)
        //     {
        //         var em = ex.Message;
        //     }

        // }

        private string GetPanelbyType(string type)
        {
            string panel = "0";
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