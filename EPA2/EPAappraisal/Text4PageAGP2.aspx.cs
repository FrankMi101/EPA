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
    public partial class Text4PageAGP2 : System.Web.UI.Page
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
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);


        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
        }

   
        protected void BindMyData()
        {
             OperationMyList("Get"); 
       }
        
       
        protected void OperationMyList(string action)
        {

            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
            labelTitle.Text = labelTitle.Text + "(" + viewSchoolyear + ")";
            AppraisalData.AGPWorkingTemplate(ref  GridView1,action,category, area, code, User.Identity.Name, viewSchoolyear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID);
        }

  
    }
}
