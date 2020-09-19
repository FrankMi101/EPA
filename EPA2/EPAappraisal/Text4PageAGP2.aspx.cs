using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class Text4PageAgp2 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
          
               SetPageAttribution();
               
                BindMyData();         
            }
        }   
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
         //   AppraisalPage.SetPageAttribute(Page);
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
        }
        protected void BindMyData()
        { 
            GridView1.DataSource =   GetDataSource() ;// GetDataSource(true);
            GridView1.DataBind();
        }

        private List<AppraisalCommentAGP> GetDataSource()
        {
            
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
            labelTitle.Text = labelTitle.Text + "(" + viewSchoolyear + ")";

            var parameter = new ClassLibrary.AppraisalComment()
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                SchoolYear = viewSchoolyear,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                EmployeeID = WorkingAppraisee.EmployeeID,
                SessionID = WorkingAppraisee.SessionID,
                Area = hfArea.Value,
                ItemCode = hfCode.Value
            };
            return AppraisalData.AGPWorkingTemplate(parameter);
        }

        //protected void OperationMyList(string action)
        //{

        //    string category = hfCategory.Value;
        //    string area = hfArea.Value;
        //    string code = hfCode.Value;
        //    string viewSchoolyear = DateFC.SchoolYearPrevious("", WorkingAppraisee.AppraisalYear);
        //    labelTitle.Text = labelTitle.Text + "(" + viewSchoolyear + ")";

        //    var parameter = new ClassLibrary.AppraisalComment()
        //    {
        //        Operate = action,
        //        UserID = User.Identity.Name,
        //        SchoolYear = viewSchoolyear,
        //        SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
        //        EmployeeID = WorkingAppraisee.EmployeeID,
        //        SessionID = WorkingAppraisee.SessionID,
        //        Area = hfArea.Value,
        //        ItemCode = hfCode.Value  
        //    };
        //    AppraisalData.AGPWorkingTemplate(ref GridView1, parameter); 



        //  //  AppraisalData.AGPWorkingTemplate(ref  GridView1,action,category, area, code, User.Identity.Name, viewSchoolyear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.SessionID, WorkingAppraisee.EmployeeID);
        //}

  
    }
}
