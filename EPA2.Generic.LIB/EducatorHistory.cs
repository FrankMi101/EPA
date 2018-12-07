using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EPA2.Generic.LIB
{
    public class EducatorHistory : IListRepository<Educator2, string>
    {
        public IEnumerable<Educator2> GetItems()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Educator2> GetItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Educator2> GetListItems(int employeeID)
        {
            throw new NotImplementedException();
        }

        public IList<Educator2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode)
        {
            throw new NotImplementedException();
        }

        public IList<Educator2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string searchby, string searchValue)
        {

            DataTable dt = StaffList.AppraisalHistory(userRole, userID, schoolyear, schoolcode, searchby, searchValue).Tables[0];

            var mylist = new List<Educator2>();
            foreach (DataRow row in dt.Rows)
            {
                mylist.Add(new Educator2()
                {
  
                    RowNo = row["RowNo"].ToString(),
                    Action = row["Action"].ToString(),
                    ALP = row["ALP"].ToString(),
                    EPA = row["EPA"].ToString(),
                    EmployeeID = row["EmployeeID"].ToString(),
                    TeacherName = row["TeacherName"].ToString(),
                    AppraisalYear = row["AppraisalYear"].ToString(),
                    Appraiser = row["Appraiser"].ToString(),
                    Mentor = row["Mentor"].ToString(),
                    AppraisalType = row["AppraisalType"].ToString(),
                    AppraisalPhase = row["AppraisalPhase"].ToString(),
                    AppraisalStatus = row["AppraisalStatus"].ToString(),
                    AppraisalOutcome = row["Appraisaloutcome"].ToString(),
                    Appraisal1 = row["Appraisal1"].ToString(),
                    Appraisal2 = row["Appraisal2"].ToString(),
                    Appraisal3 = row["Appraisal3"].ToString(),
                    Appraisal4 = row["Appraisal4"].ToString(),
                    Assignment = row["Assignment"].ToString(),
                    Comments = row["Comments"].ToString(),
                    //CurrentSession = row["CurrentSession"].ToString(),
                    //EmployeePosition = row["EmployeePosition"].ToString(),
                    School = row["School"].ToString()
                });
            };
            return mylist;
        }

        public IList<Educator2> GetListItems(string userRole, string userID, string schoolyear, string schoolcode, string serachby, string searchValue, string type, string area)
        {
            throw new NotImplementedException();
        }
    }
}
