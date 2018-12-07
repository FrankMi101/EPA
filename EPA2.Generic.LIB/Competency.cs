using System;
using System.Collections.Generic;
using System.Text;

namespace EPA2.Generic.LIB
{
    public class Competency
    {
         public int CompetencyID { get; set; }
        public string CompetencyName { get; set; }
        public bool Active { get; set; }
        public string Comments { get; set; }
    }
    public class Competency2 : Competency
    {
        public int IDs { get; set; }
        public string RowNo { get; set; }
        public string Action { get; set; }
        public string ActionS { get; set; }
        public bool TPA { get; set; }
        public bool NTP { get; set; }
        public bool LTO { get; set; }
    }
    public class Competency3 : Competency
    {
        public int IDs { get; set; }
        public string RowNo { get; set; }
        public string Action { get; set; }
        public string ActionS { get; set; }
    }
}
