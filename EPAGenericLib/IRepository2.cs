using System;
using System.Collections.Generic;
using System.Text;

namespace EPAGenericLib
{
   public interface IRepository2 <T, Tkey>
    {
        IEnumerable<T> GetItems();
        IEnumerable<T> GetItems(int domainID);
        IEnumerable<T> GetItems( int domainID,int competencyID);
        IList<T> GetListItems();
        IList<T> GetListItems(int domainID);
        IList<T> GetListItems(int domainID, int competencyID);
        T GetItem(Tkey key);
        void AddItem(T newItem);
        void DeleteItem(Tkey key);
        void UpdateItem(Tkey key, T updateItem);
        void UpdateItems(IEnumerable<T> upfateItems);
    }
    public class GenericDomain : IRepository2<Domain, int>
    {
        public void AddItem(Domain newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Domain GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain> GetItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain> GetItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain> GetListItems()
        {
            throw new NotImplementedException();
        }

        public IList<Domain> GetListItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain> GetListItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(int key, Domain updateItem)
        {
            throw new NotImplementedException();
        }

        public void UpdateItems(IEnumerable<Domain> upfateItems)
        {
            throw new NotImplementedException();
        }
    }
}
