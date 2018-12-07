using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;

namespace EPA2.Generic.LIB
{
    public interface IListRepository<T, Tkey>
    {
        IEnumerable<T> GetItems();
        IEnumerable<T> GetItems(int employeeID);
        IList<T> GetListItems(int employeeID);
        IList<T> GetListItems(string userRole, string userID, string schoolyear, string schoolcode);
        IList<T> GetListItems(string userRole, string userID, string schoolyear, string schoolcode,string serachby,string searchValue);
        IList<T> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string serachby, string searchValue,string type, string area);
    }
}