using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.Documents
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"];
              
                switch (GoPage)
                {
                    case "AppUserGuideline":
                        GoPage = "UserMenu.pdf" ;
                        break;
                    case "MinistryGuideline":
                        GoPage = "MinistryGuideline.pdf";
                        break;
                    case "MinistryAppraisalFAQ":
                        GoPage = "TPA FAQ from Ministry Education.pdf";
                        break;
                    case "MinistryGuidelineE":
                        GoPage = "MinistryGuidelineE.pdf"  ;
                        break;
                    case "MinistryGuidelineNTIP":
                        GoPage = "MinistryGuidelineNTIP.pdf";
                        break;

                    case "MinistryGuidelineLTO":
                        GoPage = "MinistryGuidelineLTO.pdf";
                        break;
                    case "MinistryGuidelinePPA":
                        GoPage = "MinistryGuidelinePPA.pdf";
                        break;
                    default:
                        GoPage = "MinistryGuidelineE.pdf";
                        break;
                }

                PageURL.HRef = GoPage;
            }
        }
   
    }
}