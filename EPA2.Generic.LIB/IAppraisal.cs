using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;

namespace EPA2.Generic.LIB
{
    public interface IAppraisal<T, Tkey>
    {
        T GetItem(Tkey key);
        string AddItem(T newItem);
        string  UpdateItem(Tkey key, T updateItem);
        string GetItem(Tkey key, T getItem);
        string DeleteItem(Tkey key, T deleteItem);
        string GetResult(Tkey key, T getItem, string action);

    }
}