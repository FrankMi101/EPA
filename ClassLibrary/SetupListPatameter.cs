using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class SetupListParameter
    {
        public string Operate { get; set; }
        public string UserID { get; set; }
        public string Category { get; set; }
        public string Area { get; set; }
        public string IDs { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Comments { get; set; }
        public int Active { get; set; }
        public string CompetencyID { get; set; }
    }
    public class SetupListParameterCompetency : SetupListParameter
    {
        public string TPA { get; set; }
        public string NTP { get; set; }
        public string LTO { get; set; }
    }
}
