using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class NoticeList : IListRepository<Educator3, string>
    {
        public IEnumerable<Educator3> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Educator3> GetItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Educator3> GetListItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Educator3> GetListItems(string userRole, string userID, string schoolyear, string schoolcode)
        {
            throw new NotImplementedException();
        }
        public IList<Educator3> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string serachby, string searchValue)
        {
            throw new NotImplementedException();
        }
        public IList<Educator3> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string searchby, string searchValue, string type, string area)
        {
            DataTable dt = StaffList.AppraisalNoticeStaff(userRole, userID, schoolyear, schoolcode, searchby, searchValue, type, area).Tables[0];
            var mylist = new List<Educator3>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Educator3()
                {
                    RowNo = row["RowNo"].ToString(),
                    Action = row["Action"].ToString(),
                    ALP = row["ALP"].ToString(),
                    EPA = row["EPA"].ToString(),
                    EmployeeID = row["EmployeeID"].ToString(),
                    TeacherName = row["TeacherName"].ToString(),
                    TeacherNameL = row["TeacherNameL"].ToString(),
                    Appraiser = row["Appraiser"].ToString(),
                    Mentor = row["Mentor"].ToString(),
                    AppraisalType = row["AppraisalType"].ToString(),
                    AppraisalPhase = row["AppraisalPhase"].ToString(),
                    DueDate = row["DueDate"].ToString(),
                    NoticeDate = row["NoticeDate"].ToString(),
                    SelectedC = (bool)row["SelectedC"],
                    myKey = row["myKey"].ToString(),
                    Assignment = row["Assignment"].ToString(),
                    Comments = row["Comments"].ToString(),
                    School = row["School"].ToString()
                });
            };
            return mylist;
        }
    }
}
