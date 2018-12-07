using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataAccess;
namespace EPA2.Generic.LIB
{

    public class GenericCompetency2 : IRepository<Competency2, int>
    {
        public void AddItem(Competency2 newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Competency2 GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency2> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency2> GetItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency2> GetItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency2> GetListItems()
        {
            var mylist = new List<Competency2>()
            {
                new Competency2() { CompetencyID = 1, CompetencyName = "Competency 1", Active = true, Comments = "new Competency 1", IDs = 1, RowNo = "1", Action = "", ActionS = "",TPA=true,NTP=true,LTO=false },
                new Competency2() { CompetencyID = 2, CompetencyName = "Competency 2", Active = true, Comments = "new Competency 2", IDs = 2, RowNo = "2", Action = "", ActionS = "" ,TPA=true,NTP=true,LTO=false },
                new Competency2() { CompetencyID = 3, CompetencyName = "Competency 3", Active = true, Comments = "new Competency 3", IDs = 3, RowNo = "3", Action = "", ActionS = "" ,TPA=true,NTP=true,LTO=false },
                new Competency2() { CompetencyID = 4, CompetencyName = "Competency 4", Active = false, Comments = "new Competency 4", IDs = 4, RowNo = "4", Action = "", ActionS = "",TPA=true,NTP=true,LTO=false  },
                new Competency2() { CompetencyID = 5, CompetencyName = "Competency 5", Active = false, Comments = "new Competency 5", IDs = 5, RowNo = "5", Action = "", ActionS = "" ,TPA=true,NTP=true,LTO=false }
            };
            return mylist;
        }

        public IList<Competency2> GetListItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency2> GetListItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency2> GetListItems(string action, string userID, string category, string area)
        {
            DataTable dt = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];

            var mylist = new List<Competency2>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Competency2()
                {
                    IDs = (int)row["IDs"],
                    CompetencyID = (int)row["CompetencyID"],
                    CompetencyName = row["CompetencyName"].ToString(),
                    Active = (bool)row["Active"],
                    Comments = row["Comments"].ToString(),
                    RowNo = row["RowNo"].ToString(),
                    Action = row["Action"].ToString(),
                    ActionS = row["ActionS"].ToString(),
                    TPA = (bool)row["TPA"],
                    NTP = (bool)row["NTP"],
                    LTO = (bool)row["LTO"]
                });
            };
            return mylist;
        }

        public IList<Competency2> GetListItems(string action, string userID, string category, string area, string competencyID)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(int key, Competency2 updateItem)
        {
            throw new NotImplementedException();
        }
        public void UpdateItems(IEnumerable<Competency2> upfateItems)
        {
            throw new NotImplementedException();
        }
    }
    public class GenericCompetency3 : IRepository<Competency3, int>
    {
        public void AddItem(Competency3 newItem)
        {
            throw new NotImplementedException();
        }

        public void DeleteItem(int key)
        {
            throw new NotImplementedException();
        }

        public Competency3 GetItem(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency3> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency3> GetItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Competency3> GetItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency3> GetListItems()
        {
            var mylist = new List<Competency3>()
            {
                new Competency3() { CompetencyID = 1, CompetencyName = "Competency 1", Active = true, Comments = "new Competency 1", IDs = 1, RowNo = "1", Action = "", ActionS = ""  },
                new Competency3() { CompetencyID = 2, CompetencyName = "Competency 2", Active = true, Comments = "new Competency 2", IDs = 2, RowNo = "2", Action = "", ActionS = ""   },
                new Competency3() { CompetencyID = 3, CompetencyName = "Competency 3", Active = true, Comments = "new Competency 3", IDs = 3, RowNo = "3", Action = "", ActionS = ""   },
                new Competency3() { CompetencyID = 4, CompetencyName = "Competency 4", Active = false, Comments = "new Competency 4", IDs = 4, RowNo = "4", Action = "", ActionS = ""   },
                new Competency3() { CompetencyID = 5, CompetencyName = "Competency 5", Active = false, Comments = "new Competency 5", IDs = 5, RowNo = "5", Action = "", ActionS = ""   }
            };
            return mylist;
        }

        public IList<Competency3> GetListItems(int domainID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency3> GetListItems(int domainID, int competencyID)
        {
            throw new NotImplementedException();
        }

        public IList<Competency3> GetListItems(string action, string userID, string category, string area)
        {
            DataTable dt = ApplicationSetupData.Competency(action, userID, category, area).Tables[0];

            var mylist = new List<Competency3>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Competency3()
                {
                    IDs = (int)row["IDs"],
                    CompetencyID = (int)row["CompetencyID"],
                    CompetencyName = row["CompetencyName"].ToString(),
                    Active = (bool)row["Active"],
                    Comments = row["Comments"].ToString(),
                    RowNo = row["RowNo"].ToString(),
                    Action = row["Action"].ToString(),
                    ActionS = row["ActionS"].ToString() 
                });
            };
            return mylist;
        }

        public IList<Competency3> GetListItems(string action, string userID, string category, string area, string competencyID)
        {
            throw new NotImplementedException();
        }

        public void UpdateItem(int key, Competency3 updateItem)
        {
            throw new NotImplementedException();
        }
        public void UpdateItems(IEnumerable<Competency3> upfateItems)
        {
            throw new NotImplementedException();
        }
    }
}