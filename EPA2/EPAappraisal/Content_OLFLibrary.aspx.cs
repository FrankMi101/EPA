
using ClassLibrary;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAappraisal
{
    public partial class ContentOlfLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                hfSelectedTab.Value = "btnK12";
                BindTreeViewData("1");
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
                string action = "OLFCategoriesByPanel";
                var parameter = new { Operate = action, UserID = User.Identity.Name, Panel = type };
                var myList =   AppraisalData.GeneralList<OLFCategory>("CommentsBank", action, parameter);  //CommentsBank.OLFCategories(parameter);

                int n1 = 0;
                int n2 = 0;
                int n3 = 0;
                TreeView1.Nodes.Clear();
                TreeNode myroot = new TreeNode("RootOLF");
                TreeNode parentsNode = new TreeNode();
              //  TreeView1.Nodes.Add(myroot);
                myroot.Expand();
                foreach (var item in myList)
                {
                    string rowNo = "T-" + item.RowNo.ToString();
                    TreeNode node = new TreeNode(rowNo)
                    {
                        Text = item.Notes.ToString()
                    };


                    string level = item.TreeLevel.ToString();
                   switch (level)
                    {
                        case "1":
                            myroot.Text = item.Notes.ToString();
                            TreeView1.Nodes.Add(myroot);
                            break;
                        case "2": 
                            parentsNode = myroot;
                            n1++;
                            n2 = 0;
                            break;
                        case "3":
                            parentsNode = myroot.ChildNodes[n1 - 1];
                            n2++;
                            n3 = 0;
                            break;
                        case "4": 
                            parentsNode =  myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1] ;
                            n3++;
                            break;
                        default:
                           
                            parentsNode =  myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1] ;

                            break;

                    }
                    parentsNode.ChildNodes.Add(node);

                }
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private TreeNode AddNewTreeNode(string rowNo, string notes, TreeNode node)
        {
            TreeNode myNode = new TreeNode(rowNo)
            {
                Text = notes
            };
            node.ChildNodes.Add(myNode);
            AddNewTreeNode(rowNo, notes, node);
            return myNode;
        }
        protected void BtnTab_Click(object sender, EventArgs e)
        {

            string category = "1";
            string xId = ((System.Web.UI.Control)sender).ID;
            category = GetCategoryById(xId);
            BindTreeViewData(category);
        }
        private string GetCategoryById(string id)
        {
            hfSelectedTab.Value = id;
            string rVal = "1";
            switch (id)
            {
                case "btnK12":
                    rVal = "1";
                    break;
                case "btnSchool":
                    rVal = "2";
                    if (WebConfig.SchoolSystem() == "Catholic")
                    {
                        rVal = "7";
                    }
                    break;
                case "btnSystem":
                    rVal = "3";
                    if (WebConfig.SchoolSystem() == "Catholic")
                    {
                        rVal = "8";
                    }
                    break;
                case "btnDistrict":
                    rVal = "4";
                    break;
                default:
                    rVal = "5";
                    break;
            }
            return rVal;
        }
      
    }
}