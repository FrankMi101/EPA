using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CommonParameters
    {
        public static CommonListParameter GetListParameters(string operate, string userId, string para1, string para2, string para3)
        {
            var parameters = new CommonListParameter()
            {
                Operate = operate,
                UserID = userId,
                Para1 = para1,
                Para2 = para2,
                Para3 = para3,
            };
            return parameters;
        }
        public static AppraisalListParameter GetListParameters(string operate, string userId, string schoolYear, string schoolCode, string searchBy, string searchValue)
        {
            var parameters = new AppraisalListParameter()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                SearchValue = searchValue,
                SearchBy = searchBy,
            };
            return parameters;
        }
        public static AppraisalNoticeParameter GetNoticeParameters(string operate, string userId, string schoolYear, string schoolCode, string searchBy, string searchValue, string noticeType, string noticeArea)
        {
            var parameters = new AppraisalNoticeParameter()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                SearchValue = searchValue,
                SearchBy = searchBy,
                NoticeType = noticeType,
                NoticeArea = noticeArea,
            };
            return parameters;
        }
        public static AppraisalComment GetCommentParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area)
        {
            AppraisalComment parameters = new AppraisalComment()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                Area = area,
            };

            return parameters;
        }
        public static AppraisalComment GetCommentParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string value)
        {
            AppraisalComment parameters = new AppraisalComment()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                Area = area,
                Value = value
            };

            return parameters;
        }

        public static AppraisalDate GetDateParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string date, string value)
        {
            AppraisalDate parameters = new AppraisalDate()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                Area = area,
                Date = date,
                Value = value,
            };

            return parameters;
        }


        public static AppraisalCompetency GetCompetencyParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string domainID, string competencyID, string rate, string value)
        {
            AppraisalCompetency parameters = new AppraisalCompetency()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                Area = area,
                DomainID = domainID,
                CompetencyID = competencyID,
                Value = value,
                Rate = rate
            };

            return parameters;
        }
        public static AppraisalObservation GetObservationListParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string domainID, string competencyID, string check, string value)
        {
            AppraisalObservation parameters = new AppraisalObservation()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                Area = area,
                DomainID = domainID,
                CompetencyID = competencyID,
                Check = check,
                Value = value,
            };

            return parameters;
        }
        public static EmailNotice GetEmailNoticeParamemeter(string emailTypemail, string emailTo, string emailCC, string emailBcc, string emailFrom, string emailFormat, string emailSubject, string emailBody, string att1, string att2, string att3)
        {
            EmailNotice parameters = new EmailNotice()
            {
                EmailType = emailTypemail,
                EmailTo = emailTo,
                EmailCC = emailCC,
                EmailBcc = emailBcc,
                EmailFrom = emailFrom,
                EmailFormat = emailFormat,
                EmailSubject = emailSubject,
                EmailBody = emailBody,
                Attachment1 = att1,
                Attachment2 = att2,
                Attachment3 = att3,
            };

            return parameters;
        }

        public static SetupListParameter GetSetupListParameters(string operate, string userId, string category, string area, string ids, string code, string name, string comments, int active, string competencyID)
        {
            var parameters = new SetupListParameter()
            {
                Operate = operate,
                UserID = userId,
                Category = category,
                Area = area,
                IDs = ids,
                Code = code,
                Name = name,
                Comments = comments,
                Active = active,
                CompetencyID = competencyID
            };
            return parameters;
        }
        public static SetupListParameter GetSetupListParameters<T>(string operate, string userId, string category, string area, string ids = "0", string code = "", string name = "", string comments = "", int active = 0, string competencyID = "0", string epa = "", string ntp = "", string lto = "")
        {
            var typeName = (typeof(T)).Name;
            switch (typeName)
            {
                case "DomainList":
                    return DomainListMethod.GetParameters(operate, userId, category, area, ids, code, name, comments, active);
                case "CompetencyList":
                    return CompetencyListMethod.GetParameters(operate, userId, category, area, ids, code, name, comments, active, epa, ntp, lto);
                case "LookForsList":
                    return LookForsListMethod.GetParameters(operate, userId, category, area, competencyID, ids, code, name, comments, active);
                default:
                    return DomainListMethod.GetParameters(operate, userId, category, area, ids, code, name, comments, active);
            }


        }
    }
}
