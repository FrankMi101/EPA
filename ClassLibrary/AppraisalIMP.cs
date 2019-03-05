using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class AppraisalIMP
    {
        public int RowNo { get; set; }
        public string  Needs { get; set; }
        public string Strategies { get; set; }

        public static string GetSP(string action)
        {
            string parameter = " @Operate, @UserID, @SchoolYear,@SchoolCode, @EmployeeID, @SessionID, @Category, @Area, @ItemCode";
            switch (action)
            {
                case "AddNew":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameter ;
                case "Update":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameter + ", @IDs, @GoalItem, @Value";
                case "Delete":
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameter + ", @IDs";
                default:
                    return "dbo.EPA_Appr_AppraisalData_AIPList2" + parameter;
            }

        }
        public static AppraisalComment2 GetParameters(string operate, string userId, string schoolyear, string schoolcode, string employeeId, string sessionId, string category, string area, string itemcode = "", string ids = "0",  string goalItem ="",  string value = "" )
        {
            var parameters = new  AppraisalComment2()
            {
                Operate = operate,
                UserID = userId,
                SchoolYear =schoolyear,
                SchoolCode =schoolcode,
                EmployeeID = employeeId,
                SessionID =sessionId,
                Category = category,
                Area = area,
                ItemCode =itemcode,
            };
            if (operate != "Get")
            {
                if (operate == "Delete")
                {
                    parameters.IDs = ids;
                }
                else
                {
                    parameters.IDs = ids;
                    parameters.GoalItem = goalItem;
                    parameters.Value = value;  
                }
            }
            return parameters;
        }
   
    }
}
