﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class Content_LookFors : System.Web.UI.Page
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
            hfPageID.Value = "AppraisalList";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();

        }
        private void AssemblePage()
        {
            myList.SetLists(ddlSchoolYear, "SchoolYear", User.Identity.Name);
            myList.SetListValue(ddlSchoolYear, WorkingAppraisee.AppraisalYear);
            InitialPage();
        }
        private void InitialPage()
        {

        }
        private void BindGridViewData()
        {
            try
            {
                GridView1.DataSource = GetDataSource(true);
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                var em = ex.Message;
            }

        }
        private DataTable GetDataSource(Boolean goDatabase)
        {
            string schoolyear = ddlSchoolYear.SelectedValue;
            string schoolcode = WorkingAppraisee.AppraisalSchoolCode;
            string employeeID = WorkingAppraisee.EmployeeID;
            string sessionID = WorkingAppraisee.SessionID;
            string category = Page.Request.QueryString["type"];
            string area = Page.Request.QueryString["aID"];
            string itemCode = Page.Request.QueryString["iCode"];
            string domainID = Page.Request.QueryString["domainID"];
            string competencyID = Page.Request.QueryString["competencyID"];


            try
            {
                DataSet myDS = new DataSet();
                
                    myDS = AppraisalDataDomain.DomainTextContentLookFors(User.Identity.Name, schoolyear, schoolcode, employeeID, sessionID, category, area, itemCode, domainID, competencyID);
               
                return myDS.Tables[0];
            }
            catch (Exception ex)
            {
                string em = ex.Message;
                return null;
            }


        }

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