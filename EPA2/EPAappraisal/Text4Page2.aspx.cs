using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class Text4Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                 SetPageAttribution();
                AssemblingPageTitle();
                BindMyData("Get");
            }
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = hfCode.Value;
  
           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code );
        //    AppraisalPage.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code+"1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code+"2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code+"3");
            AppraisalPage.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code+"4");
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
            labelTitle.Text = labelTitle.Text + "(" + viewSchoolyear + ")";

            //    AppraisalPage.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);

        }
        protected void BindMyData(string action )
        {
            OperationMyData(action, myText1, "1");
            OperationMyData(action, myText2, "2");
            OperationMyData(action, myText3, "3");
            OperationMyData(action, myText4, "4");
         
        }
        protected void MyText1_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void MyText2_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void MyText3_TextChanged(object sender, EventArgs e)
        {
           
        }
        protected void MyText4_TextChanged(object sender, EventArgs e)
        {
      
        }
        protected void OperationMyData(string action, TextBox  myText , string textOrder)
        {
             string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
         //    AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code + textOrder, User.Identity.Name, viewSchoolyear, WorkingAppraisee.AppraisalSchoolCode,WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID);

            var parameter = new AppraisalComment()
            {
                Operate = action,
                UserID = User.Identity.Name,
                SchoolYear = viewSchoolyear,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,            
                EmployeeID =  WorkingAppraisee.EmployeeID  ,
                SessionID =   WorkingAppraisee.SessionID, 
                Area = hfArea.Value,
                ItemCode = hfCode.Value + textOrder
            };
            AppraisalData.Comments(ref myText, ref textCount, action, 5000, parameter);
        }
  
    }
}
 