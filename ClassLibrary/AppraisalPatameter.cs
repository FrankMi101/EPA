using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class AppraisalPatameter : AppraisalBase
    {
        public string SearchBy { get; set; }
        public string SearchValue { get; set; }
    }
    public class AppraisalListParameter : AppraisalPatameter
    { }
    public class AppraisalNoticeParameter : AppraisalPatameter
    {
        public string NoticeType { get; set; }
        public string NoticeArea { get; set; }
    }
    public class CommonListParameter
    {
        public string Operate { get; set; }
        public string UserID { get; set; }
        public string Para1 { get; set; }
        public string Para2 { get; set; }
        public string Para3 { get; set; }
    }
}
