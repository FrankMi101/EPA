using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Web;

namespace DataAccess
{
    public class AppraisalDataDomain
    {

        public AppraisalDataDomain()
        { }
       

        public static string DomainTextContentLOG(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainLOG";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 20, "@ActionRole", actionRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string DomainTextContentLOG(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainLOG";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[13];
            SetupThisParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 20, "@ActionRole", actionRole);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string DomainTextContentEnrichment(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionItem)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 20, "@ActionItem", actionItem);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string DomainTextContentEnrichment(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionItem, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[13];
            SetupThisParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 20, "@ActionItem", actionItem);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 1000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string DomainTextEvidenceLog(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainEvidenceLog";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 20, "@ActionRole", actionRole);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string DomainTextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomain";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string DomainTextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomain";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            SetupThisParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static DataSet DomainTextContentHistory(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainHistory";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet DomainTextContentLookFors(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_LookForsbyCompetency";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string DomainListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            SetupThisParameters(ref myPara, "Get", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string DomainListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextDomainList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            SetupThisParameters(ref myPara, "Save", userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode,domainID,competencyID);
             SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 1, "@Value", Value) ;

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string CompetencyTextContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextCompetency";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[11];
            SetupThisParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }

        public static string CompetencyTextContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string rate, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_TextCompetency";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[13];
            SetupThisParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode, domainID, competencyID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 10, "@Rate",rate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 12, 2000, "@Value", HttpContext.Current.Server.HtmlDecode(Value));

            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
      
    
        private static void SetupThisParameters(ref MyADO.MyParameterDB[] myPara, string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@DomainID", domainID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 10, "@CompetencyID", competencyID);
        }
    }
}
 