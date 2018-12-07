using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using DataAccess;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using EPA2.Generic.LIB;
using System.Collections.Generic;
/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 


namespace EPA2
{
    public class AppraisalGridViewData : System.Web.UI.Page
    {
        public AppraisalGridViewData()
        {

        }
        public static void BindMyGridView(ref GridView myGridView,string listPage, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue)
        {
            try
            {
                if (listPage == "StaffList")
                {
                   StaffListGridView(ref myGridView, method, userID, schoolyear, schoolcode, searchby, searchvalue);
                }
                if (listPage == "AppraisalStaffList")
                {
                    AppraisalStaffListGridView(ref myGridView, method, userID, schoolyear, schoolcode, searchby, searchvalue);
                }
                if (listPage == "AppraisalStaffHistory")
                {
                    AppraisalStaffHistoryGridView(ref myGridView, method, userID, schoolyear, schoolcode, searchby, searchvalue);
                }

            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
        public static void BindMyGridView(ref GridView myGridView, string listPage, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue,string noticeType, string noticeArea)
        {
            try
            {
                if (listPage == "NoticeList")
                {
                    NoticeListGridView(ref myGridView, method, userID, schoolyear, schoolcode, searchby, searchvalue,noticeType,noticeArea);
                }
              

            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
        private static void StaffListGridView(ref GridView myGridView, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue)
        {
            try
            {
                if (method == "DataSet")
                {
                     DataTable gridData = StaffList.SchoolStaffList(WorkingProfile.UserRole, userID,  schoolcode, searchby, searchvalue).Tables[0];
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }
                if (method == "iList")
                {
                    IListRepository<Employee2, string> repository = Factory.Get<EmployeeList>(); 
                    IList<Employee2> gridData = repository.GetListItems(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue);
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }

            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
        private static void AppraisalStaffListGridView(ref GridView myGridView, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue)
        {
            try
            {
                if (method == "DataSet")
                {
                    DataTable gridData = StaffList.AppraisalStaff(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue).Tables[0];
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }
                if (method == "iList")
                {
                    IListRepository<Educator2, string> repository = Factory.Get<EducatorsList>();//  new EducatorsList();
                    IList<Educator2> gridData = repository.GetListItems(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue);
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }

            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
        private static void AppraisalStaffHistoryGridView(ref GridView myGridView, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue)
        {
            try
            {
                
                if (method == "DataSet")
                {
                    DataTable gridData = StaffList.AppraisalHistory(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue).Tables[0];
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }
                if (method == "iList")
                {
                    IListRepository<Educator2, string> repository = Factory.Get<EducatorHistory>(); // new EducatorHistory();
                    IList<Educator2> gridData = repository.GetListItems(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue);
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }
            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
        private static void NoticeListGridView(ref GridView myGridView, string method, string userID, string schoolyear, string schoolcode, string searchby, string searchvalue,string noticeType, string noticeArea)
        {
            try
            {
                if (method == "DataSet")
                {
                    DataTable gridData = StaffList.AppraisalNoticeStaff(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue,noticeType,noticeArea).Tables[0];
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }
                if (method == "iList")
                {
                    IListRepository<Educator3, string> repository = Factory.Get<NoticeList>();//  new EducatorsList();
                    IList<Educator3> gridData = repository.GetListItems(WorkingProfile.UserRole, userID, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
                    myGridView.DataSource = gridData;
                    myGridView.DataBind();
                }

            }
            catch (System.Exception ex)
            {
                string em = ex.Message;
            }
        }
    }
}