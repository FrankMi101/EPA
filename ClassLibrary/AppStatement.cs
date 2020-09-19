using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class AppStatement
    {
         public int No { get; set; }
        public string  SchoolYear { get; set; }
        public string  SchoolCode { get; set; }
        public string Category { get; set; }
        public string  Area { get; set; }
        public string  Subject { get; set; }
        public string  Statements { get; set; }
        public string  Publisher { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool Active { get; set; }
        public int IDs { get; set; }
        public string  Operate { get; set; }
        public string  UserID { get; set; }
    }
}
