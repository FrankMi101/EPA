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
    public partial class Appraisal11_Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
            }
            AssemblingPageTitle();
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            AppraisalPage.SetPageAttribute( Page);
          }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = "AppraisalSummary";
            string code = "Message";
            hfCode.Value = "Message";
            hfArea.Value = "AppraisalSummary";
            string userRole = WorkingProfile.UserRole;
             AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            if (userRole == "Teacher")
            {
                labelTitle.Text = labelTitle.Text.Replace("Principal", "Teacher");
                labelTitle.Text = labelTitle.Text.Replace("Admin", "Teacher");
            }
            else
            {
                userRole = "Principal";
            }
            AppraisalData.BuildingTextMessage(ref labelMessage1, "Message", User.Identity.Name, category, area, code,userRole);

        }
   
    }
}
