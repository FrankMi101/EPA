using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class Domain
    {
        public int DomainID { get; set; }
        public string DomainName { get; set; }
        public bool Active { get; set; }
        public string Comments { get; set; }
    }
    public class Domain2 : Domain
    {
        public int IDs { get; set; }
        public string RowNo { get; set; }
        public string  Action { get; set; }
        public string ActionS { get; set; }
    }
}
