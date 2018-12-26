using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
  public   class CommonParameters
    {
        public static AppraisalListParameter GetListParameters(string operate, string userId, string schoolYear, string schoolCode, string searchBy, string searchValue)
        {
            var parameters = new AppraisalListParameter()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                SearchValue = searchValue,
                SearchBy = searchBy
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
                NoticeArea = noticeArea
            };
            return parameters;
        }
        public static AppraisalComment GetCommentParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category)
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
                Category = category
            };

            return parameters;
        }
        public static AppraisalComment GetCommentParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string value)
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
                Comments = value
            };

            return parameters;
        }
        public static AppraisalCommentOnDomain GetDomainCommentParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string domainID, string competencyID, string value)
        {
            AppraisalCommentOnDomain parameters = new AppraisalCommentOnDomain()
            {
                Operate = operate,
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Category = category,
                DomainID = domainID,
                CompetencyID = competencyID,
                Value = value
            };

            return parameters;
        }
        public static AppraisalCompetency GeCompetencytParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string domainID, string competencyID, string rate, string value)
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
                DomainID = domainID,
                CompetencyID = competencyID,
                Value = value,
                Rate = rate
            };

            return parameters;
        }
    }
}
