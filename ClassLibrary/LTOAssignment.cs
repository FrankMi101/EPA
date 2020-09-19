using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
   public  class LTOAssignment : AppraisalBase
    {
        public string  StartDate { get; set; }
        public string EndDate { get; set; }

        public string LengthMonth { get; set; }

        public string Assignment { get; set; }

        public string SAPNo { get; set; }
    }

    public class LTOCompetency
    {
        public  string DomainID { get; set; }
        public string CompetencyID { get; set; }
        public string LookingForID { get; set; }
        public string Context { get; set; }

    }
}
