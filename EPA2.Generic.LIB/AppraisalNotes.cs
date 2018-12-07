using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class AppraisalBase
    {
        public string Action { get; set; }
        public string UserID { get; set; }
        public string Category { get; set; }
        public string Area { get; set; }

    }
    public class AppraisalNotes:AppraisalBase
    {
        public string SchoolYear { get; set; }
        public string SchoolCode { get; set; }
        public string EmployeeID { get; set; }
        public string SessionID { get; set; }
        public string ItemCode { get; set; }
        public string Comments { get; set; }

    }
    public class AppraisalNotes2 : AppraisalNotes
    {
        public string DomainID { get; set; }
        public string CompetencyID { get; set; }
        public string Rate { get; set; }
    }
    public class ObservationDate : AppraisalNotes
    {
        public DateTime ObsDate { get; set; }
 
    }
}
