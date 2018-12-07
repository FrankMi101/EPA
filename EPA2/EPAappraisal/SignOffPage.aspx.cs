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
    public partial class SignOffPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                setPageAttribution();
                AllowViewPermissionCheck();
                BindMyData();
                setExtContentRow();

            }
            AssemblingPageTitle();
        }
        private void setPageAttribution()
        {
            txtDomain.Text = WebConfig.DomainName();
            hfUserID.Value = User.Identity.Name;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfAppraiserID.Value = WorkingAppraisee.AppraiserID;
            AppraisalPage.SetPageAttribute(Page);

            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserID);

            if (hfAppraisalActionRole.Value == "Appraisee")
            { txtUserName.Text = WorkingAppraisee.UserID; }
            else
            {
                if (WorkingProfile.UserRole == "SO" || WorkingProfile.UserRole == "Admin")
                {
                    CheckBoxEnforce.Visible = true;
                    txtUserName.Text = User.Identity.Name;
                }
                else
                { txtUserName.Text = WorkingAppraisee.AppraiserID; }
            }
        }

        private void AssemblingPageTitle()
        {
            string category = WorkingAppraisee.AppraisalType;
            string area = WorkingAppraisee.AppraisalArea;
            string code = WorkingAppraisee.AppraisalCode;

            AppraisalLeftMenu.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalData.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalData.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalData.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalData.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");
            AppraisalData.BuildingTextTitle(ref labelTitle5, "Title", User.Identity.Name, category, area, code + "5");
            AppraisalData.BuildingTextTitle(ref labelTitle6, "Title", User.Identity.Name, category, area, code + "6");
            AppraisalData.BuildingTextTitle(ref labelTitleX, "Title", User.Identity.Name, category, area, code + "X");


            AppraisalData.BuildingTextMessage(ref labelMessage1, "Message", User.Identity.Name, category, area, code + "1");
            AppraisalData.BuildingTextMessage(ref labelMessage3, "Message", User.Identity.Name, category, area, code + "3");
            AppraisalData.BuildingTextMessage(ref labelMessage5, "Message", User.Identity.Name, category, area, code + "5");

            hfDigitalSignatureReady.Value = SignatureProcess.DigitalSignature("Read", User.Identity.Name, WorkingProfile.UserEmployeeID);
            if (hfDigitalSignatureReady.Value == "Yes")
            {
                chbCreateDS.Checked = false;
                chbCreateDS.Visible = false;
            }
            else
            {
                chbCreateDS.Checked = true;
                chbCreateDS.Visible = true;
            }

        }
        private void setExtContentRow()
        {
            string code = WorkingAppraisee.AppraisalCode;
            ExtContentRow.Visible = false;
            //ExtContentRow2.Visible = false;
            //ExtContentRow3.Visible = false;
            ExtContentRow4.Visible = false;
            MyDate.Visible = false;
            btnYesNo.Visible = false;

            switch (code)
            {
                case "ENR95":
                case "IMP95":
                    //ExtContentRow2.Visible = true;
                    //ExtContentRow3.Visible = true;
                    ExtContentRow4.Visible = true;
                    ExtContentRow.Visible = true;
                    MyDate.Visible = true;
                    MyDate.Value = AppraisalDataAC.NotesContent("Date", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    break;
                case "ALP95":
                    imgNoticePermission.Visible = false;
                    ExtContentRow.Visible = true;
                    ExtContentRow2.Visible = false;
                    ExtContentRow3.Visible = false;
                    ExtContentRow5.Visible = false;
                    MyDate.Visible = true;
                    MyDate.Value = AppraisalDataAC.NotesContent("Date", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    break;
                case "STR95":
                    ExtContentRow.Visible = true;
                    ExtContentRow2.Visible = false;
                    btnYesNo.Visible = true;
                    string selectValue = AppraisalDataAC.NotesContent("Chose", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    myList.SetListValue(btnYesNo, selectValue);
                    if (WorkingAppraisee.AppraisalType == "LTO")
                    {
                        ExtContentRow.Visible = false;
                    }

                    break;
                default:
                    ExtContentRow.Visible = false;
                    MyDate.Visible = false;
                    btnYesNo.Visible = false;
                    string AppraisalRate = AppraisalDataAC.RatingListContent(User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    if (AppraisalRate == "4")
                    {
                        ExtContentRow2.Visible = true;
                    }
                    break;
            }



        }
        protected void BindMyData()
        {
            TextSignOffNameAppraisee.Text = SignatureProcess.SignOffName("Appraisee", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffNameAppraiser.Text = SignatureProcess.SignOffName("Appraiser", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffNameSupervisory.Text = SignatureProcess.SignOffName("Supervisory", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateAppraisee.Text = SignatureProcess.SignOffDate("Appraisee", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateAppraiser.Text = SignatureProcess.SignOffDate("Appraiser", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateSupervisory.Text = SignatureProcess.SignOffDate("Supervisory", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);

            hfSignOffAppraisee.Value = SignatureProcess.SignOffComplete("Appraisee", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffAppraiser.Value = SignatureProcess.SignOffComplete("Appraiser", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffSupervisory.Value = SignatureProcess.SignOffComplete("Supervisory", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffComplete.Value = SignatureProcess.SignOffComplete("Both", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffAction.Value = SignatureProcess.SignOffName("Appraisal", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);
            hfNoticeAction.Value = SignatureProcess.SignOffName("NoticeAction", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);

            hfNoticeAppraisee.Value = SignatureProcess.NoticeDate("Appraisee", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);
            hfNoticeAppraiser.Value = SignatureProcess.NoticeDate("Appraiser", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);
            hfNoticeSupervisory.Value = SignatureProcess.NoticeDate("Supervisory", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);
            hfNoticePermission.Value = SignatureProcess.NoticeDate("Permission", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "AppraisalAction", hfArea.Value);
            hfCurrentdatetime.Value = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
            string demandUnDosignOffRole = SignatureProcess.SignOffName("DemandUserRole", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);
            string SignOffCompleteIndicate = "InComplete";

            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
            if (hfAppraisalActionRole.Value == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string category = WorkingAppraisee.AppraisalCategory;
            string templateArea = (category == "PPA") ? "PPA" : "EPA";
            hfNoticeAuto.Value = GetNoticeFile.eMailContentByTemplate("AutoNotice", User.Identity.Name, category, "SignOff", templateArea, noticeGo, noticeFrom, purpose);

            urlDemandAppraiseeRow.Visible = false;
            urlDemandAppraiserRow.Visible = false;
            if (hfSignOffAppraisee.Value == "Complete")
            {
                if (demandUnDosignOffRole == "Appraisee")
                {
                    imgsignoffAppraisee.Attributes.Add("src", "../images/signatureAsk.png");
                    urlDemandAppraiserRow.Visible = true;
                }
                else
                { imgsignoffAppraisee.Attributes.Add("src", "../images/signatureDone.png"); }
            }
            if (hfSignOffAppraiser.Value == "Complete")
            {
                if (demandUnDosignOffRole == "Appraiser")
                {
                    imgsignoffAppraiser.Attributes.Add("src", "../images/signatureAsk.png");
                    urlDemandAppraiseeRow.Visible = true;
                }
                else
                {
                    imgsignoffAppraiser.Attributes.Add("src", "../images/signatureDone.png");
                }
            }
            if (hfSignOffSupervisory.Value == "Complete")
            {
                imgsignoffSupervisory.Attributes.Add("src", "../images/signatureDone.png");
            }
            if (hfNoticeAppraisee.Value != "")
            {
                imgNoticeAppraisee.Attributes.Add("src", "../images/emailok.png");
                imgNoticeAppraisee.Attributes.Add("title", "Sign Off at " + hfNoticeAppraisee.Value);
            }
            if (hfNoticeAppraiser.Value != "")
            {
                imgNoticeAppraiser.Attributes.Add("src", "../images/emailok.png");
                imgNoticeAppraiser.Attributes.Add("title", "Sign Off at " + hfNoticeAppraiser.Value);
            }
            if (hfNoticeSupervisory.Value != "")
            {
                imgNoticeSupervisory.Attributes.Add("src", "../images/emailok.png");
                imgNoticeSupervisory.Attributes.Add("title", "Sign Off at " + hfNoticeSupervisory.Value);
            }
            if (hfNoticePermission.Value != "")
            {
                imgNoticePermission.Attributes.Add("src", "../images/emailok.png");
                imgNoticePermission.Attributes.Add("title", "Sign Off at " + hfNoticePermission.Value);
            }
            if (hfAppraisalActionRole.Value == "Appraisee")
            {
                CheckBoxEnforce.Enabled = false;
                hfCurrentUserName.Value = WorkingAppraisee.AppraiseeName; ;
                btnYesNo.Enabled = false;
                imgNoticePermission.Visible = false;
                rblViewPermission.Enabled = false;
                if (rblViewPermission.SelectedValue == "SignOff")
                {
                    imgsignoffAppraisee.Disabled = false;
                }
                SignOffCompleteIndicate = hfSignOffAppraisee.Value;
            }
            if (hfAppraisalActionRole.Value == "Appraiser")
            {
                hfCurrentUserName.Value = WorkingAppraisee.AppraiserName;
                // imgsignoffAppraisee.Disabled = true;
                if (hfCode.Value == "ALP95")
                {
                    if (hfSignOffAppraisee.Value == "Complete")
                    {
                        imgsignoffAppraiser.Disabled = false;
                    }
                    else
                    { imgsignoffAppraiser.Disabled = true; }
                }
                else
                {
                    imgsignoffAppraiser.Disabled = false;
                    btnYesNo.Enabled = true;
                }
                SignOffCompleteIndicate = hfSignOffAppraiser.Value;

            }
            if (hfAppraisalActionRole.Value == "Supervisory")
            {
                hfCurrentUserName.Value = WorkingProfile.UserName;
                imgsignoffSupervisory.Disabled = false;
                btnYesNo.Enabled = true;
                SignOffCompleteIndicate = hfSignOffSupervisory.Value;
            }
            string showText = "Sign Off";

            if (SignOffCompleteIndicate == "Complete")
            {
                if (hfSignOffComplete.Value == "Complete")
                {
                    showText = "Demand Undo Sign Off";
                }
                else
                { showText = "Undo Sign Off"; }
            }
            if (urlDemandAppraiserRow.Visible == true || urlDemandAppraiseeRow.Visible == true)
            {
                showText = "Authorize Undo Sign Off";
            }
            btnSignOff.Text = showText;
            LabelSignOffTitle.Text = showText + " - Verify User";
            hfSignOffAction.Value = showText;
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
        protected void MyDateChange(object sender, EventArgs e)
        {
        }
        protected void btnYesNo_SelectedIndexChange(object sender, EventArgs e)
        {
            string value = btnYesNo.SelectedValue;
            string selectValue = AppraisalDataAC.NotesContent("Chose", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, WorkingAppraisee.AppraisalCode, value);

        }

        private void GoToNewPage(string action)
        {
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            string goPage = AppraisalProcess.AppraisalPageItem(action, User.Identity.Name, category, area, code);

            Page.Response.Redirect("Loading2.aspx?pID=" + goPage);

        }

        protected void SignOff_Click(object sender, EventArgs e)
        {
            try
            {
                if (chbCreateDS.Checked)
                {
                    string goEncryption = User.Identity.Name + hfCurrentdatetime.Value + hfApprEmployeeID.Value;
                    string digitalKey = mySymetricEncryption.GetEncryptedValue(goEncryption);
                    SignatureProcess.DigitalSignature("Create", User.Identity.Name, hfApprEmployeeID.Value, hfCurrentdatetime.Value, digitalKey);
                }
                string signoffAction = hfSignOffAction.Value;// btnSignOff.Text;
                string enforceSign = (CheckBoxEnforce.Checked) ? "1" : "0";
                string result = SignatureProcess.SignOffName(hfAppraisalActionRole.Value, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole, hfCurrentUserName.Value, hfCurrentdatetime.Value, signoffAction, enforceSign);
                // hfSignOffAction.Value = signoffAction;

                switch (signoffAction)
                {
                    case "Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgsignoffAppraisee.Attributes.Add("src", "../images/signatureDone.png"); }
                        else
                        { imgsignoffAppraiser.Attributes.Add("src", "../images/signatureDone.png"); }
                        break;
                    case "Undo Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgsignoffAppraisee.Attributes.Add("src", "../images/signature.png"); }
                        else
                        { imgsignoffAppraiser.Attributes.Add("src", "../images/signature.png"); }

                        break;
                    case "Demand Undo Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgsignoffAppraisee.Attributes.Add("src", "../images/signatureAsk.png"); }
                        else
                        { imgsignoffAppraiser.Attributes.Add("src", "../images/signatureAsk.png"); }
                        break;
                    default:
                        break;
                }
                if (hfNoticeAuto.Value == "Yes")
                {
                    SendEmailNotification();
                }

                BindMyData();
            }
            catch (Exception ex)
            {
                string exM = ex.Message;
            }
        }

        protected void rblViewPermission_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationMyData("Save");
            //  PrincipalAppraisalActionNotification();
        }
        private void AllowViewPermissionCheck()
        {
            OperationMyData("Get");
        }

        protected void OperationMyData(string action)
        {
            string schoolyear = hfApprYear.Value;
            string schoolcode = hfApprSchool.Value;
            string sessionid = hfApprSession.Value;
            string employeeid = hfApprEmployeeID.Value;
            string category = hfCategory.Value;
            string area = hfArea.Value;
            string code = hfCode.Value;
            AppraisalData.ListPermission(ref rblViewPermission, action, User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
            if (action == "Get")
            {
                if (hfAppraisalActionRole.Value == "Appraisee")
                {
                    rblViewPermission.Enabled = false;
                }
            }
        }
        private void showMessage(string result, string action)
        {
            try
            {
                 // string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                //  ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);

                string strScript = "window.alert(" + "'" + action + "', '" + result + "');";
                 ClientScript.RegisterStartupScript(GetType(), "_script", strScript, true);
            }
            catch { }
        }
        private void SendEmailNotification()
        {
            string result = "";
            try
            {
                string noticeType = "SignOff";
                if (hfNoticeAction.Value == "Undo Sign Off")
                {
                    noticeType = "UndoSignOff";
                }
                if (hfNoticeAction.Value == "Demand Undo Sign Off")
                {
                    noticeType = "DemandUndoSignOff";
                }
                if (hfNoticeAction.Value == "Authorize Undo Sign Off")
                {
                    noticeType = "AuthorizeUndoSignOff";
                }
                string actionRole = hfAppraisalActionRole.Value;
                string noticeArea = hfArea.Value;

                string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
                string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);
                string eMailBcc = "";
                string eMailForm = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "OperateUser", noticeArea);
                string eMailSubject = getEmailBodyInfo("GetSubject");// TextSubject.Text;
                string eMailBody = getEmailBodyInfo("GetBody"); // getEmailBody(); //  myText.Text;
                string eMailFormat = "HTML";
                string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
                eMailNotification.NotificationeMail(actionRole, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea, noticeDate, noticeDate, eMailSubject, eMailBody);

                result = eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat);
            }
            catch
            {
                result = "Failed";
            }
            showMessage(result, "Send Email Notification");

        }
        private string getEmailBodyInfo(string contentType)
        {
            try
            {
                string actionRole = hfAppraisalActionRole.Value;
                string noticeArea = hfArea.Value;
                string noticeType = "SignOff";
                if (hfNoticeAction.Value == "Undo Sign Off")
                {
                    noticeType = "UndoSignOff";
                }
                if (hfNoticeAction.Value == "Demand Undo Sign Off")
                {
                    noticeType = "DemandUndoSignOff";
                }
                if (hfNoticeAction.Value == "Authorize Undo Sign Off")
                {
                    noticeType = "AuthorizeUndoSignOff";
                }

                string permission = Page.Request.QueryString["permission"];
                string signOffDate = TextSignOffDateSupervisory.Text;
                if (actionRole == "Appraisee")
                {
                    signOffDate = TextSignOffDateAppraisee.Text;
                }
                if (actionRole == "Appraiser")
                {
                    signOffDate = TextSignOffDateAppraiser.Text;
                }
                string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
                if (signOffDate == "")
                {
                    signOffDate = noticeDate;
                }
                string category = hfCategory.Value;

                string purpose = "Notice";
                string noticeGo = "Appraisee";
                string noticeFrom = "Appraiser";
                if (actionRole == "Appraisee")
                {
                    noticeGo = "Appraiser";
                    noticeFrom = "Appraisee";
                }
                string templateArea = noticeArea;
                string templateAction = noticeType;
                if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
                {
                    templateAction = "SignOff";
                    templateArea = (category == "PPA") ? "PPA" : "EPA";
                }
                string cBody = GetNoticeFile.eMailContentByType(contentType, User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);

                if (contentType == "GetSubject")
                {
                    cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", getTitle(noticeType));
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.eMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                }
                else
                {
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalSession}}", WorkingAppraisee.SessionID);
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", GetNoticeFile.eMailContentAppCategory("AppCategory", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                    cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
                    cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
                    cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", signOffDate);
                    cBody = cBody.Replace("{{PlaceHolder:ActionDate}}", signOffDate);
                    cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
                    cBody = cBody.Replace("{{PlaceHolder:ReviewSignOff}}", permission);
                    cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", getTitle(noticeType));
                    cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.eMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
                    if (actionRole == "Appraisee")
                    {
                        cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiserName);
                        cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiseeName);
                        cBody = cBody.Replace("{{PlaceHolder:Whom}}", "my");
                    }
                    else
                    {
                        cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiseeName);
                        cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiserName);
                        cBody = cBody.Replace("{{PlaceHolder:Whom}}", "your");
                    }
                    if (WebConfig.getValuebyKey("eMailTry") == "Test")
                    {
                        string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
                        string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);

                        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCC);
                    }
                    else
                    {
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                        cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
                    }
                }
                return cBody;
            }
            catch
            {
                return "";
            }

        }
        private string getTitle(string action)
        {
            string rVal = "";
            switch (action)
            {
                case "SignOff":
                    rVal = "Sign Off ";
                    break;
                case "UndoSignOff":
                    rVal = "Undo Sign Off";
                    break;
                case "DemandUndoSignOff":
                    rVal = "Demand Undo Sign Off";
                    break;
                case "AuthorizeUndoSignOff":
                    rVal = "Authorize Undo Sign Off";
                    break;
                case "AppraisalAction":
                    rVal = "Review Permission";
                    break;
                case "AppraisalStart":
                    rVal = "Appraisal Start Notification";
                    break;
                default:
                    rVal = "Sign Off ";
                    break;
            }
            return rVal;
        }
    }
}
