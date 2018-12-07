using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;

namespace EPA2.Generic.LIB
{
    public interface IRepository<T, Tkey>
    {
        IEnumerable<T> GetItems();
        IEnumerable<T> GetItems(int domainID);
        IEnumerable<T> GetItems(int domainID, int competencyID);
        IList<T> GetListItems();
        IList<T> GetListItems(int domainID);
        IList<T> GetListItems(int domainID, int competencyID);
        IList<T> GetListItems(string action, string userID, string category, string area);
        IList<T> GetListItems(string action, string userID, string category, string area,string competencyID);
        T GetItem(Tkey key);
        void AddItem(T newItem);
        void DeleteItem(Tkey key);
        void UpdateItem(Tkey key, T updateItem);
        //void UpdateItems(IEnumerable<T> upfateItems);
    }
}