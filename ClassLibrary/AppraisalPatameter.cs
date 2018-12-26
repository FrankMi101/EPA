using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
   public  class AppraisalPatameter :AppraisalBase
    {
        public string  SearchBy { get; set; }
        public string SearchValue { get; set; } 
    }
    public class AppraisalListParameter : AppraisalPatameter
    { }
    public class AppraisalNoticeParameter: AppraisalPatameter
    {
        public string NoticeType { get; set; }
        public string NoticeArea { get; set; }
    }
}
