

using ClassLibrary;
using System;
using System.Runtime.Remoting.Messaging;
using System.Web.UI;

namespace EPA2.EPAmanage
{
    public partial class AppraisalAdjustment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string tName = Page.Request.QueryString["tName"];
                string phase = Page.Request.QueryString["phase"];
                string category = Page.Request.QueryString["type"];
                LabelMessage.Text = tName + ":   Appraisal phase = " +  phase +  " Appraisal Type = " + category;

                SetPageAttribution(); 
            }
        }

        private void SetPageAttribution()
        {
           // string schoolyearparameter = "?yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + tName + "&IDs=" + ds + "&phase=" + phase;

             string SchoolYear = Page.Request.QueryString["yID"];
            string SchoolCode = Page.Request.QueryString["cID"];
 
            var parameters = new CommonListParameter() { Operate = "", UserID = User.Identity.Name, Para1 = "TPA", Para2 = SchoolCode, Para3 = SchoolYear };

            AppraisalPage.BuildingList(ddlSchoolYearFrom, "SchoolYear", parameters,  SchoolYear);
            AppraisalPage.BuildingList(ddlSchoolYearTo, "SchoolYear", parameters, SchoolYear);
            AppraisalPage.BuildingList(ddlSessionForm, "AppraisalSession", parameters, "Appraisal1");
            AppraisalPage.BuildingList(ddlSessionTo, "AppraisalSession", parameters, "Appraisal1");
            AppraisalPage.BuildingList(ddlWorkAreaFrom, "AppraisalArea", parameters, "ALP");
            AppraisalPage.BuildingList(ddlWorkAreaTo, "AppraisalArea", parameters, "ALP");

            parameters.Para1 = "Principal";
            AppraisalPage.BuildingList(ddlSchoolCodeForm, ddlSchoolForm, "SchoolList", parameters, SchoolCode);
            AppraisalPage.BuildingList(ddlSchoolCodeTo, ddlSchoolTo, "SchoolList", parameters, SchoolCode);
 

            hfCategory.Value = Page.Request.QueryString["type"]; ;
            hfPageID.Value = "AppraisalAdjustment";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRole;
            hfRunningModel.Value = WebConfig.RunningModel();
        }
        
      
        protected void BtnRemove_Click(object sender, EventArgs e)
        {
            SaveAction("Remove");
        }
        protected void BtnSign_Click(object sender, EventArgs e)
        {
            SaveAction("SignOff");
        }
        protected void BtnCopy_Click(object sender, EventArgs e)
        {
            SaveAction("Copy");
        }
        protected void BtnMove_Click(object sender, EventArgs e)
        {
            SaveAction("Move");
        }
        private void SaveAction(string action)
        {
 
            var actinoInfo = new  
            {   Operate = action,
                UserID = User.Identity.Name,
                EmployeeID =  Page.Request.QueryString["tID"],
                Category = hfCategory.Value,
                ItemCode = ddlWorkAreaFrom.SelectedValue,
                SchoolYear = ddlSchoolYearFrom.SelectedValue,
                SchoolCode = ddlSchoolForm.SelectedValue,
                SessionID = ddlSessionForm.SelectedValue,
                SchoolYearTo = ddlSchoolYearTo.SelectedValue,
                SchoolCodeTo = ddlSchoolTo.SelectedValue,
                SessionIDTo = ddlSessionTo.SelectedValue 
            };

             
            string result = BaseData.GeneralValue<string>("dbo.EPA_Appr_AppraisalAdjustment", actinoInfo);
            string tName = Page.Request.QueryString["tName"];
            LabelMessage.Text = tName + "'s Appraisal " + action + " " + result;
        }
       

    }
}