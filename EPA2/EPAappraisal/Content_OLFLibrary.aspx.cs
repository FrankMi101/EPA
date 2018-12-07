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
    public partial class Content_OLFLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                hfSelectedTab.Value = "btnK12";
                BindTreeViewData("1");
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
                TreeNode myroot = new TreeNode("RootOLF");
                myroot.Expand();

                DataSet myDS = new DataSet();
                myDS = AppraisalComments.OLFLibaray(User.Identity.Name, type);
                int n1 = 0;
                int n2 = 0;
                int n3 = 0;
                foreach (DataRow row in myDS.Tables[0].Rows)
                {
                    string Level = row["TreeLevel"].ToString();
                    string RowNo = "T-" + row["RowNo"].ToString();
                    string notes = row["Notes"].ToString();
                    switch (Level)
                    {
                        case  "1":
                            myroot.Text = notes;
                            TreeView1.Nodes.Add(myroot);
                            break;
                        case "2":
                            TreeNode mylevel1 = new TreeNode(RowNo);
                            mylevel1.Text = notes;
                            myroot.ChildNodes.Add(mylevel1);
                            n1++;
                            n2 = 0;
                            break;
                        case "3":
                            TreeNode mylevel2 = new TreeNode(RowNo);
                            mylevel2.Text = notes; 
                            myroot.ChildNodes[n1 - 1].ChildNodes.Add(mylevel2);
                            n2++;
                            n3 = 0;
                            break;
                        case "4":
                             TreeNode mylevel3 = new TreeNode(RowNo);
                            mylevel3.Text = notes; 
                            myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes.Add(mylevel3);
                            n3++;
                            break;
                        default:
                            TreeNode mylevel4 = new TreeNode(RowNo);
                            mylevel4.Text = notes;
                            myroot.ChildNodes[n1 - 1].ChildNodes[n2 - 1].ChildNodes[n3 - 1].ChildNodes.Add(mylevel4);

                            break;

                    }
  
                }
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
 
        protected void btnTab_Click(object sender, EventArgs e)
        {
           
            string category = "1";
            string xID = ((System.Web.UI.Control)sender).ID;
            category = getCategoryByID(xID);
            BindTreeViewData(category);
        }
        private string getCategoryByID(string id)
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
        //protected void btnSchool_Click(object sender, EventArgs e)
        //{
        //    BindTreeViewData("School");
        //}

        //protected void btnPersonal_Click(object sender, EventArgs e)
        //{
        //    BindTreeViewData("Personal");
        //}
    }
}