using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace EPA2.EPAappraisal
{
    public partial class ContentRecovery : System.Web.UI.Page
    {
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
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

        }
        private void AssemblePage()
        {
            var parameter = new CommonListParameter { UserID = User.Identity.Name, Operate = "SchoolYear", Para1 = WorkingAppraisee.AppraisalYear };
            AppraisalPage.BuildingList(ddlSchoolYear, "SchoolYear", parameter, WorkingAppraisee.AppraisalYear);
            InitialPage();
        }
        private void InitialPage()
        {

        }
        private void BindGridViewData()
        {
            try
            {
                GridView1.DataSource = GetDataSource();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private List<AppraisalCommentsHistory> GetDataSource()
        {
            string itemCode = Page.Request.QueryString["iCode"];
            string actionItem = Page.Request.QueryString["ActionItem"];
            string seqNo = Page.Request.QueryString["SeqNo"];
            var parameter = new DomainCompetency()
            {
                SchoolYear = ddlSchoolYear.SelectedValue,
                SchoolCode = WorkingAppraisee.AppraisalSchoolCode,
                EmployeeID = WorkingAppraisee.EmployeeID,
                SessionID = WorkingAppraisee.SessionID,
                Category = Page.Request.QueryString["type"],
                Area = Page.Request.QueryString["aID"],
                ItemCode = itemCode,
                DomainID = Page.Request.QueryString["domainID"],
                CompetencyID = Page.Request.QueryString["competencyID"],
                UserID = User.Identity.Name,

            };
            //  string sp = "dbo.EPA_Appr_AppraisalData_TextHistory @SchoolYear,@SchoolCode,@EmployeeID,@ItemCode";
            try
            {
                string action = "TextHistroy";
              
                if (itemCode.Substring(0, 4) == "SUM5")
                {
                    action = "DomainHistroy";
                   // return AppraisalData.TextHistroy("DomainHistroy", parameter);
                  //  return AppraisalData.GeneralList<AppraisalCommentsHistory>(sp, parameter);//  myDs = AppraisalDataDomain.DomainTextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, domainId, competencyId);
                }
                else
                {
                    switch (itemCode)
                    {
                        case "AGP11":
                            action = "AGPHistroy";
                            parameter.Category = actionItem;
                            parameter.Area = seqNo;
                            break;
                        case "AGP61":
                        case "AGP62":
                        case "AGP63":
                        case "AGP65":
                            parameter.ItemCode = itemCode + parameter.DomainID;
                            break; //   return AppraisalData.GeneralList<AppraisalCommentsHistory>(sp, parameter);//  myDs = AppraisalDataAC.TextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode);                           
                        default:
                            if (itemCode == "ALP5") { parameter.ItemCode = itemCode + parameter.DomainID; }
                            break; //  return AppraisalData.GeneralList<AppraisalCommentsHistory>(sp, parameter);//  myDs = AppraisalDataAC.TextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode);
                          
                    }
                }

                return AppraisalData.TextHistroy(action, parameter);

            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

 
        //private DataTable1 GetDataSource(Boolean goDatabase)
        //{
        //    string schoolyear = ddlSchoolYear.SelectedValue;
        //    string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
        //    string employeeId = WorkingAppraisee.EmployeeID;
        //    string sessionId = WorkingAppraisee.SessionID;
        //    string category = Page.Request.QueryString["type"];
        //    string area = Page.Request.QueryString["aID"];
        //    string itemCode = Page.Request.QueryString["iCode"];
        //    string domainId = Page.Request.QueryString["domainID"];
        //    string competencyId = Page.Request.QueryString["competencyID"];
        //    string seqNo = Page.Request.QueryString["SeqNo"];
        //    string actionItem = Page.Request.QueryString["ActionItem"];


        //    try
        //    {
        //        DataSet myDs = new DataSet();
        //        if (itemCode.Substring(0, 4) == "SUM5")
        //        {
        //            myDs = AppraisalDataDomain.DomainTextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, domainId, competencyId);
        //        }
        //        else
        //        {
        //            switch (itemCode)
        //            {
        //                case "AGP11":
        //                    myDs = AppraisalDataAC.TextContentHistoryAGP(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode, seqNo, actionItem);
        //                    break;
        //                case "AGP61":
        //                case "AGP62":
        //                case "AGP63":
        //                case "AGP65":
        //                    sessionId = Session["ResultTerm"].ToString();
        //                    itemCode = itemCode + domainId;
        //                    myDs = AppraisalDataAC.TextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode);
        //                    break;
        //                default:
        //                    if (itemCode == "ALP5")
        //                    { itemCode = itemCode + domainId; }
        //                    myDs = AppraisalDataAC.TextContentHistory(User.Identity.Name, schoolyear, schoolcode, employeeId, sessionId, category, area, itemCode);
        //                    break;
        //            }
        //        }
        //        return myDs.Tables[0];
        //    }
        //    catch (Exception ex)
        //    {
        //        string em = ex.Message;
        //        return null;
        //    }


        //}

        protected void ddlSchoolYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserLastWorking.SchoolYear = ddlSchoolYear.SelectedValue;
            BindGridViewData();
        }




        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridViewData();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGridViewData();
        }
    }
}