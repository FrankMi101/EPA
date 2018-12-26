using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace EPA2.EPAmanage
{
    public partial class AppraisalNoticeList : System.Web.UI.Page
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
            hfPageID.Value = "NoticeList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        private void AssemblePage()
        {
            myList.SetLists(ddlSchoolYear, "SchoolYear", User.Identity.Name);
            myList.SetListValue(ddlSchoolYear, UserProfile.CurrentSchoolYear);

            mySchoolList.SetLists2(ddlSchool, ddlSchoolCode, "SchoolList", User.Identity.Name, WorkingProfile.UserRole, ddlSchoolYear.SelectedValue, WorkingProfile.SchoolCode);
            InitialPage();
        }
        private void InitialPage()
        {
            if (WorkingProfile.SchoolCode == "")
            {
                ddlSchool.SelectedIndex = 0;
                mySchoolList.SetListsValue(ddlSchoolCode, ddlSchool, ddlSchool.SelectedValue);
                WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            }
            else
            {
                mySchoolList.SetListsValue(ddlSchoolCode, ddlSchool, WorkingProfile.SchoolCode);

            }
            ddlSearchby.SelectedIndex = 0;
            TextSearch.Visible = true;
            ddlSearch.Visible = false;

            if (Page.Request.QueryString["nType"] == "EPA")
            {
                rblNoticeType.SelectedIndex = 1;
            }
            if (Page.Request.QueryString["nType"] == "OBS")
            {
                rblNoticeType.SelectedIndex = 2;
            }
            // ddlSearchby.Items[0].Selected = true;
        }
        private void BindGridViewData()
        {
            try
            {
                string schoolyear = ddlSchoolYear.SelectedValue;
                string schoolcode = ddlSchool.SelectedValue;

                string searchby = ddlSearchby.SelectedValue;
                string searchvalue = ddlSearch.SelectedValue;
                string noticeType = "AppraisalStart";
                string noticeArea = rblNoticeType.SelectedValue;

                if (Page.Request.QueryString["nType"] == "ALPBatch")
                {
                    noticeType = "ALPPrint";
                    chbAll.Checked = true;

                }

                if (searchby == "Teacher")
                {
                    searchvalue = TextSearch.Text;
                }
                //  AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "DataSet", User.Identity.Name,   schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
               // AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
                AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
                //GridView1.DataSource = GetDataSource(true);
                //GridView1.DataBind();

                getEmailTemplate();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private void getEmailTemplate()
        {
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            string noticeType = "AppraisalStart";
            string noticeArea = rblNoticeType.SelectedValue;
            hfNoticeType.Value = noticeType;
            Session["NoticeType"] = noticeType;
            string purpose = "Notice";
            TextSubject.Text = GetNoticeFile.eMailContentByType("GetSubject", User.Identity.Name, "TPA", noticeType, noticeArea, "Appraisee", "Appraiser", purpose);
            string myBody = GetNoticeFile.eMailContentByType("GetBody", User.Identity.Name, "TPA", noticeType, noticeArea, "Appraisee", "Appraiser", purpose);
            myBody = myBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
            myBody = myBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
            myBody = myBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingProfile.SchoolYear);
            //  myBody = myBody.Replace("{{AppraisalCategory}}","");
            myBody = myBody.Replace("{{PlaceHolder:WebSite}}", WebConfig.getValuebyKey("ApplicationSite"));
            myBody = myBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
            myBody = myBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);

            myText.Text = myBody;

        }
        //private DataTable GetDataSource(Boolean goDatabase)
        //{
        //    string schoolyear = ddlSchoolYear.SelectedValue;
        //    string schoolcode = ddlSchool.SelectedValue;

        //    string searchby = ddlSearchby.SelectedValue;
        //    string searchvalue = ddlSearch.SelectedValue;
        //    string noticeType = "AppraisalStart";
        //    string noticeArea = rblNoticeType.SelectedValue;

        //    if (Page.Request.QueryString["nType"] == "ALPBatch")
        //    {
        //        noticeType = "ALPPrint";
        //        chbAll.Checked = true;

        //    }

        //    if (searchby == "Teacher")
        //    {
        //        searchvalue = TextSearch.Text;
        //    }
        //    try
        //    {
        //        DataSet myDS = new DataSet();
        //        myDS = StaffList.AppraisalNoticeStaff(WorkingProfile.UserRole, User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
        //        return myDS.Tables[0];
        //      //  hfSelectedID.Value = getSelectStaffID(myDS);
        //    }
        //    catch (Exception ex)
        //    {
        //        string em = ex.Message;
        //        return null;
        //    }


        //}
        private string getSelectStaffID(DataSet DS)
        {
            string selectID = "";

            foreach (DataRow row1 in DS.Tables[0].Rows)
            {
                string employID = row1["Employee_ID"].ToString();
                selectID = selectID + ";" + employID;
            }
            return selectID;
        }
        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            BindGridViewData();
        }

        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            myList.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
            BindGridViewData();
        }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            myList.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
            BindGridViewData();
        }

        protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextSearch.Visible = false;
            ddlSearch.Visible = true;
            switch (ddlSearchby.SelectedValue)
            {
                case "ALP":
                    myList.SetLists(ddlSearch, "ALP", User.Identity.Name);
                    break;
                case "Phase":
                    myList.SetLists(ddlSearch, "AppraisalPhase", User.Identity.Name);
                    break;
                case "Process":
                    myList.SetLists(ddlSearch, "AppraisalProcess", User.Identity.Name);
                    break;
                default:
                    TextSearch.Visible = true;
                    ddlSearch.Visible = false;
                    break;
            }
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void rblNoticeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        //protected void btnBatchPrint_Click(object sender, EventArgs e)
        //{
        //    string selectID = hfSelectedID.Value;

        //    string[]  arrayID = selectID.Split(';') ; // split string on comma space
        //    Session["SelectedPrintID"] = arrayID;
        //}
    }
}