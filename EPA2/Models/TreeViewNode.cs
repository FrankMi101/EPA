using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using DataAccess;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class TreeViewNode : System.Web.UI.Page
    {
        public TreeViewNode()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void BuildingTree(ref TreeView TreeView1, DataSet myDS, string category, string PageSource)
        {

            TreeNode myroot = new TreeNode("EPASummary");
            string rootText = category + " Appraisal Process Step Summary";
            if (PageSource == "Incomplete")
            { rootText = category + " Appraisal Process Step Incomplete Summary"; }
            myroot.Text = rootText;
            TreeView1.Nodes.Add(myroot);
            int n1 = 0;
            int n2 = 0;
            try
            {
                foreach (DataRow row in myDS.Tables[0].Rows)
                {
                    string myLevel = row["TreeLevel"].ToString();
                    TreeNode myNode = getLevelNode(row["Appraisal_Code"].ToString(), row["Appraisal_Text"].ToString(), row["AppraisalStatus"].ToString());
                    if (myLevel == "1")
                    {
                        TreeView1.Nodes[0].ChildNodes.Add(myNode);
                        n1++;
                        n2 = 0;
                    }
                    if (myLevel == "2")
                    {
                        TreeView1.Nodes[0].ChildNodes[n1 - 1].ChildNodes.Add(myNode);
                        n2++;
                    }
                    if (myLevel == "3")
                    {
                        TreeView1.Nodes[0].ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(myNode);
                    }
                }
            }
            catch
            { }
        }
        private static TreeNode getLevelNode(string nodecode, string nodeText, string nodeStatus)
        {
            TreeNode mylevelx = new TreeNode(nodecode);
            mylevelx.Text = nodeText;
            bool check = (nodeStatus == "1") ? true : false;
            mylevelx.Checked = check;
            return mylevelx;
        }


    }
}