using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
  public   class Employee : AppraisalBase
    {
        public string Gender { get; set; }
        public string Email { get; set; }
        public string TimeType { get; set; }
        public string EmployeeStatus { get; set; }
        public string EmployeePosition { get; set; }
        public string PositionType { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string UnitID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string IsInAppraisalList { get; set; }
        public string Assignment { get; set; }
        public string Comments { get; set; }
    }
    public class EmployeeListC : Employee
    {
        public string Action { get; set; }
        public string School { get; set; }
        public string RowNo { get; set; }
    }
}
