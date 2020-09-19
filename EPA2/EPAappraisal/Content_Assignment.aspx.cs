using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class ContentAssignment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage(); 
            }
        }
        private void SetPageAttribution()
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