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
    public partial class DomainText5Enr : System.Web.UI.Page
    {
        string domainID;
        string competencyID;
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
             AssemblingCompetencyList();
               setPageAttribution();
                
                BindMyData();
                checkPageReadonly();
            }
            domainID = hfCode.Value.Replace("ENR5", "");

        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);

            hfDomainID.Value = hfCode.Value.Replace("ENR5", "");
            domainID = hfDomainID.Value;
            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");
            AppraisalData.BuildingTextTitle(ref labelTitle5, "Title", User.Identity.Name, category, area, code + "5");

            AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
           AppraisalData.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);


        }
        private void AssemblingCompetencyList()
        {
            hfDomainID.Value = WorkingAppraisee.AppraisalCode.Replace("ENR5", "");
            domainID = hfDomainID.Value;
            string category = WorkingAppraisee.AppraisalType;
            //string domainID =   "1";
            CompetencyList.BuildingListForLOG(ref ContentCompetency, User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID, WorkingAppraisee.AppraisalSchoolCode, category, domainID);
            
            hfCompetencyID.Value = currerntCompetencyID();
            competencyID = hfCompetencyID.Value;
 
        }
        private string currerntCompetencyID()
        {
            foreach (Control c in ContentCompetency.Controls)
            {
                foreach (Control childc in c.Controls)
                {
                    if (childc is HtmlAnchor)
                    {
                        return childc.ID;
                    }
                }
            }
            return "1";
        }
       
        protected void BindMyData()
        {
          //  OperationMyData("Get");
       //   OperationMyList("Get");
        }
        protected void myText_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
              //  OperationMyData("Save", sender);
                hfContentChange.Value = "0";
            }
        }

        protected void btnCompetency_Click(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
             //   OperationMyData("Save",  );
                hfContentChange.Value = "0";
            }
            else
            {
                BindMyData();
            }
        }
        protected void OperationMyData(string action, TextBox myText)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
            string actionRole = hfAppraisalActionRole.Value;
            AppraisalData.DomainTextLOG(ref myText1, ref textCount, action, 1000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole);
            AppraisalData.DomainTextLOG(ref myText2, ref textCount, action, 1000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole);
            AppraisalData.DomainTextLOG(ref myText3, ref textCount, action, 1000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole);
            AppraisalData.DomainTextLOG(ref myText4, ref textCount, action, 1000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole);
            AppraisalData.DomainTextLOG(ref myText5, ref textCount, action, 1000, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID, actionRole);
        }
        protected void OperationMyList(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            domainID = hfDomainID.Value;
            competencyID = hfCompetencyID.Value;
        //    AppraisalData.DomainListContent(ref rblRateRubric, action, category, area, code, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value, domainID, competencyID);
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
          //  AssemblingCompetencyList();
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
