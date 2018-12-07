using System;
using System.Collections.Generic;
using System.Text;

namespace EPAGenericLib
{
    public class Competency
    {
        public int DomainID { get; set; }
        public int CompetencyID { get; set; }
        public string CompetencyName { get; set; }
        public string Active { get; set; }
        public string Comments { get; set; }
    }
}
