using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;
using System.Web;

namespace EPA2.Generic.LIB
{
   
    public class GenericDomain : IRepository<Domain, int>
    {
        public void AddItem(Domain newItem)
        {
           // throw new NotImplementedException();
            string result = ApplicationSetupData.Domain("AddNew", HttpContext.Current.User.Identity.Name, "EPA", "Domain", "0", "", "", "", "");
        }

        public void DeleteItem(int key)
        {
            // throw new NotImplementedException();
            string ids = key.ToString();
            var returnval = ApplicationSetupData.Domain("Delete", HttpContext.Current.User.Identity.Name, "EPA", "Domain", ids, "", "", "", "");

        }
        public void UpdateItem(int key, Domain updateItem)
        {
            // throw new NotImplementedException();
            string ids =  key.ToString();
            string domainid = updateItem.DomainID.ToString();
            string active = updateItem.Active? "1":"0";
            var returnval = ApplicationSetupData.Domain("Save", HttpContext.Current.User.Identity.Name, "EPA", "Domain", ids, domainid, updateItem.DomainName, updateItem.Comments, active);

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
            //throw new NotImplementedException();
            var domainlist = new List<Domain>()
            {new Domain(){DomainID=1,DomainName="Domain 1",Active= true,Comments="new domain 1"},
             new Domain(){DomainID=2,DomainName="Domain 2",Active=true,Comments="new domain 2"},
             new Domain(){DomainID=3,DomainName="Domain 3",Active=true,Comments="new domain 3"},
             new Domain(){DomainID=4,DomainName="Domain 4",Active=false,Comments="new domain 4"}
            };
            return domainlist;
        }

        public IList<Domain> GetListItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain> GetListItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }
        public IList<Domain> GetListItems(string action, string userID, string category, string area)
        {
            throw new NotImplementedException();
        }

        public IList<Domain> GetListItems(string action, string userID, string category, string area, string competencyID)
        {
            throw new NotImplementedException();
        }

 

        //public void UpdateItems(IEnumerable<Domain> upfateItems)
        //{
        //    throw new NotImplementedException();
        //}
    }
    public class GenericDomain2 : IRepository<Domain2, int>
    {
        public void AddItem(Domain2 newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Domain2 GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain2> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain2> GetItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Domain2> GetItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain2> GetListItems()
        {
            var mylist = new List<Domain2>()
            {
                new Domain2() { DomainID = 1, DomainName = "Domain 1", Active = true, Comments = "new domain 1", IDs = 1, RowNo = "1", Action = "", ActionS = "" },
                new Domain2() { DomainID = 2, DomainName = "Domain 2", Active = true, Comments = "new domain 2", IDs = 2, RowNo = "2", Action = "", ActionS = "" },
                new Domain2() { DomainID = 3, DomainName = "Domain 3", Active = true, Comments = "new domain 3", IDs = 3, RowNo = "3", Action = "", ActionS = "" },
                new Domain2() { DomainID = 4, DomainName = "Domain 4", Active = false, Comments = "new domain 4", IDs = 4, RowNo = "4", Action = "", ActionS = "" },
                new Domain2() { DomainID = 5, DomainName = "Domain 5", Active = false, Comments = "new domain 5", IDs = 5, RowNo = "5", Action = "", ActionS = "" }
            };
            return mylist;
        }

        public IList<Domain2> GetListItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain2> GetListItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Domain2> GetListItems(string action, string userID, string category, string area)
        {
            DataTable dt = ApplicationSetupData.Domain(action, userID, category, area).Tables[0];

            var mylist = new List<Domain2>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Domain2(){ 
                  IDs = (int)row["IDs"],
                  DomainID = (int)row["DomainID"],
                  DomainName = row["DomainName"].ToString(),
                  Active = (bool)row["Active"],
                  Comments = row["Comments"].ToString(),
                  RowNo =  row["RowNo"].ToString(),
                  Action = row["Action"].ToString(),
                  ActionS = row["ActionS"].ToString() 
               });
            };
            return mylist;



        }

        public IList<Domain2> GetListItems(string action, string userID, string category, string area, string competencyID)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(int key, Domain2 updateItem)
        {
            throw new NotImplementedException();
        }

        //public void UpdateItems(IEnumerable<Domain2> upfateItems)
        //{
        //    throw new NotImplementedException();
        //}
    }
}