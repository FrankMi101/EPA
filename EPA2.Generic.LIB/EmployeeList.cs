using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class EmployeeList : IListRepository<Employee2, string>
    {
        public IEnumerable<Employee2> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Employee2> GetItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Employee2> GetListItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Employee2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode)
        {
            throw new NotImplementedException();
        }

        public IList<Employee2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string searchby, string searchValue)
        {
            DataTable dt = StaffList.SchoolStaffList(userRole, userID, schoolcode, searchby, searchValue).Tables[0];

            var mylist = new List<Employee2>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Employee2()
                {
                    RowNo = row["RowNo"].ToString(),
                    Action = row["Action"].ToString(),
                    EmployeeID = row["EmployeeID"].ToString(),
                    FirstName = row["FirstName"].ToString(),
                    LastName = row["LastName"].ToString(),
                    EmployeePosition = row["EmployeePosition"].ToString(),
                    EmployeeStatus = row["EmployeeStatus"].ToString(),
                    Email = row["Email"].ToString(),
                    StartDate = row["StartDate"].ToString(),
                    EndDate = row["EndDate"].ToString(),
                    Gender = row["Gender"].ToString(),
                    TimeType = row["TimeType"].ToString(),
                    UnitID = row["UnitID"].ToString(),
                    Assignment = row["Assignment"].ToString(),
                    Comments = row["Comments"].ToString(),
                    School = row["School"].ToString()
                });
            };
            return mylist;
        }

        public IList<Employee2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string serachby, string searchValue, string type, string area)
        {
            throw new NotImplementedException();
        }
    }

}
