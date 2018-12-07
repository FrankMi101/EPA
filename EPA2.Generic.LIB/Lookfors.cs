using System;
using System.Collections.Generic;
using System.Text;

namespace EPA2.Generic.LIB
{
    public class Lookfors
    {
        public int LookforsID { get; set; }
        public string LookforsName { get; set; }
        public bool Active { get; set; }
        public string Comments { get; set; }
    }
    public class Lookfors2 : Lookfors
    {
        public int IDs { get; set; }
        public string RowNo { get; set; }
        public string Action { get; set; }
        public string ActionS { get; set; }
    }
}
