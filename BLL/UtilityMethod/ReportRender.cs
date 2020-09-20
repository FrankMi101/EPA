using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Configuration;

namespace BLL
{

    public class ReportRender
    {
        public ReportRender()
        {
        }

        public static void setParameterArray(MyADO.MyParameterRS[] _ParaArray, int X, string _Name, string _Value)
        {
            try
            {
                _ParaArray[X] = new MyADO.MyParameterRS();
                _ParaArray[X].pName = _Name;
                _ParaArray[X].pValue = _Value;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }

        public static void RenderReport(string _reportName, MyADO.MyParameterRS[] _reportParameter)
        {
            try
            {
                Byte[] result = GetReportR2(_reportName, _reportParameter);
                string rFormat = WebConfigurationManager.AppSettings["ReportFormat"];//  WebConfig.ReportFormat();
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


        public static void RenderReport(string reportName, string reportFormat, List<ReportParameter> myParameter )
        {
            try
            {
               
 
                string rFormat = WebConfigurationManager.AppSettings["ReportFormat"];//WebConfig.ReportFormat();
                Byte[] result = GetReportR2(reportName, reportFormat, myParameter);

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

        public static void RenderDocument(Byte[] _document, string _reportName, string _reportFormat)
        {
            try
            {
                string fileName = $"filename= { _reportName }" + getFileExtension(_reportFormat);

                HttpContext.Current.Response.AppendHeader("content-disposition", fileName);  // "filename=" + _reportName + ".xls");
                HttpContext.Current.Response.ContentType = getReportContentType(_reportFormat);
                // output the actual document contents to the response output stream
                HttpContext.Current.Response.OutputStream.Write(_document, 0, _document.GetLength(0));
                // end the response
                HttpContext.Current.Response.Flush();
                HttpContext.Current.Response.End();


            }
            catch (Exception ex)
            {
                string error = ex.Message;

            }

        }
        public static Byte[] GetReportR2(string _reportName, MyADO.MyParameterRS[] _reportParameter)

        {
            Byte[] result;
            try
            {

                ReportingWebService.ReportExecutionService RS = new ReportingWebService.ReportExecutionService();
                //  CredentialCache cache = new CredentialCache();
                
 
                string accessUser = WebConfigurationManager.AppSettings["WebServiceUser"];// WebConfig.ReportUser();
                string accessRWSPW = WebConfigurationManager.AppSettings["WebServiceWP"];//  WebConfig.ReportPW();
                string accessDomain = WebConfigurationManager.AppSettings["NetWorkDomain"];//  WebConfig.DomainName();
                string reportingServices = WebConfigurationManager.AppSettings["ReportingService"];// WebConfig.ReportServices();
                                                                                                   // string currentDB = DBConnectionHelper.CurrentDB();
                string report = WebConfigurationManager.AppSettings["ReportPathWS"] + "/" + _reportName;//  WebConfig.ReportPathWS()  + "/" + _reportName;
                string format = WebConfigurationManager.AppSettings["ReportFormat"];//  WebConfig.ReportFormat();


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
                foreach (MyADO.MyParameterRS para in _reportParameter)
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
        public static Byte[] GetReportR2(string _reportName, string reportFormat, List<ReportParameter> _reportParameter)  

        {
          //  Byte[] result;
            try
            {
                ReportingWebService.ReportExecutionService RS = new ReportingWebService.ReportExecutionService();
                //  CredentialCache cache = new CredentialCache();
                string accessUser = WebConfigurationManager.AppSettings["WebServiceUser"];// WebConfig.ReportUser();
                string accessRWSPW = WebConfigurationManager.AppSettings["WebServiceWP"];//  WebConfig.ReportPW();
                string accessDomain = WebConfigurationManager.AppSettings["NetWorkDomain"];//  WebConfig.DomainName();
                string reportingServices = WebConfigurationManager.AppSettings["ReportingService"];// WebConfig.ReportServices();
                                                                                                   // string currentDB = DBConnectionHelper.CurrentDB();
                string report = WebConfigurationManager.AppSettings["ReportPathWS"] + "/" + _reportName; //  WebConfig.ReportPathWS()  + "/" + _reportName;
                string format = reportFormat; // getReportContentType(reportFormat); //WebConfigValue.ReportFormat();

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

                // MyCommon.MyParameterRS[] _reportParameter = GetReportParameters(_reportName, parameters);
                // List<NVListItem> _reportParameter = GetReportParameters(_reportName, parameters);
                int pLeng = _reportParameter.Count; //  .Length;
                ReportingWebService.ParameterValue[] rptParameters = new ReportingWebService.ParameterValue[pLeng];


                int i = 0;
                foreach (var item in _reportParameter)
                {
                    rptParameters[i] = new ReportingWebService.ParameterValue() {
                        Name = item.ParaName,
                        Value = item.ParaValue.ToString()
                    } ;
                  //  rptParameters[i].Name = item.ParaName;
                  //  rptParameters[i].Value = item.ParaValue.ToString();  
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

              return RS.Render(format, devInfo, out extension, out encoding, out mimeType, out warnings, out streamIDs);
             
                //    return result;

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
            MyADO.MyParameterRS[] reportParameters = new MyADO.MyParameterRS[7];
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

        public static ReportParameter GetParameter(Int16 Seq, string pName, string pValue)
        {
            ReportParameter para1 = new ReportParameter();
            para1.ParaName = pName;
            para1.ParaValue = pValue;
            return para1;
        }
      
        public static string getFileExtension(string _reportFormat)
        {

            string rValue = "";
            switch (_reportFormat)
            {
                case "PDF":
                    rValue = ".pdf";
                    break;
                case "CSV":
                    rValue = ".csv";
                    break;
                case "EXCEL":
                     rValue = ".xls";
                    break;
                case "IMAGE":
                    rValue = ".gif";
                    break;
                case "HTML":
                    rValue = ".html";
                    break;
                case "XML":
                    rValue = ".xml";
                    break;
                default:
                    rValue = ".pdf";

                    break;
            }
            return rValue;

        }
    }
    public class ReportParameter
    {
        public string ParaName { get; set; }
        public string ParaValue { get; set; }


    }
}
