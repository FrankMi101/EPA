using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MethodAppraisalComment
    {

    }
    public class AppraisalCommentMethod
    {

        public static string GetSP(string action)
        {
            string parameter = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode";
            switch (action)
            {
                case "Update":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameter + ",  @Value";
                case "Save":
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameter + ",  @Value";
                default:
                    return "dbo.EPA_Appr_AppraisalData_Text" + parameter;
            }

        }

        public static AppraisalComment GetParameters(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string value = "")
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

    }
    public class AppraisalDateMethod
    {

        public static string GetSP(string action)
        {
            string parameter = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode";
            switch (action)
            {
                case "Update":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate2" + parameter + ", @Date, @Value";
                case "Save":
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate2" + parameter + ", @Date, @Value";
                default:
                    return "dbo.EPA_Appr_AppraisalData_ObservationDate2" + parameter;
            }

        }

        public static AppraisalDate GetParameter(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string date = "", string value = "")
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

    }

    public class AppraisalCompetencyCommentMethod
    {

        public static string GetSP(string action)
        {
            string sp = "dbo.EPA_Appr_AppraisalData_TextCompetency";
            string parameter = " @Operate,@UserID,@SchoolYear,@SchoolCode,@EmployeeID,@SessionID,@Category, @Area, @ItemCode, @DomainID, @CompetencyID";
             switch (action)
            {
                case "Update":
                    return sp + parameter + ", @Rate,  @Value";
                case "Save":
                    return sp + parameter + ", @Rate, @Value";
                default:
                    return sp + parameter;

            }

        }

        public static AppraisalCompetency GetParameters(string operate, string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string category, string area, string domainID, string competencyID, string rate = "", string value = "")
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
    }
}
