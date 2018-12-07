using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAappraisal
{
    public partial class TPAALP10 : System.Web.UI.Page
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
            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, category, area, code, WorkingProfile.UserRole);
        }
    }
}