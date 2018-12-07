﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
using System.Web.UI.HtmlControls;

namespace EPA2.EPAappraisal
{
    public partial class Text3PageBPA : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                AssemblingPageTitle();
                BindMyData("Get");
                checkALPExists();
                checkPageReadonly();
            }
        }
        private void checkALPExists()
        {
            //  btnViewALP.Text = AppraisalDataAC.TextContent("CheckALP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, "ALP51");
        }
        private void setPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            AppraisalPage.SetPageAttribute(Page);


        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = hfCode.Value;
            if (Session["ResultTerm"] != null)
            {
                string ResultTerm = Session["ResultTerm"].ToString();
                myList.SetListValue(ddlResultSession, ResultTerm);
            }
            else
            {
                Session["ResultTerm"] = "Mid";
            }
            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            //    AppraisalData.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, "BPA60" + "1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, "BPA60" + "2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, "BPA60" + "3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, "BPA60" + "4");
            AppraisalData.BuildingTextTitle(ref labelSubTitle1, "SubTitle", User.Identity.Name, category, area, "BPA60" + "1");
            AppraisalData.BuildingTextTitle(ref labelSubTitle2, "SubTitle", User.Identity.Name, category, area, "BPA60" + "2");
            AppraisalData.BuildingTextTitle(ref labelSubTitle3, "SubTitle", User.Identity.Name, category, area, "BPA60" + "3");
            AppraisalData.BuildingTextTitle(ref labelSubTitle4, "SubTitle", User.Identity.Name, category, area, "BPA60" + "4");


            //    AppraisalData.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);
            string listType = "CognitiveResources";
            labelListTitle.Text = "Cognitive Resources";
            if (code == "AGP62")
            {
                listType = "SocialResources";
                labelListTitle.Text = "Social Resources";
            }
            if (code == "AGP63")
            {
                listType = "PsychologicalResources";
                labelListTitle.Text = "Psychological Resources";
            }

            myList.SetLists(CblResources, listType, User.Identity.Name);


            string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);

            string SectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (SectionStartPage.IndexOf(code) == -1)
            { btnPrevious.Enabled = true; }
            else
            {
                btnPrevious.Enabled = false;
            }

        }
        protected void BindMyData(string action)
        {
            OperationMyList(action, CblResources, "0");
            OperationMyData(action, myText2, "2");
            OperationMyData(action, myText3, "3");
            OperationMyData(action, myText4, "4");
        }
        protected void CblResources_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyList("Save", CblResources, "0");
        }

        protected void myText1_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange1.Value == "1" || hfContentChange.Value == "1")
            {
                //  OperationMyData("Save", myText1, "1");
                hfContentChange1.Value = "0";
            }
        }
        protected void myText2_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange2.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save", myText2, "2");
                hfContentChange2.Value = "0";
            }
        }
        protected void myText3_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange3.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save", myText3, "3");
                hfContentChange3.Value = "0";
            }
        }
        protected void myText4_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange4.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save", myText4, "4");
                hfContentChange4.Value = "0";
            }
        }
        protected void OperationMyData(string action, TextBox myText, string textOrder)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string session = ddlResultSession.SelectedValue;
            if (textOrder != "4")
            { session = "Mid"; }
            AppraisalData.TextContentB(ref myText, ref textCount, action, 2000, category, area, code , User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, session, hfApprEmployeeID.Value, textOrder);

        }
        protected void OperationMyList(string action, CheckBoxList myList, string textOrder)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string session = ddlResultSession.SelectedValue;
            session = "Mid"; 
            AppraisalData.CheckListB(ref myList, action, category, area, code, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, session, hfApprEmployeeID.Value , textOrder);

        }
        protected void btnViewALP_onClick(object sender, EventArgs e)
        {
            //if (btnViewALP.Text == "RollOver Last ALP")
            //{
            //    BindMyData("RollOver");
            //}
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
        }
        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string goPage = AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
        protected void checkPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);
            imgEP.Visible = false;
            imgAGP.Visible = false;
            imgRecovery.Visible = false;

        }

        protected void ddlResultSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ResultTerm"] = ddlResultSession.SelectedValue;
                BindMyData("Get");
        }
    }
}