using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class Appraisal11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string schoolyear = WorkingAppraisee.AppraisalYear;
                string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
                string sessionid = WorkingAppraisee.SessionID;
                string employeeid = WorkingAppraisee.EmployeeID;
                string tName = WorkingAppraisee.AppraiseeName;
                string phase = WorkingAppraisee.AppraisalPhase;
                string category = WorkingAppraisee.AppraisalType;
                WorkingAppraisee.AppraisalCategory = category;
                string parameters = "yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&tName=" + tName + "&phase=" + phase + "&sID=" + "Appraisal 1" + "&type=" + category;
                GoPageiFrame.Attributes.Add("src", "Loading2.aspx?pID=Summary&aID=Summary&" + parameters);

                setPageAttribution(parameters);

                //if (schoolyear == UserProfile.CurrentSchoolYear)
                //{
                //    if (WorkingAppraisee.PreviousAppraisalCompleteStatus != "Completed")
                //    { BuidingLeftMenu(); }
                //    else
                //    {
                //        string rdPage = "Appraisal11_Incompleted.aspx?pID=InComplete";
                //        Page.Response.Redirect(rdPage);
                //    }
                //}
                //else
                //{
                //    BuidingLeftMenu();
                //}
                BuidingLeftMenu();
                hfOpenbrench.Value = getDefaultOpenBranchByCategory(category, phase);

            }
        }
        private void setPageAttribution(string parameters)
        {
            hfCategory.Value = "TPA";
            hfPageID.Value = "Appraisal";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            //    UserLastWorking.AppraisalCategory = "TPA";
            hfParameters.Value = parameters;
        }
        protected void BuidingLeftMenu()
        {

            string schoolyear = WorkingAppraisee.AppraisalYear;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string sessionid = WorkingAppraisee.SessionID;
            string employeeid = WorkingAppraisee.EmployeeID;
            string tName = WorkingAppraisee.AppraiseeName;
            string phase = WorkingAppraisee.AppraisalPhase;
            string category = WorkingAppraisee.AppraisalType;
            AppraisalLeftMenu.BuildingMenu(ref myLeftMenu, category, User.Identity.Name, schoolyear, sessionid, phase, employeeid, schoolcode, WorkingProfile.UserRole);
        }
        private string getDefaultOpenBranchByCategory(string category, string phase)
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