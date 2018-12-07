using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace EPA2.EPAsystem
{
    public partial class CommentsBankSetup : System.Web.UI.Page
    {
         protected void Page_Load(object sender, EventArgs e)
        {
            AssemblingPageTitle();
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;

                setPageAttribution();

                BindMyData();
               
            }
          

        }
        private void setPageAttribution()
        {
            WorkingProfile.PageCategory = "EPA";
            WorkingProfile.PageArea = "CommentBank";
            WorkingProfile.PageItem = "CommentBank";
            AppraisalPage.SetPageAttribute2(Page);
            
           myList.SetLists(ddlDomain, "DomainListcBank", User.Identity.Name);
            myList.SetLists(ddlShared, "SharedListcBank", User.Identity.Name);


        }

        private void AssemblingPageTitle()
        {
            string category = "EPA";
            string area = "CommentBank";
            string code = "CommentBank";
            hfUserID.Value = User.Identity.Name;
            hfCategory.Value = "EPA";
            hfArea.Value = "CommentBank";
  

           // AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            hfBankType.Value = Page.Request.QueryString["cID"];
            hfBankOwner.Value = getOwnerCodebyType(Page.Request.QueryString["cID"]);

        }

        private string getOwnerCodebyType(string type)
        {
            string owner = "0000";
         
            switch (type)
            {
                case "School":
                    owner = WorkingProfile.SchoolCode;
                    break;
                case "Personal":
                    owner =   User.Identity.Name;
                    break;
                default:
                    owner = "0000";
                    break;
            }

            return owner;

        }
        protected void BindMyData()
        {            
            OperationMyList("Get");
            hfContentChange.Value = "0";
        }
   
   
     
        protected void OperationMyList(string action)
        {

            string category = "EPA";
            string area = "CommentBank";
            string type = hfBankType.Value;
            string owner = hfBankOwner.Value;
            ApplicationSetup.CommentBankList(ref GridView1, action, User.Identity.Name, category, area,type,owner);
        }

      
        protected void btnNext_Click(object sender, EventArgs e)
        {
           
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
          
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string type = hfBankType.Value;
            string owner = hfBankOwner.Value;
            string result =   ApplicationSetupData.CommentsBank(  "AddNew", User.Identity.Name, category, area, type,owner, "0", "0","","","0");
            BindMyData();
        }
    }
}