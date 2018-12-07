using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class IAppraisalNote2 : IAppraisal<AppraisalNotes2, string>
    {
       
        public AppraisalNotes2 GetItem(string key)
        {
            throw new NotImplementedException();
        }
        public string GetItem(string key, AppraisalNotes2 myItem)
        {
            return AppraisalDataDomain.CompetencyTextContent("Get", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode,myItem.DomainID,myItem.CompetencyID);
        }
        public string AddItem(AppraisalNotes2 myItem)
        {
            return AppraisalDataDomain.CompetencyTextContent("Add", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, myItem.EmployeeID, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode,  myItem.DomainID, myItem.CompetencyID, myItem.Rate, myItem.Comments);

        }
        public string DeleteItem(string key, AppraisalNotes2 myItem)
        {
            return AppraisalDataDomain.CompetencyTextContent("Delete", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.DomainID, myItem.CompetencyID);
        }
        public string UpdateItem(string key, AppraisalNotes2 myItem)
        {
            return AppraisalDataDomain.CompetencyTextContent("Update", myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.DomainID, myItem.CompetencyID, myItem.Rate, myItem.Comments);
        }

        public string GetResult(string key, AppraisalNotes2 myItem, string action)
        {
            return AppraisalDataDomain.CompetencyTextContent(action, myItem.UserID, myItem.SchoolYear, myItem.SchoolCode, key, myItem.SessionID, myItem.Category, myItem.Area, myItem.ItemCode, myItem.DomainID, myItem.CompetencyID, myItem.Rate, myItem.Comments);
        }
    }
}
