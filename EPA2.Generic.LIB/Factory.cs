using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public static class Factory
    {
        public static T Get<T>() where T : class {
            var tName = typeof(T).ToString();
          //  string typeName = ConfigurationManager.AppSettings[tName];
            Type resolvedType = Type.GetType(tName);
            object instance = Activator.CreateInstance(resolvedType);
            return instance as T;
        }
    }
}
