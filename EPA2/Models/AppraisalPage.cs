using System.Web;
using System.Data;
using System.Web.Security;
using System.Web.UI;
/// <summary>
/// Summary description for WorkingProfile
/// </summary>
/// 
using DataAccess;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EPA2
{
    public class AppraisalPage : System.Web.UI.Page
    {
        public AppraisalPage()
        {

        }
        public static void SetPageAttribute(Page myPage)
        {
            try
            {
                var myControl = (HiddenField)myPage.FindControl("hfCategory");
                myControl.Value = WorkingAppraisee.AppraisalType;
                myControl = (HiddenField)myPage.FindControl("hfPageID");
                myControl.Value = WorkingAppraisee.AppraisalArea;
                myControl = (HiddenField)myPage.FindControl("hfCode");
                myControl.Value = WorkingAppraisee.AppraisalCode;
                myControl = (HiddenField)myPage.FindControl("hfArea");
                myControl.Value = WorkingAppraisee.AppraisalArea;
                myControl = (HiddenField)myPage.FindControl("hfUserLoginRole");
                myControl.Value = WorkingProfile.UserRoleLogin;
                myControl = (HiddenField)myPage.FindControl("hfRunningModel");
                myControl.Value = WebConfig.RunningModel();
                myControl = (HiddenField)myPage.FindControl("hfContentChange");
                myControl.Value = "0";
                myControl = (HiddenField)myPage.FindControl("hfApprYear");
                myControl.Value = WorkingAppraisee.AppraisalYear;
                myControl = (HiddenField)myPage.FindControl("hfApprSchool");
                myControl.Value = WorkingAppraisee.AppraisalSchoolCode;
                myControl = (HiddenField)myPage.FindControl("hfApprSession");
                myControl.Value = WorkingAppraisee.SessionID;
                myControl = (HiddenField)myPage.FindControl("hfApprEmployeeID");
                myControl.Value = WorkingAppraisee.EmployeeID;
            }
            catch
            {

            }
            try
            {
                string SectionStartPage = WebConfig.getValuebyKey("SectionStartPage");//  " ALP11,AGP11,STR11";
                var mybutton = (Button)myPage.FindControl("btnPrevious");
                if (SectionStartPage.IndexOf(WorkingAppraisee.AppraisalCode) == -1)
                { mybutton.Enabled = true; }
                else
                {
                    mybutton.Enabled = false;
                }
                mybutton = (Button)myPage.FindControl("btnNext");
                if (WorkingAppraisee.AppraisalCode == "99")
                { mybutton.Enabled = false; }
                else
                {
                    mybutton.Enabled = true;
                }

            }
            catch
            { }


        }
        public static void SetPageAttribute2(Page myPage)
        {
            try
            {
                var myControl = (HiddenField)myPage.FindControl("hfCategory");
                myControl.Value = WorkingProfile.PageCategory;
                myControl = (HiddenField)myPage.FindControl("hfPageID");
                myControl.Value = WorkingProfile.PageItem;
                myControl = (HiddenField)myPage.FindControl("hfCode");
                myControl.Value = WorkingProfile.PageItem;
                myControl = (HiddenField)myPage.FindControl("hfArea");
                myControl.Value = WorkingProfile.PageArea;
                myControl = (HiddenField)myPage.FindControl("hfUserLoginRole");
                myControl.Value = WorkingProfile.UserRoleLogin;
                myControl = (HiddenField)myPage.FindControl("hfRunningModel");
                myControl.Value = WebConfig.RunningModel();
                myControl = (HiddenField)myPage.FindControl("hfContentChange");
                myControl.Value = "0";
            }
            catch
            {

            }
        }

        public static void CheckPageReadOnly(Page myPage, string checkType, string loginUserID)
        {

            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;
            string pageFor = AppraisalProcess.AppraisalPageItem("PageActiveFor", myPage.User.Identity.Name, category, area, code);
            string pageRecover = AppraisalProcess.AppraisalPageItem("PageRecover", myPage.User.Identity.Name, category, area, code);
            string pageHelpe = AppraisalProcess.AppraisalPageItem("PageHelp", myPage.User.Identity.Name, category, area, code);
            string pageEP = AppraisalProcess.AppraisalPageItem("PageEP", myPage.User.Identity.Name, category, area, code);

            string AppraislRole = WorkingProfile.UserAppraisalRole; //  AppraisalProcess.AppraisalActionRole(category, WorkingProfile.UserRole, WorkingAppraisee.UserID, User.Identity.Name);
            string SignOff = SignatureProcess.SignOffComplete(checkType, myPage.User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, category, area, WorkingProfile.UserRole);
            var hfSignOff = (HiddenField)myPage.FindControl("hfSignOff");
            hfSignOff.Value = SignOff;
            var hfPageReadonly = (HiddenField)myPage.FindControl("hfPageReadonly");
            hfPageReadonly.Value = "No";
            var imgSignOff = (HtmlImage)myPage.FindControl("imgSignOff");
            try
            {
                imgSignOff.Visible = false;

                if (SignOff == "Complete")
                {
                    hfPageReadonly.Value = "Yes";
                    imgSignOff.Visible = true;
                }
                else
                {
                    if (myPage.User.Identity.Name.ToLower() == WorkingAppraisee.UserID.ToLower() || myPage.User.Identity.Name.ToLower() == WorkingAppraisee.AppraiserID.ToLower())
                    {
                        if (pageFor == "Both")
                            { hfPageReadonly.Value = "No"; }
                        else
                        {
                            if (pageFor == AppraislRole)
                                { hfPageReadonly.Value = "No"; }
                            else
                                { hfPageReadonly.Value = "Yes"; }
                        }
                    }
                    else
                    {
                        if (WorkingProfile.UserRole == "Admin")
                            { hfPageReadonly.Value = "No"; }
                        else
                             { hfPageReadonly.Value = "Yes"; }
                    }
                }
            }
            catch
            { }

            try
            {

                hfPageReadonly = (HiddenField)myPage.FindControl("hfPageReadonly");
                var imgRecovery = (HtmlImage)myPage.FindControl("imgRecovery");
                var imgCommentsMenu = (HtmlImage)myPage.FindControl("imgCommentsMenu");
                var imgEP = (HtmlImage)myPage.FindControl("imgEP");

                if (hfPageReadonly.Value == "Yes")
                {
                    imgRecovery.Visible = false;
                    imgCommentsMenu.Visible = false;
                }
                else
                {
                    imgCommentsMenu.Visible = true;
                    if (pageRecover == "Y")
                    { imgRecovery.Visible = true; }
                }
                if (pageEP == "Y")
                {
                    imgEP.Visible = true;
                }
            }
            catch
            { }

        }

    }

}