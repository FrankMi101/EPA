using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class LTO8Comments : System.Web.UI.Page
    {
        string domainID;
        string competencyID;
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
          
               setPageAttribution();
               
                BindMyData();
                checkPageReadonly();
            }
 
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            domainID = "1";
            AppraisalPage.SetPageAttribute(Page);
            hfDomainID.Value ="1";

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);

            AppraisalData.AssemblingLTOCompetencyList(Page,category,area,code,User.Identity.Name );

  
        }


        protected void BindMyData()
        {
            OperationMyData("Get", TextCompentency1);
            OperationMyData("Get", TextCompentency2);
            OperationMyData("Get", TextCompentency3);
            OperationMyData("Get", TextCompentency4);
            OperationMyData("Get", TextCompentency5);
            OperationMyData("Get", TextCompentency6);
            OperationMyData("Get", TextCompentency7);
            OperationMyData("Get", TextCompentency8);
            OperationMyList("Get", RBL1);
            OperationMyList("Get", RBL2);
            OperationMyList("Get", RBL3);
            OperationMyList("Get", RBL4);
            OperationMyList("Get", RBL5);
            OperationMyList("Get", RBL6);
            OperationMyList("Get", RBL7);   
        }
    
        protected void OperationMyData(string action , HtmlTextArea  myText )
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID =  myText.ID.Replace("TextCompentency", "");
            AppraisalData.DomainTextContent(ref myText, ref textCount, action, 250, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
        }
        protected void OperationMyList(string action, RadioButtonList myRBL)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = myRBL.ID.Replace("RBL", "");
            AppraisalData.DomainListContent(ref myRBL, action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
        }

        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);


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
           // OperationMyDate(ref dateStart, "Save");
           // OperationMyDate(ref dateEnd, "Save");
           // OperationMyDate(ref lengthMonth, "Save");
        }
        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string goPage = AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }


    }
}
