
using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace EPA2.EPAmanage
{
    public partial class AppraisalNoticeList : System.Web.UI.Page
    {
        string webSite = WebConfig.getValuebyKey("ApplicationSite");//  " <a href=' " + WebConfig.getValuebyKey("ApplicationSite") + "' target='_blank'>  Teacher Performance Appraisal </a>";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
                SetPageAttribution();
                AssemblePage();
                BindGridViewData();
            }
        }
        private void SetPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "NoticeList";
            hfCode.Value = "NoticeList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            hfWebSite.Value = webSite;
        }
        private void AssemblePage()
        {
            var parameter = new CommonListParameter() { Operate = "SchoolList", UserID = User.Identity.Name, Para1 = WorkingProfile.UserRole, Para2 = WorkingProfile.SchoolYear, Para3 = WorkingProfile.SchoolCode };

            AppraisalPage.BuildingList(ddlSchoolYear, "SchoolYear", User.Identity.Name, "", "", "", UserProfile.CurrentSchoolYear);
            AppraisalPage.BuildingList(ddlSchoolCode, ddlSchool, "SchoolList", parameter, WorkingProfile.SchoolCode);
            InitialPage();
        }
        private void InitialPage()
        {
            if (WorkingProfile.SchoolCode == "")
            {
                ddlSchool.SelectedIndex = 0;
                AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
                WorkingProfile.SchoolCode = ddlSchool.SelectedValue;
            }
            else
            {
                AppraisalPage.SetListValue(ddlSchool, WorkingProfile.SchoolCode);
                AppraisalPage.SetListValue(ddlSchoolCode, WorkingProfile.SchoolCode);

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

                GridView1.DataSource = GetDataSource();
                GridView1.DataBind();
                //  AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "DataSet", User.Identity.Name,   schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
                // AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "iList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);
                // AppraisalGridViewData.BindMyGridView(ref GridView1, "NoticeList", "dList", User.Identity.Name, schoolyear, schoolcode, searchby, searchvalue, noticeType, noticeArea);

                GetEmailTemplate();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<AppraisalNotice> GetDataSource()
        {

            string searchby = ddlSearchby.SelectedValue;
            string searchvalue = ddlSearch.SelectedValue;
            string noticeType = rblNoticeType.SelectedValue; // "AppraisalStart";

            if (Page.Request.QueryString["nType"] == "ALPBatch")
            {
                noticeType = "ALPPrint";
                chbAll.Checked = true;
            }

            if (searchby == "Teacher") searchvalue = TextSearch.Text;
            var parameter = new
            {
                Operate = "Get",
                UserID = User.Identity.Name,
                SchoolYear = ddlSchoolYear.SelectedValue,
                SchoolCode = ddlSchool.SelectedValue,
                SearchBy = searchby,
                SearchValue = searchvalue,
                NoticeType = noticeType,
                NoticeArea = rblNoticeType.SelectedValue
            };
         //   BaseData.ShowSP( "AppraisalManage", "AppraisalStaffsNotice",btnSearch  );
        //    return StaffManagement.AppraisalStaffsNotice(parameter);
             return BaseData.GeneralList<AppraisalNotice>("AppraisalManage", "AppraisalStaffsNotice", parameter, btnSearch);
       }

        private void GetEmailTemplate()
        {
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            string noticeType = "AppraisalStart";
            string noticeArea = rblNoticeType.SelectedValue;
            hfNoticeType.Value = noticeType;
            Session["NoticeType"] = noticeType;
            string purpose = "Notice";
            TextSubject.Text = GetNoticeFile.EMailContentByType("GetSubject", User.Identity.Name, "TPA", noticeType, noticeArea, "Appraisee", "Appraiser", purpose);
            string myBody = GetNoticeFile.EMailContentByType("GetBody", User.Identity.Name, "TPA", noticeType, noticeArea, "Appraisee", "Appraiser", purpose);
            myBody = myBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
            myBody = myBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
            myBody = myBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingProfile.SchoolYear);
         //   myBody = myBody.Replace("{{PlaceHolder:AppraisalCategory}}", noticeArea);
            myBody = myBody.Replace("{{PlaceHolder:WebSite}}", webSite);
            myBody = myBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
            myBody = myBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
            myBody = myBody.Replace("{{PlaceHolder:OneLine}}", "");

            myText.Text = myBody;

        }

        //private string GetSelectStaffId(DataSet ds)
        //{
        //    string selectId = "";

        //    foreach (DataRow row1 in ds.Tables[0].Rows)
        //    {
        //        string employId = row1["Employee_ID"].ToString();
        //        selectId = selectId + ";" + employId;
        //    }
        //    return selectId;
        //}
        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            BindGridViewData();
        }

        protected void ddlSchool_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;
            AppraisalPage.SetListValue(ddlSchoolCode, ddlSchool.SelectedValue);
            BindGridViewData();
        }
        protected void ddlSchoolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolCode = ddlSchoolCode.SelectedValue;

            AppraisalPage.SetListValue(ddlSchool, ddlSchoolCode.SelectedValue);
            BindGridViewData();
        }

        protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextSearch.Visible = false;
            ddlSearch.Visible = true;
            switch (ddlSearchby.SelectedValue)
            {
                case "ALP":

                    AppraisalPage.BuildingList(ddlSearch, "ALP", User.Identity.Name, "", "", "");
                    break;
                case "Phase":

                    AppraisalPage.BuildingList(ddlSearch, "AppraisalPhase", User.Identity.Name, "", "", "");
                    break;
                case "Process":

                    AppraisalPage.BuildingList(ddlSearch, "AppraisalProcess", User.Identity.Name, "", "", "");
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



    }
}