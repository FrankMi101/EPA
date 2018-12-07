using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;

namespace EPA2.EPAappraisal
{
    public partial class StrategyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                AssemblingPageTitle();
                BindMyData();
                checkPageReadonly();
            }
        }
        private void setPageAttribution()
        {

            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);

            if (WorkingAppraisee.AppraisalType == "LTO")
            {
                hfCategory.Value = "NTP";
            }
   
        }

        private void AssemblingPageTitle()
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            //    AppraisalData.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");

            //    AppraisalData.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);

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
        protected void BindMyData()
        {
            OperationMyLabel("Get", Label11, "1");
            OperationMyLabel("Get", Label21, "2");
            OperationMyCheckBox("Get", CheckBox14, "1");
            OperationMyCheckBox("Get", CheckBox24, "2");
            OperationMyData("Get", TextBox1G, "1","G");
            OperationMyData("Get", TextBox1S, "1","S");
            OperationMyData("Get", TextBox2G, "2","G");
            OperationMyData("Get", TextBox2S, "2","S");

            Trow3.Visible = false;
            Trow4.Visible = false;
            Trow5.Visible = false;
            if (hfCode.Value != "STR11")
            {
                Trow3.Visible = true;
                OperationMyLabel("Get", Label31, "3");
                OperationMyCheckBox("Get", CheckBox34, "3");
                OperationMyData("Get", TextBox3G, "3","G");
                OperationMyData("Get", TextBox3S, "3","S");
            }
            if (hfCode.Value == "STR22")
            {
                Trow4.Visible = true;
                Trow5.Visible = true;
                OperationMyLabel("Get", Label41, "4");
                OperationMyLabel("Get", Label51, "5");
                OperationMyCheckBox("Get", CheckBox44, "4");
                OperationMyCheckBox("Get", CheckBox54, "5");
                OperationMyData("Get", TextBox4G, "4","G'");
                OperationMyData("Get", TextBox4S, "4","S");
                OperationMyData("Get", TextBox5G, "5","G");
                OperationMyData("Get", TextBox5S, "5","S");
            }

            if (hfCode.Value == "STR33")
            {
                TextBox1G.Height = 150;
                TextBox1S.Height = 150;
                TextBox2G.Height = 150;
                TextBox2S.Height = 150;
                TextBox3G.Height = 150;
                TextBox3S.Height = 150;
            }
            if (hfCode.Value == "STR11")
            {
                TextBox1G.Height = 200;
                TextBox1S.Height = 200;
                TextBox2G.Height = 200;
                TextBox2S.Height = 200; 
            }
        }
        protected void TextBox_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                string xID = ((System.Web.UI.Control)sender).ID ;
                string xNo = xID.Substring(7,1); 
                OperationMyData("Save", (TextBox)sender, xNo,"");
              //  hfContentChange1.Value = "0";
            }
        }

        protected void CheckBox_Changed(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                string xID = ((System.Web.UI.Control)sender).ID;
                string xNo = xID.Substring(8, 1);
                OperationMyCheckBox("Save", (CheckBox ) sender , xNo);
              //  hfContentChange4.Value = "0";
            }
        }
        protected void OperationMyData(string action, TextBox myText, string textNo, string type)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.STRTextContent(ref myText, ref textCount, action, 500, category, area, code + textNo, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
        protected void OperationMyLabel(string action, Label myLabel, string textNo)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.STRLabelContent(ref myLabel, action, category, area, code + textNo, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
        }
        protected void OperationMyCheckBox(string action, CheckBox myCheck, string textNo)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.STRCheckBoxContent(ref myCheck, action, category, area, code + textNo, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
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

        }
    }
}
