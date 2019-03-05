using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class SetupList
    {

        public int IDs { get; set; }
        public string RowNo { get; set; }
        public string Action { get; set; }
        public string ActionS { get; set; }
        public bool Active { get; set; }
        public string Comments { get; set; }

    }
    public class DomainList : SetupList
    {
        public int DomainID { get; set; }
        public string DomainName { get; set; }
      }
    public class CompetencyList : SetupList
    {
        public int CompetencyID { get; set; }
        public string CompetencyName { get; set; }
        public bool TPA { get; set; }  
        public bool NTP { get; set; }  
        public bool LTO { get; set; }  
     }
    public class LookForsList : SetupList
    {
        public int LookForsID { get; set; }
        public string LookForsName { get; set; }

       }

}
