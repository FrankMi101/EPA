using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAappraisal
{
    public partial class Tpaalp10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AssemblingPageTitle();
            }
        }
        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area =  WorkingAppraisee.AppraisalArea ;
            string code =  WorkingAppraisee.AppraisalCode;
           AppraisalPage.BuildingTitleTab(ref PageTitle, category, area, code, WorkingProfile.UserRole);
        }
    }
}