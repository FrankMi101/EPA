using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2
{
    public partial class Loading : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string GoPage = Page.Request.QueryString["pID"].ToString();
                switch (GoPage)
                    {
                    case "List":
                        GoPage = "EPAmanage/Loading.aspx";
                        break;
                    case "ListHistory":
                        GoPage = "EPAmanage/Loading.aspx";
                        break;
                    case "Appraisal":
                        GoPage = "EPAappraisal/Loading.aspx";
                        break;
                    case "Evaluation":
                        GoPage = "LoadingDashBoard.aspx?pID=Evaluation";
                        break;
                    case "Notice":
                        GoPage = "LoadingDashBoard.aspx?pID=Notice" ;
                        break;
                    case "ALP":
                        GoPage = "LoadingDashBoard.aspx?pID=ALP";
                        break;
                    case "EPA":
                        GoPage = "LoadingDashBoard.aspx?pID=EPA";
                        break;
                     default:
                        GoPage = "DefaultSummary.aspx";
                        break;
                }

                PageURL.HRef = GoPage;
            }
        }
    }
}