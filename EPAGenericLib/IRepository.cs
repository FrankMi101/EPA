using System;
using System.Collections.Generic;
using System.Text;

namespace EPAGenericLib
{
    public interface IRepository<T,Tkey>
    {
        IEnumerable<T> GetItems();
        IEnumerable<T> GetItems(string userID, string userRole,string schoolYear,string schoolCode,string searchBy, string searchValue);
        T GetItem(Tkey key);
        void AddItem(T newItem);
        void DeleteItem(Tkey key);
        void UpdateItem(Tkey key,T updateItem);
        void UpdateItems(IEnumerable<T> upfateItems);
    }
    public class GenericEducatorRepository : IRepository<Educator, int>
    {
        public void AddItem(Educator newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Educator GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Educator> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Educator> GetItems(string userID, string userRole, string schoolYear, string schoolCode, string searchBy, string searchValue)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(int key, Educator updateItem)
        {
            throw new NotImplementedException();
        }

        public void UpdateItems(IEnumerable<Educator> upfateItems)
        {
            throw new NotImplementedException();
        }
    }
}
