using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class Lto8Comments : System.Web.UI.Page
    {
        string _domainId;
        string _competencyId;
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
          
               SetPageAttribution();
               
                BindMyData();
                CheckPageReadonly();
            }
 
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            _domainId = "1";
            AppraisalPage.SetPageAttribute(Page);
            hfDomainID.Value ="1";
            string school = WorkingAppraisee.AppraisalSchoolCode;
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);

            AppraisalData.AssemblingLtoCompetencyList(Page,category,area,code,User.Identity.Name );

  
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
            OperationMyList("Rate", RBL1);
            OperationMyList("Rate", RBL2);
            OperationMyList("Rate", RBL3);
            OperationMyList("Rate", RBL4);
            OperationMyList("Rate", RBL5);
            OperationMyList("Rate", RBL6);
            OperationMyList("Rate", RBL7);   
        }
    
        protected void OperationMyData(string action , HtmlTextArea  myText )
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId =  myText.ID.Replace("TextCompentency", "");
            AppraisalData.DomainTextContent(ref myText, ref textCount, action, 250, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId);
        }
        protected void OperationMyList(string action, RadioButtonList myRbl)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            _domainId = hfDomainID.Value;
            _competencyId = myRbl.ID.Replace("RBL", "");
            AppraisalData.DomainListContent(ref myRbl, action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, _domainId, _competencyId);
        }

        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);


        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
           // OperationMyDate(ref dateStart, "Save");
           // OperationMyDate(ref dateEnd, "Save");
           // OperationMyDate(ref lengthMonth, "Save");
        }
        private void GoToNewPage(string action)
        {
            var parameter = new
            {
                Operate = action,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Code = hfCode.Value
            };
             string goPage = AppraisalPage.GoPage(parameter);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }


    }
}
