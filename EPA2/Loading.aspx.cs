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
                string goPage = Page.Request.QueryString["pID"].ToString();
                switch (goPage)
                    {
                    case "List":
                        goPage = "EPAmanage/Loading.aspx";
                        break;
                    case "ListHistory":
                        goPage = "EPAmanage/Loading.aspx";
                        break;
                    case "Appraisal":
                        goPage = "EPAappraisal/Loading.aspx";
                        break;
                    case "Evaluation":
                        goPage = "LoadingDashBoard.aspx?pID=Evaluation";
                        break;
                    case "Notice":
                        goPage = "LoadingDashBoard.aspx?pID=Notice" ;
                        break;
                    case "ALP":
                        goPage = "LoadingDashBoard.aspx?pID=ALP";
                        break;
                    case "EPA":
                        goPage = "LoadingDashBoard.aspx?pID=EPA";
                        break;
                     default:
                        goPage = "DefaultSummary.aspx";
                        break;
                }

                PageURL.HRef = goPage;
            }
        }
    }
}