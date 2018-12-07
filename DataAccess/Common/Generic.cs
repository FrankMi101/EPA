using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess 
{
    public class Generic
    {

        public static bool IsStringNull(string s)
        {
            return (s == null || s == String.Empty) ? true : false;
        }
    }
  
}
