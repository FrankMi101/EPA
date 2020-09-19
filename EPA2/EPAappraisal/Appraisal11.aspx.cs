using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ClassLibrary;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //string schoolyear = WorkingAppraisee.AppraisalYear;
                //string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                //string sessionId = WorkingAppraisee.SessionID;
                //string employeeId = WorkingAppraisee.EmployeeID;
                //string tName = WorkingAppraisee.AppraiseeName;
                //string phase = WorkingAppraisee.AppraisalPhase;
                //string category = WorkingAppraisee.AppraisalType;
 

                string goPage = Page.Request.QueryString["pID"];
                string schoolyear = Page.Request.QueryString["yID"];
                string schoolcode = Page.Request.QueryString["cID"];
                string employeeId = Page.Request.QueryString["tID"];
                string sessionId = Page.Request.QueryString["sID"];
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string category = Page.Request.QueryString["type"];

                var queryValue = AppraisalPage.GetQueryValue(Page);
                string parameters = AppraisalPage.GetQueryString(queryValue);
                 
               WorkingAppraisee.AppraisalCategory = category;

                hfApprYear.Value = schoolyear;
                hfApprSchool.Value = schoolcode;
                hfApprEmployeeID.Value = employeeId;
                hfApprSession.Value = sessionId;
                hfTeacherName.Value = tName;





                //   string parameter = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeId + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionId + "&type=" + category;


                //  string parameters =  "&yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeId + "&tName=" + tName + "&phase=" + phase + "&sID=" + sessionId + "&type=" + category;
                goPage = "Loading2.aspx?pID=Summary&aID=Summary&" + parameters;
                GoPageiFrame.Attributes.Add("src", goPage);

                SetPageAttribution(parameters);

 
                BuidingLeftMenu(parameters);
                hfOpenbrench.Value = GetDefaultOpenBranchByCategory(category, phase);

            }
        }
        private void SetPageAttribution(string parameters)
        {
            hfCategory.Value = "TPA";
            hfPageID.Value = "Appraisal";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            //    UserLastWorking.AppraisalCategory = "TPA";
            hfParameters.Value = parameters;
        }
        protected void BuidingLeftMenu( string queryStr)
        { 
            var parameter = new AppraisalComment()
            {
                Operate = "0",
                UserID = User.Identity.Name,
                SchoolYear =   Page.Request.QueryString["yID"],
                SchoolCode = Page.Request.QueryString["cID"],
                EmployeeID = Page.Request.QueryString["tID"],
                SessionID = Page.Request.QueryString["sID"],
                Category = Page.Request.QueryString["type"],
                Area = "",
                ItemCode = "",
                Phase = Page.Request.QueryString["phase"],
                AppraisalRole = WorkingProfile.UserAppraisalRole
            };


            AppraisalLeftMenuFromList.BuildingMenu(ref myLeftMenu, parameter, queryStr);
        }
        private string GetDefaultOpenBranchByCategory(string category, string phase)
        {
            string rVal = "";
            switch (phase)
            {
                case "E":
                case "LTO":
                case "NTP":
                    rVal = "leafMenuSUM";
                    break;
                default:
                    if (category == "PPA")
                    { rVal = "leafMenuAGP"; }
                    else
                    { rVal = "leafMenuALP"; }
                    break;

            }
            return rVal;
        }


    }
}