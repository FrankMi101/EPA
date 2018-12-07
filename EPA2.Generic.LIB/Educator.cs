using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class Educator
    {
        public string EmployeeID { get; set; }
        public string TeacherName { get; set; }
        public string TeacherNameL { get; set; }
        public string EmployeePosition { get; set; }
        public string AppraisalType { get; set; }
        public string AppraisalPhase { get; set; }
        public string AppraisalStatus { get; set; }
        public string Assignment { get; set; }
        public string Appraiser { get; set; }
        public string Mentor { get; set; }
        public string Comments { get; set; }
        public string School { get; set; }
        public string RowNo { get; set; }
        public string Action { get; set; }
        public string ALP { get; set; }
        public string EPA { get; set; }
    }
    public class Educator2 : Educator
    {
        public string AppraisalOutcome { get; set; }
        public string CurrentSession { get; set; }
        public string AppraisalProcess { get; set; }
        public string Appraisal1 { get; set; }
        public string Appraisal2 { get; set; }
        public string Appraisal3 { get; set; }
        public string Appraisal4 { get; set; }
        public string AppraisalYear { get; set; }
    }
    public class Educator3 : Educator
    {
        public string DueDate { get; set; }
        public string NoticeDate { get; set; }
        public string myKey { get; set; }
        public bool SelectedC { get; set; }
    }
}
