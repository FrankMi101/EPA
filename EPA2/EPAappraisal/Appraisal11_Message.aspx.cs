using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
            }
            AssemblingPageTitle();
        }
        private void SetPageAttribution()
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
            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            if (userRole == "Teacher")
            {
                labelTitle.Text = labelTitle.Text.Replace("Principal", "Teacher");
                labelTitle.Text = labelTitle.Text.Replace("Admin", "Teacher");
            }
            else
            {
                userRole = "Principal";
            }
            var parameter = new {
                Operate ="Message",
                UserID = User.Identity.Name,
                Category = WorkingAppraisee.AppraisalType,
                Area = "AppraisalSummary",
                Code = "Message",
                UserRole = userRole

            };
            AppraisalPage.BuildingTextMessage(ref labelMessage1, parameter);// "Message", User.Identity.Name, category, area, code,userRole);

        }
   
    }
}
