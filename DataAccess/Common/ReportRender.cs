using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Web;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
namespace DataAccess
{

    public class ReportRender
    {
        public ReportRender()
        {
        }

        public static void setParameterArray(MyCommon.MyParameterRS[] _ParaArray, int X, string _Name, string _Value)
        {
            try
            {
                _ParaArray[X] = new MyCommon.MyParameterRS();
                _ParaArray[X].pName = _Name;
                _ParaArray[X].pValue = _Value;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }

        public static void RenderReport(string _reportName, MyCommon.MyParameterRS[] _reportParameter)
        {
            try
            {
                Byte[] result = GetReportR2(_reportName, _reportParameter);
                string rFormat = WebConfig.ReportFormat();
                HttpContext.Current.Response.AppendHeader("content-disposition", "filename=" + _reportName + "." + rFormat);
                HttpContext.Current.Response.ContentType = getReportContentType(rFormat);

                HttpContext.Current.Response.OutputStream.Write(result, 0, result.GetLength(0));

                HttpContext.Current.Response.End();

            }
            catch (Exception ex)
            {
                string showmsg = ex.Message;
            }

        }


        public static void RenderReport(string reportName, string schoolyear, string schoolcode, string employeeID, string sessionID, string userID, string category, string apprRole)
        {
            try
            {
                MyCommon.MyParameterRS[] reportParameters = new MyCommon.MyParameterRS[7];
                setParameterArray(reportParameters, 0, "Operate", apprRole);
                setParameterArray(reportParameters, 1, "UserID", userID);
                setParameterArray(reportParameters, 2, "SchoolYear", schoolyear);
                setParameterArray(reportParameters, 3, "SchoolCode", schoolcode);
                setParameterArray(reportParameters, 4, "EmployeeID", employeeID);
                setParameterArray(reportParameters, 5, "SessionID", sessionID);
                setParameterArray(reportParameters, 6, "Category", category);

                string rFormat = WebConfig.ReportFormat();
                Byte[] result = GetReportR2(reportName, reportParameters);

                if (result.Length != 0)
                {
                    HttpContext.Current.Response.AppendHeader("content-disposition", "filename=" + reportName + "." + rFormat);
                    HttpContext.Current.Response.ContentType = getReportContentType(rFormat);

                    HttpContext.Current.Response.OutputStream.Write(result, 0, result.GetLength(0));

                    HttpContext.Current.Response.End();

                }
                else
                {

                    HttpContext.Current.Response.Redirect("PDFPageFile2.aspx?");
                }



            }
            catch (Exception ex)
            {
                string showmsg = ex.Message;
            }

        }


        public static Byte[] GetReportR2(string _reportName, MyCommon.MyParameterRS[] _reportParameter)

        {
            Byte[] result;
            try
            {

                ReportingWebService.ReportExecutionService RS = new ReportingWebService.ReportExecutionService();
                //  CredentialCache cache = new CredentialCache();
                string accessUser = WebConfig.ReportUser();
                string accessRWSPW = WebConfig.ReportPW();
                string accessDomain = WebConfig.DomainName();
                string reportingServices = WebConfig.ReportServices();
                string report = WebConfig.ReportPathWS() + _reportName;
                string format = WebConfig.ReportFormat();

                RS.Url = reportingServices;
                RS.Credentials = new System.Net.NetworkCredential(accessUser, accessRWSPW, accessDomain);


                string historyID = null;
                string devInfo = "<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";

                string encoding = "";
                string mimeType = "";
                ReportingWebService.Warning[] warnings = new ReportingWebService.Warning[0];
                string[] streamIDs = null;


                ReportingWebService.ServerInfoHeader sh = new ReportingWebService.ServerInfoHeader();   //'ServerInfoHeader  
                RS.ServerInfoHeaderValue = sh;  //'ServerInfoHeaderValue = sh  
                                                // ReportingWebService.Warning warning = new ReportingWebService.Warning();

                int pLeng = _reportParameter.Length;
                ReportingWebService.ParameterValue[] rptParameters = new ReportingWebService.ParameterValue[pLeng];


                int i = 0;
                foreach (MyCommon.MyParameterRS para in _reportParameter)
                {
                    rptParameters[i] = new ReportingWebService.ParameterValue();
                    rptParameters[i].Name = para.pName;
                    rptParameters[i].Value = para.pValue.ToString();
                    i += 1;
                }



                // ReDim rptParameters(cnt - 1)


                ReportingWebService.ExecutionInfo execInfo = new ReportingWebService.ExecutionInfo();
                ReportingWebService.ExecutionHeader execHeader = new ReportingWebService.ExecutionHeader();


                execInfo = RS.LoadReport(report, historyID);

                RS.SetExecutionParameters(rptParameters, "en-us");

                string extension = "";
                string SessionId = RS.ExecutionHeaderValue.ExecutionID;
                //   Console.WriteLine("SessionID: {0}", RS.ExecutionHeaderValue.ExecutionID);

                result = RS.Render(format, devInfo, out extension, out encoding, out mimeType, out warnings, out streamIDs);

                return result;

            }
            catch (Exception ex)
            {
                string error = ex.Message;
                return new Byte[0];
            }
        }
        public static Byte[] MultiplePDF(string[] mySelectIDArray, string reportName, string schoolyear, string schoolcode, string sessionID)
        {
            Document doc = new Document();
            MemoryStream msOutput = new MemoryStream();
            //           PdfCopy pCopy;
            PdfCopy pCopy = new PdfSmartCopy(doc, msOutput);
            doc.Open();

            for (int j = 0; j < mySelectIDArray.Length; j++)
            {

                string userID = HttpContext.Current.User.Identity.Name;
                string employeeID = mySelectIDArray[j].ToString();
                if (employeeID != "")
                {
                    try
                    {
                        Byte[] myPDF;
                        myPDF = GetOneReport(reportName, userID, schoolyear, schoolcode, sessionID, employeeID);
                        MemoryStream stream1 = new MemoryStream(myPDF);
                        PdfReader pdfFile1 = new PdfReader(stream1.ToArray());
                        for (int i = 1; i <= pdfFile1.NumberOfPages; i++)
                        {
                            pCopy.AddPage(pCopy.GetImportedPage(pdfFile1, i));
                        }
                        pdfFile1.Close();
                    }
                    catch { }
                }

            }
            try
            {
                pCopy.Close();
                doc.Close();
            }
            catch { }

            return msOutput.ToArray();
        }


        private static Byte[] GetOneReport(string reportName, string userID, string schoolyear, string schoolcode, string sessionID, string employeeID)
        {
            MyCommon.MyParameterRS[] reportParameters = new MyCommon.MyParameterRS[7];
            setParameterArray(reportParameters, 0, "Operate", "Report");
            setParameterArray(reportParameters, 1, "UserID", userID);
            setParameterArray(reportParameters, 2, "SchoolYear", schoolyear);
            setParameterArray(reportParameters, 3, "SchoolCode", schoolcode);
            setParameterArray(reportParameters, 4, "EmployeeID", employeeID);
            setParameterArray(reportParameters, 5, "SessionID", sessionID);
            setParameterArray(reportParameters, 6, "Category", "EPA");
            return GetReportR2(reportName, reportParameters);

        }

        public static string reportFormat(string pFormat)
        {
            string rValue = "";
            switch (pFormat)
            {
                case "PDF1":
                    rValue = "&rs:Command=Render&rs:Format=PDF&rs:ClearSession=true&rc:Toolbar=false";
                    break;
                case "PDF":
                    rValue = "&rs:Command=Render&rs:Format=PDF&rs:ClearSession=true&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                case "PDFV":
                    rValue = "&rs:Command=Render&rs:Format=PDF&rs:ClearSession=true&rc:Toolbar=true&rc:LinkTarget=_blank";
                    break;
                case "CSV":
                    rValue = "&rs:Command=Render&rs:Format=CSV&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                case "EXCEL":
                    rValue = "&rs:Command=Render&rs:Format=EXCEL&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                case "IMAGE":
                    rValue = "&rs:Command=Render&rs:Format=IMAGE&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                case "HTML":
                    rValue = "&rs:Command=Render&rs:Format=HTML4.0&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                case "HTMLV":
                    rValue = "&rs:Command=Render&rs:Format=HTML4.0&rc:Toolbar=true&rc:LinkTarget=_blank";
                    break;
                case "XML":
                    rValue = "&rs:Command=Render&rs:Format=XML&rc:Toolbar=false&rc:LinkTarget=_blank";
                    break;
                default:

                    rValue = "&rs:Command=Render&rs:Format=HTML4.0&rc:Toolbar=false&rc:LinkTarget=_blank";

                    break;
            }
            return rValue;

        }
        public static string getReportContentType(string _reportFormat)
        {

            string rValue = "";
            switch (_reportFormat)
            {
                case "PDF":
                    rValue = "application/pdf";
                    break;
                case "CSV":
                    rValue = "application/csv";
                    break;
                case "EXCEL":
                    rValue = "application / vnd.ms - excel";
                    break;
                case "IMAGE":
                    rValue = "image/tiff";
                    break;
                case "HTML":
                    rValue = "application/html";
                    break;
                case "XML":
                    rValue = "application/xml";
                    break;
                default:

                    rValue = "application/pdf";

                    break;
            }
            return rValue;

        }


    }
}
