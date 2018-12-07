using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;

namespace EPA2.Generic.LIB
{
    public class GenericLookfors2 : IRepository<Lookfors2, int>
    {
        public void AddItem(Lookfors2 newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Lookfors2 GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Lookfors2> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Lookfors2> GetItems(int LookforsID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Lookfors2> GetItems(int LookforsID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Lookfors2> GetListItems()
        {
            var mylist = new List<Lookfors2>()
            {
                new Lookfors2() { LookforsID = 1, LookforsName = "Lookfors 1", Active = true, Comments = "new Lookfors 1", IDs = 1, RowNo = "1", Action = "", ActionS = "" },
                new Lookfors2() { LookforsID = 2, LookforsName = "Lookfors 2", Active = true, Comments = "new Lookfors 2", IDs = 2, RowNo = "2", Action = "", ActionS = "" },
                new Lookfors2() { LookforsID = 3, LookforsName = "Lookfors 3", Active = true, Comments = "new Lookfors 3", IDs = 3, RowNo = "3", Action = "", ActionS = "" },
                new Lookfors2() { LookforsID = 4, LookforsName = "Lookfors 4", Active = false, Comments = "new Lookfors 4", IDs = 4, RowNo = "4", Action = "", ActionS = "" },
                new Lookfors2() { LookforsID = 5, LookforsName = "Lookfors 5", Active = false, Comments = "new Lookfors 5", IDs = 5, RowNo = "5", Action = "", ActionS = "" }
            };
            return mylist;
        }

        public IList<Lookfors2> GetListItems(int LookforsID)
        {
            throw new NotImplementedException();
        }

        public IList<Lookfors2> GetListItems(int LookforsID, int competencyID)
        {
            throw new NotImplementedException();
        }
        public IList<Lookfors2> GetListItems(string action, string userID, string category, string area)
        {
            throw new NotImplementedException();
        }
        public IList<Lookfors2> GetListItems(string action, string userID, string category, string area,string competencyID)
        {
            DataTable dt = ApplicationSetupData.LookFors(action, userID, category, area,competencyID).Tables[0];

            var mylist = new List<Lookfors2>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Lookfors2(){ 
                  IDs = (int)row["IDs"],
                  LookforsID = (int)row["LookforsID"],
                  LookforsName = row["LookforsName"].ToString(),
                  Active = (bool)row["Active"],
                  Comments = row["Comments"].ToString(),
                  RowNo =  row["RowNo"].ToString(),
                  Action = row["Action"].ToString(),
                  ActionS = row["ActionS"].ToString() 
               });
            };
            return mylist;



        }

    
        public void UpdateItem(int key, Lookfors2 updateItem)
        {
            throw new NotImplementedException();
        }

        public void UpdateItems(IEnumerable<Lookfors2> upfateItems)
        {
            throw new NotImplementedException();
        }
    }
}