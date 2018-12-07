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
    public partial class Text4Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                 setPageAttribution();
                AssemblingPageTitle();
                BindMyData("Get");
            }
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = hfCode.Value;
  
            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code );
        //    AppraisalData.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code+"1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code+"2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code+"3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code+"4");
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
            labelTitle.Text = labelTitle.Text + "(" + viewSchoolyear + ")";

            //    AppraisalData.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }
        protected void BindMyData(string action )
        {
            OperationMyData(action, myText1, "1");
            OperationMyData(action, myText2, "2");
            OperationMyData(action, myText3, "3");
            OperationMyData(action, myText4, "4");
         
        }
        protected void myText1_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void myText2_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void myText3_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void myText4_TextChanged(object sender, EventArgs e)
        {
      
        }
        protected void OperationMyData(string action, TextBox  myText , string textOrder)
        {
             string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
             AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code + textOrder, User.Identity.Name, viewSchoolyear, WorkingAppraisee.AppraisalSchoolCode,WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID);
    
         }
  
    }
}
 