using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class AppraisalBase
    {
       public string Operate { get; set; }
        public string UserID { get; set; }
        public string SchoolYear { get; set; }
        public string SchoolCode { get; set; }
 
    }
  public class AppraisalComment : AppraisalBase
    {
        public string EmployeeID { get; set; }
        public string SessionID { get; set; }
        public string Category {get; set; }
        public string ItemCode { get; set; }
        public string Comments { get; set; }

    }
    public class AppraisalCommentOnDomain : AppraisalComment
    {
        public string DomainID { get; set; }
        public string CompetencyID { get; set; }
        public string Value{ get; set; }
    }
    public class AppraisalRateOnDomain : AppraisalCommentOnDomain
    { }
    public class AppraisalCompetency : AppraisalCommentOnDomain
    {
        public string Rate { get; set; }
    }
    public class AppraisalListBase : AppraisalBase
    {
        public string myKey { get; set; }
        public string EmployeeID { get; set; }
        public string Action { get; set; }
        public string Assignment { get; set; }
        public string Comments { get; set; }
        public string School { get; set; }
        public string RowNo { get; set; }
    }
    
}
