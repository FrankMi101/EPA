using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
   public  class AppraisalList : AppraisalListBase
    {
    
        public string ALP { get; set; }
        public string EPA { get; set; }
        public string CurrentSession { get; set; }
        public string AppraisalStatus { get; set; }
        public string AppraisalType { get; set; }
        public string AppraisalPhase { get; set; }
        public string AppraisalProcess { get; set; }
        public string AppraisalOutcome { get; set; }
        public string Appraiser { get; set; }
        public string Appraisal1 { get; set; }
        public string Appraisal2 { get; set; }
        public string Appraisal3 { get; set; }
        public string Appraisal4 { get; set; }
        public string Mentor { get; set; }
        public string TeacherNameL { get; set; }
        public string TeacherName { get; set; } 
    }

    public class AppraisalHistory :AppraisalList
    {
        public string  AppraisalYear { get; set; }
    }
    public class AppraisalNotice : AppraisalList
    {
        public string NoticeDate { get; set; }
        public string DueDate { get; set; }
        public bool SelectedC { get; set; }


    }
}
