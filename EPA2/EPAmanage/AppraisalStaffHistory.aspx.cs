using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using EPA2.Generic.LIB;

namespace EPA2.EPAmanage
{
    public partial class AppraisalStaffHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                setPageAttribution();
                AssemblePage();
                BindGridViewData();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "AppraisalHistory";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            UserLastWorking.AppraisalType = "EPA";
            UserLastWorking.AppraisalArea = "HistoryList";
            UserLastWorking.EmployeeID = Page.Request.QueryString["tID"];
            UserLastWorking.SchoolYear = Page.Request.QueryString["yID"];
            UserLastWorking.SchoolCode = Page.Request.QueryString["cID"];
            WorkingAppraisee.AppraisalYear = Page.Request.QueryString["yID"];
            WorkingAppraisee.EmployeeID = Page.Request.QueryString["tID"];
             Session["HomePage"] = "EPAmanage/Loading.aspx?pID=AppraisalHistory";
        }

        private void AssemblePage()
        {
            InitialPage();
        }
        private void InitialPage()
        {

        }
        //private void BindGridViewData()
        //{
        //    try
        //    {
        //        GridView1.DataSource = educatorsHistory(true); // GetDataSource(true);
        //        GridView1.DataBind();
        //    }
        //    catch (Exception ex)
        //    {
        //        var em = ex.Message;
        //    }

        //}
        //private DataTable GetDataSource(Boolean goDatabase)
        //{
        //    string schoolyear = Page.Request.QueryString["yID"];
        //    string schoolcode = Page.Request.QueryString["cID"];
        //    string employeeID = Page.Request.QueryString["tID"];
        //    string phase = Page.Request.QueryString["phase"];
        //    string tName = Page.Request.QueryString["tName"];
        //    LabelName.Text = tName;
        //    LabelPhase.Text = phase;
        //    LabelAdmin.Text = WorkingAppraisee.AppraiserName ;
        //     string searchby = "Teacher";
        //    string searchvalue = employeeID;

        //    try
        //    {
        //        DataSet myDS = new DataSet();
        //        myDS = StaffList.AppraisalHistory(WorkingProfile.UserRole, User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
        //        return myDS.Tables[0];
        //    }
        //    catch (Exception ex)
        //    {
        //        string em = ex.Message;
        //        return null;
        //    }


        //}

        //private IList<Educator2> educatorsHistory(Boolean goDatabase)
        //{
        //    string schoolyear = Page.Request.QueryString["yID"];
        //    string schoolcode = Page.Request.QueryString["cID"];
        //    string employeeID = Page.Request.QueryString["tID"];
        //    string phase = Page.Request.QueryString["phase"];
        //    string tName = Page.Request.QueryString["tName"];
        //    LabelName.Text = tName;
        //    LabelPhase.Text = phase;
        //    LabelAdmin.Text = WorkingAppraisee.AppraiserName;
        //    string searchby = "Teacher";
        //    string searchvalue = employeeID;
           
        //    try
        //    {
        //        IListRepository<Educator2, string> repository = Factory.Get<EducatorHistory>(); // new EducatorHistory();
        //        IList<Educator2> educators2 = repository.GetListItems(WorkingProfile.UserRole, User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);

        //        return educators2;
        //    }
        //    catch (Exception ex)
        //    {
        //        string em = ex.Message;
        //        return null;
        //    }


        //}
        private void BindGridViewData()
        {
            try
            {
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeID = Page.Request.QueryString["tID"];
                string phase = Page.Request.QueryString["phase"];
                string tName = Page.Request.QueryString["tName"];
                LabelName.Text = tName;
                LabelPhase.Text = phase;
                LabelAdmin.Text = WorkingAppraisee.AppraiserName;
                string searchby = "Teacher";
                string searchvalue = employeeID;

                // AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "DataSet", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
               //  AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
                AppraisalGridViewData.BindMyGridView(ref GridView1, "AppraisalStaffHistory", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue);
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }

    }
}