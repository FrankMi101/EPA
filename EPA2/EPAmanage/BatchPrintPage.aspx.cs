using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPA2.EPAmanage
{
    public partial class BatchPrintPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                string reportName = Page.Request.QueryString["rID"];
                string selectedID = Page.Request.QueryString["eIDs"];
                string[] arrayID = selectedID.Split(';'); // split string on comma space
                Session["SelectedPrintID"] = arrayID;
 

                try
                {
                    
                    string rFormat = WebConfig.ReportFormat();
                    Byte[] result = ReportRender.MultiplePDF(arrayID, reportName, WorkingProfile.SchoolYear, WorkingProfile.SchoolCode, "Appraisal1");

                    if (result.Length != 0)
                    {
                        HttpContext.Current.Response.AppendHeader("content-disposition", "filename=" + reportName + "." + rFormat);
                        HttpContext.Current.Response.ContentType = ReportRender.getReportContentType(rFormat);

                        HttpContext.Current.Response.OutputStream.Write(result, 0, result.GetLength(0));

                        HttpContext.Current.Response.End();

                    }
                    else
                    {

                        HttpContext.Current.Response.Redirect("./EPAappraisal/PDFPageFile2.aspx");
                    }



                }
                catch (Exception ex)
                {
                    string showmsg = ex.Message;
                }


            }

        }
    }
}