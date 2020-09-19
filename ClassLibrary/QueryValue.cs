using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
   public  class QueryValue : AppraisalBase
    {
        public string SessionID { get; set; }
        public string Category { get; set; }
        public string Area { get; set; }
        public string ItemCode { get; set; }
        public string Phase { get; set; }
        public string TeacherName { get; set; }
        public string PageID { get; set; }

    }
}
