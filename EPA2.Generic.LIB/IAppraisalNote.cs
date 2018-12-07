using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class IAppraisalNote : IAppraisal<AppraisalNotes, string>
    {
       
     
        public AppraisalNotes GetItem(string key)
        {
            throw new NotImplementedException();
        }
        public string GetItem(string key, AppraisalNotes myItem)
        {
            return AppraisalDataAC.TextContent("Get", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode);
        }
        public string AddItem(AppraisalNotes myItem)
        {
            return AppraisalDataAC.TextContent("Add", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, myItem.EmployeeID, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.Comments);

        }
        public string DeleteItem(string key, AppraisalNotes myItem)
        {
            return AppraisalDataAC.TextContent("Delete", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode);
        }
        public string UpdateItem(string key, AppraisalNotes myItem)
        {
            return AppraisalDataAC.TextContent("Update", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.Comments);
        }

        public string GetResult(string key, AppraisalNotes myItem, string action)
        {
            return AppraisalDataAC.TextContent(action, myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.Comments);
        }
    }
}
