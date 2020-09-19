using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
namespace EPA2.EPAappraisal
{
    public partial class Text4PageApm : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           AssemblingPageTitle();
           if (!Page.IsPostBack)
            {
                Page.Response.Expires = 0;
          
               SetPageAttribution();
               
                BindMyData("Get");
                CheckPageReadonly();   
            }
       

        }
        
        private void SetPageAttribution()
        {
            hfUserID.Value = User.Identity.Name;
            hfFirstName.Value = WorkingAppraisee.AppraiseeName;
            AppraisalPage.SetPageAttribute(Page);


        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

           AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);     
            string sectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
            if (sectionStartPage.IndexOf(code) == -1)
            { btnPrevious.Enabled = true; }
            else
            {
                btnPrevious.Enabled = false;
            }
        }

         
        protected void BindMyData(string action)
        {            
            OperationMyData(action, TextMeetingContent1, MeetingDate1, "1");
            OperationMyData(action, TextMeetingContent2, MeetingDate2, "2");
            OperationMyData(action, TextMeetingContent3, MeetingDate3, "3");
            OperationMyData(action, TextMeetingContent4, MeetingDate4, "4");

       
        }
        
       
        
        protected void OperationMyData(string action, TextBox myText, HtmlInputText myDate, string textOrder)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;

            var parameter = new ClassLibrary.AppraisalDateText()
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

            AppraisalData.DateTextContent(ref myText, ref myDate, ref textCount, 500, action, parameter); //  category, area, code + textOrder, User.Identity.Name,  hfApprYear.Value, hfApprSchool.Value, hfApprSession.Value, hfApprEmployeeID.Value);

        }
       

        protected void CheckPageReadonly()
        {
            string category = WorkingAppraisee.AppraisalType;
            AppraisalPage.CheckPageReadOnly(Page, "Both", User.Identity.Name);

        }

        protected void MeetingDate1_DateChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save", TextMeetingContent1, MeetingDate1, "1");
                hfContentChange.Value = "0";
            }
        }
        protected void MeetingDate2_DateChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            { 
                OperationMyData("Save", TextMeetingContent2, MeetingDate2, "2");
                hfContentChange.Value = "0";
             }
        }
        protected void MeetingDate3_DateChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            { 
                OperationMyData("Save", TextMeetingContent3, MeetingDate3, "3");
                hfContentChange.Value = "0";
            } 
             
        }
        protected void MeetingDate4_DateChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {  
                OperationMyData("Save", TextMeetingContent4, MeetingDate4, "4");
                hfContentChange.Value = "0";
               }
        }

        protected void TextMeetingContent1_TextChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save", TextMeetingContent1, MeetingDate1, "1");
                hfContentChange.Value = "0";
            }
        }
        protected void TextMeetingContent2_TextChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save", TextMeetingContent2, MeetingDate2, "2");
                hfContentChange.Value = "0";
            }
        }
        protected void TextMeetingContent3_TextChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save", TextMeetingContent3, MeetingDate3, "3");
                hfContentChange.Value = "0";
            }
        }
        protected void TextMeetingContent4_TextChange(object sender, EventArgs e)
        {
            if (hfContentChange.Value == "1")
            {
                OperationMyData("Save", TextMeetingContent4, MeetingDate4, "4");
                hfContentChange.Value = "0";
            }
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

    
    }
}
