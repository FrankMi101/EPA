using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace EPA2.Documents
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string goPage = Page.Request.QueryString["pID"];
              
                switch (goPage)
                {
                    case "AppUserGuideline":
                        goPage = "UserMenu.pdf" ;
                        break;
                    case "MinistryGuideline":
                        goPage = "MinistryGuideline.pdf";
                        break;
                    case "MinistryAppraisalFAQ":
                        goPage = "TPA FAQ from Ministry Education.pdf";
                        break;
                    case "MinistryGuidelineE":
                        goPage = "MinistryGuidelineE.pdf"  ;
                        break;
                    case "MinistryGuidelineNTIP":
                        goPage = "MinistryGuidelineNTIP.pdf";
                        break;

                    case "MinistryGuidelineLTO":
                        goPage = "MinistryGuidelineLTO.pdf";
                        break;
                    case "MinistryGuidelinePPA":
                        goPage = "MinistryGuidelinePPA.pdf";
                        break;
                    case "BoardLearningPlan":
                        goPage = "BoardLearnigImprovementPlan.pdf";
                        break;
                    default:
                        goPage = "MinistryGuidelineE.pdf";
                        break;
                }

                PageURL.HRef = goPage;
            }
        }
   
    }
}