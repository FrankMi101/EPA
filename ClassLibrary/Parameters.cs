using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
   public class Parameters
    {
        public int Seq { get; set; }
        public string Key { get; set; }
        public object Value { get; set; }

        public static Parameters NewPara(int seq, string key, object value)
        {
            return new Parameters() { Seq = seq, Key = key, Value = value };
        }
    }
}
