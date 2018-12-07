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
    public partial class Content_Assignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage(); 
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
        { Labelschoolyear.Text = WorkingAppraisee.AppraisalYear;
            Labelschool.Text = WorkingAppraisee.AppraisalSchoolName;
            TextAssignment.Text = WorkingAppraisee.Assignment;
        }
        private void InitialPage()
        {

        }
  
        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            WorkingAppraisee.Assignment = TextAssignment.Text;
        }
    }
}