using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
using ClassLibrary;
 

namespace EPA2.EPAappraisal
{
    public partial class Text4Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetPageAttribution();
                AssemblingPageTitle();
                BindMyData("Get");
                CheckAlpExists();
                CheckPageReadonly();
            }
        }
        private void CheckAlpExists()
        {
            var parameter = new ClassLibrary.AppraisalComment()
            {
                Operate = "CheckALP",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = "ALP51" 
            };

            btnViewALP.Text = AppraisalProcess.ViewALPButtonText("CheckALP", parameter); // AppraisalDataAC.TextContent("CheckALP", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea,"ALP51");
        }
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
             AppraisalPage.SetPageAttribute(Page);


        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = hfCode.Value;
  
           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code );
        //    AppraisalPage.BuildingTextTitle(ref labelSubTitle,"SubTitle", User.Identity.Name, category, area, code );
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code+"1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code+"2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code+"3");
            AppraisalPage.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code+"4");

            //    AppraisalPage.BuildingTextTitle(ref labelMessage, "Message", User.Identity.Name, category, area, code);

            //string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", User.Identity.Name, category, area, code);
            //string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", User.Identity.Name, category, area, code);
            //string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", User.Identity.Name, category, area, code);

            string sectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (sectionStartPage.IndexOf(code) == -1)
            { btnPrevious.Enabled = true; }
            else
            {
                btnPrevious.Enabled = false;
            }

        }
        protected void BindMyData(string action )
        {
            OperationMyData(action, myText1, "1");
            OperationMyData(action, myText2, "2");
            OperationMyData(action, myText3, "3");
            OperationMyData(action, myText4, "4");
        }
        protected void MyText1_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange1.Value == "1" || hfContentChange.Value =="1")
            {
                OperationMyData("Save", myText1,"1");
                hfContentChange1.Value = "0";
            }
        }
        protected void MyText2_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange2.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save" , myText2,"2");
                hfContentChange2.Value = "0";
            }
        }
        protected void MyText3_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange3.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save", myText3,"3");
                hfContentChange3.Value = "0";
            }
        }
        protected void MyText4_TextChanged(object sender, EventArgs e)
        {
            if (hfContentChange4.Value == "1" || hfContentChange.Value == "1")
            {
                OperationMyData("Save", myText4,"4");
                hfContentChange4.Value = "0";
            }
        }
        protected void OperationMyData(string action, TextBox  myText , string textOrder)
        {
           

            var parameter = new AppraisalComment()
            {
                Operate = action,
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfApprEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value + textOrder
            };


            //   AppraisalData.TextContent(ref myText, ref textCount, action, 5000, category, area, code + textOrder, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);

         //   AppraisalData.Comments(ref myText, ref textCount, action, 5000, category, area, code + textOrder, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);
            AppraisalData.Comments(ref myText, ref textCount, action, 5000, parameter);

        }
        protected void BtnViewALP_onClick(object sender, EventArgs e)
        {
            if (btnViewALP.Text == "RollOver Last ALP")
            {
                BindMyData("RollOver");
            }
        }
        protected void BtnNext_Click(object sender, EventArgs e)
        {
            GoToNewPage("Next");
        }
        protected void BtnPrevious_Click(object sender, EventArgs e)
        {
            GoToNewPage("Previous");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
        }
        private void GoToNewPage( string action)
        {
            var parameter = new
            {
                Operate = action,
                UserID = User.Identity.Name,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                Code = hfCode.Value
            };
             string goPage = AppraisalPage.GoPage(parameter);
            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }
        protected void CheckPageReadonly()
        {
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

        }

    }
}
 