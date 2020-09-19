using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPA2.Models
{
    public class AppraisalDomainData :BaseData
    {
    

        public AppraisalDomainData()
        { }

        static string  _para = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SeesionID,@Category,@Area,@ItemCode,@DomainID,@CompetencyID";
        public static string DomainTextContentLOG(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainLOG" + _para + ",@ActionRole";
            var parameter = new {
                Operate = operation,
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                ActionRole = actionRole 
            };
            return GeneralValue<string>(sp, parameter);
         }

        public static string DomainTextContentLOG(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainLOG" + _para + ",@ActionRole,@Value";
            var parameter = new {
                Operate = operation,
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                ActionRole = actionRole,
                Value = value
            };
            return GeneralValue<string>(sp, parameter);
 
        }
        public static string DomainTextContentEnrichment(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionItem)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment" + _para + "@ActionItem";
            var parameter = new {
                Operate = operation,
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                ActionItem = actionItem,
            };
            return GeneralValue<string>(sp, parameter);
      
        }

        public static string DomainTextContentEnrichment(string operation,  DomainCompetency parameter )
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment" + _para + "@ActionItem";
        
            return GeneralValue<string>(sp, parameter);

        }
        public static string DomainTextContentEnrichment(string operation, DomainCompetency parameter, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment" + _para + "@ActionItem, @Value";
            parameter.Value = value;
            return GeneralValue<string>(sp, parameter);

        }

        public static string DomainTextContentEnrichment(string operation, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionItem, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainEnrichment" + _para + "@ActionItem,@Value";
            var parameter = new {
                Operate = operation,
                UserID = userID,
                SchoolYear  = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                ActionItem = actionItem,
                Value = HttpContext.Current.Server.HtmlDecode(value) 
            };
            return GeneralValue<string>(sp, parameter);   
        }
        public static string DomainTextEvidenceLog(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string actionRole)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainEvidenceLog" + _para + ",@ActionRole";
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                ActionRole = actionRole
            };
            return GeneralValue<string>(sp, parameter);
           }
        public static string DomainTextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomain" + _para;
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID 
            };
            return GeneralValue<string>(sp, parameter);  
        }

        public static string DomainTextContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomain" + _para + ",@Value";
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                Value = HttpContext.Current.Server.HtmlDecode(value)
            };
            return GeneralValue<string>(sp, parameter);
        }

        public static List<T> DomainTextContentHistory<T>(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainHistory" + _para;
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID 
            };
            return GeneralList<T>(sp, parameter);
          }
        public static List<LookFors> DomainTextContentLookFors(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_LookForsbyCompetency" + _para;

            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID
            };
            return GeneralList<LookFors>(sp, parameter);
        }
        public static string DomainListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainList" + _para;
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID
            };
            return GeneralValue<string>(sp, parameter);
         }

        public static string DomainListContent(string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextDomainList" + _para + ",@Value";
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                Value = value
            };
            return GeneralValue<string>(sp, parameter);
 
        }

        public static string CompetencyTextContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextCompetency" + _para ;
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID 
            };
            return GeneralValue<string>(sp, parameter);
         }

        public static string CompetencyTextContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string domainID, string competencyID, string rate, string value)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextCompetency" + _para + ",@Rate,@Value";
            var parameter = new
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                Area = area,
                ItemCode = itemCode,
                DomainID = domainID,
                CompetencyID = competencyID,
                Rate = rate,
                Value = value
            };
            return GeneralValue<string>(sp, parameter);
          
        }

 
    }
}