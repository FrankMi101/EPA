
using BLL;
using ClassLibrary;
using System;
using System.Drawing.Imaging;
using System.Web.UI;
namespace EPA2.EPAappraisal
{
    public partial class SignOffPage : System.Web.UI.Page
    {
        string SignOffType = "II";
        string ActionRole = "Appraisee";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (WorkingAppraisee.AppraisalCode == "ALP95") SignOffType = "I";
                // SignOffPermissionControl.Visible = false;
                SetPageAttribution();
                AllowViewPermissionCheck();
                BindMyData();
            }
            AssemblingPageTitle();
        }
        private void SetPageAttribution()
        {
            txtDomain.Text = WebConfig.DomainName();
            hfUserID.Value = User.Identity.Name;
            hfUserRole.Value = WorkingProfile.UserRole;
            hfApprEmployeeID.Value = WorkingAppraisee.EmployeeID;
            hfEmployeeID.Value = WorkingAppraisee.EmployeeID;
            hfAppraiseeUserID.Value = WorkingAppraisee.UserID;
            hfAppraiserUserID.Value = WorkingAppraisee.AppraiserID;
            hfSignOffType.Value = SignOffType;
            AppraisalPage.SetPageAttribute(Page);

            hfAppraisalActionRole.Value = AppraisalProcess.AppraisalActionRole(WorkingAppraisee.AppraisalType, WorkingProfile.UserRole, WorkingAppraisee.UserID, WorkingProfile.UserId);
            ActionRole = hfAppraisalActionRole.Value;
            if (hfAppraisalActionRole.Value == "Appraisee")
            { txtUserName.Text = WorkingAppraisee.UserID; }
            else
            {
                if (WorkingProfile.UserRole == "SO" || WorkingProfile.UserRole == "Admin")
                {
                    CheckBoxEnforce.Visible = true;
                    txtUserName.Text = User.Identity.Name; //  WorkingAppraisee.AppraiserID;
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

            AppraisalPage.BuildingTitleTab(ref PageTitle, User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle, "Title", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextTitle(ref labelTitle1, "Title", User.Identity.Name, category, area, code + "1");
            AppraisalPage.BuildingTextTitle(ref labelTitle2, "Title", User.Identity.Name, category, area, code + "2");
            AppraisalPage.BuildingTextTitle(ref labelTitle3, "Title", User.Identity.Name, category, area, code + "3");
            AppraisalPage.BuildingTextTitle(ref labelTitle4, "Title", User.Identity.Name, category, area, code + "4");
            AppraisalPage.BuildingTextTitle(ref labelTitle5, "Title", User.Identity.Name, category, area, code + "5");
            AppraisalPage.BuildingTextTitle(ref labelTitle6, "Title", User.Identity.Name, category, area, code + "6");
            AppraisalPage.BuildingTextTitle(ref labelTitleX, "Title", User.Identity.Name, category, area, code + "X");

            AppraisalPage.BuildingTextTitle(ref labelSubTitle, "SubTitle", User.Identity.Name, category, area, code);
            AppraisalPage.BuildingTextMessage(ref labelMessage, "Message", User.Identity.Name, category, area, code);



            AppraisalPage.BuildingTextMessage(ref labelMessage1, "Message", User.Identity.Name, category, area, code + "1");
            AppraisalPage.BuildingTextMessage(ref labelMessage3, "Message", User.Identity.Name, category, area, code + "3");
            AppraisalPage.BuildingTextMessage(ref labelMessage5, "Message", User.Identity.Name, category, area, code + "5");

            hfDigitalSignatureReady.Value = SignatureProcess.DigitalSignature("Read", User.Identity.Name, WorkingProfile.UserEmployeeId);
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
        private void SetExtContentRow()
        {
            string code = WorkingAppraisee.AppraisalCode;
            ExtContentRow.Visible = false;
            ExtContentRow2.Visible = false;
            ExtContentRow3.Visible = false;
            ExtContentRow4.Visible = false;
            ExtContentRow5.Visible = false;
            MyDate.Visible = false;
            btnYesNo.Visible = false;
            btnYesNo.SelectedIndex = 1;

            var parameter = new AppraisalCommentSignOff()
            {
                Operate = "Date",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value,
            };

            switch (code)
            {
                case "ENR95":
                case "IMP95":
                    //ExtContentRow2.Visible = true;
                    //ExtContentRow3.Visible = true;
                    ExtContentRow4.Visible = true;
                    ExtContentRow.Visible = true;
                    MyDate.Visible = true;
                    MyDate.Value = AppraisalData.NotesContent(parameter);//  AppraisalDataAC.NotesContent("Date", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    break;
                case "ALP95":
                    // SignOffPermissionControl.Visible = false;
                    // imgNoticePermission.Visible = false;
                    ExtContentRow.Visible = true;
                    MyDate.Visible = true;
                    MyDate.Value = AppraisalData.NotesContent(parameter);//  AppraisalDataAC.NotesContent("Date", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    break;
                case "STR95":
                    ExtContentRow.Visible = true;
                    btnYesNo.Visible = true;
                    parameter.Operate = "Chose";
                    string twoSatisfactory = AppraisalData.IsTwoSatisfactory(parameter);//  AppraisalDataAC.NotesContent("Chose", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    AppraisalPage.BuildingListControlInitial(btnYesNo, twoSatisfactory);
                    if (WorkingAppraisee.AppraisalType == "LTO")
                    {
                        ExtContentRow.Visible = false;
                    }
                    if (twoSatisfactory == "No")
                    {
                        if (ActionRole == "Appraisee") AppraiseeControl(false);
                        if (ActionRole == "Appraiser") AppraiserControl(false);
                    }
                    else
                    {
                        var IsPrincipalInitial = AppraisalData.IsPrincipalInitialSTR(parameter);
                        if (IsPrincipalInitial == "Done")
                        {
                            // if (ActionRole == "Appraisee") AppraiseeControl(true);
                            if (ActionRole == "Appraiser") AppraiserControl(true);
                        }
                        else
                        {
                            // if (ActionRole == "Appraisee") AppraiseeControl(false);
                            if (ActionRole == "Appraiser") AppraiserControl(false);
                        }
                    }
                    break;
                default:
                    btnYesNo.Visible = false;
                    parameter.Operate = "Get";
                    parameter.ItemCode = "SUM61";
                    string appraisalRate = AppraisalData.RatingListContent(parameter);// AppraisalDataAC.RatingListContent(User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfArea.Value, hfCode.Value);
                    if (appraisalRate == "4")
                    {
                        ExtContentRow2.Visible = true;
                        ExtContentRow3.Visible = true;
                        ExtContentRow4.Visible = true;
                        ExtContentRow5.Visible = true;
                    }
                    break;
            }



        }
        protected void BindMyData()
        {
            var parameter = new AppraisalCommentSignOff()
            {
                Operate = "",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                ItemCode = hfCode.Value,
                UserRole = hfUserRole.Value,
                SignOffType = ActionRole
            };

            var signOffResult = SignatureProcess.SignOffContents("Appraisee", parameter)[0];

            TextSignOffNameAppraisee.Text = signOffResult.SignOffName; //  SignatureProcess.SignOffName("Appraisee", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateAppraisee.Text = signOffResult.SignOffDate; //  SignatureProcess.SignOffDate("Appraisee", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffAppraisee.Value = signOffResult.SignOffComplete; // SignatureProcess.SignOffComplete("Appraisee", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffActionAppraisee.Value = signOffResult.SignOffAction; // SignatureProcess.SignOffAction("Appraisee", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            signOffResult = SignatureProcess.SignOffContents("Appraiser", parameter)[0];

            TextSignOffNameAppraiser.Text = signOffResult.SignOffName; // SignatureProcess.SignOffName("Appraiser", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateAppraiser.Text = signOffResult.SignOffDate; // SignatureProcess.SignOffDate("Appraiser", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffAppraiser.Value = signOffResult.SignOffComplete; // SignatureProcess.SignOffComplete("Appraiser", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffActionAppraiser.Value = signOffResult.SignOffAction; // SignatureProcess.SignOffAction("Appraiser", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);

            signOffResult = SignatureProcess.SignOffContents("Supervisory", parameter)[0];

            TextSignOffNameSupervisory.Text = signOffResult.SignOffName; // SignatureProcess.SignOffName("Supervisory", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            TextSignOffDateSupervisory.Text = signOffResult.SignOffDate; //  SignatureProcess.SignOffDate("Supervisory", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffSupervisory.Value = signOffResult.SignOffComplete; // SignatureProcess.SignOffComplete("Supervisory", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);
            hfSignOffActionSupervisory.Value = signOffResult.SignOffAction; //  SignatureProcess.SignOffAction("Supervisory", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);

            hfSignOffComplete.Value = SignatureProcess.SignOffComplete("Both", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole);

            hfSignOffAction.Value = SignatureProcess.SignOffName("Appraisal", parameter); //User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);
            hfNoticeAction.Value = SignatureProcess.SignOffName("NoticeAction", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);
            hfDemandUserRole.Value = SignatureProcess.SignOffName("DemandUserRole", parameter); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, hfAppraisalActionRole.Value);

            var parameter2 = new AppraisalCommentNoticeDate()
            {
                Operate = "",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfEmployeeID.Value,
                SessionID = hfApprSession.Value,
                NoticeType = "SignOff",
                NoticeArea = hfArea.Value
            };

            hfNoticeAppraisee.Value = SignatureProcess.NoticeDate("Appraisee", parameter2); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);
            hfNoticeAppraiser.Value = SignatureProcess.NoticeDate("Appraiser", parameter2); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);
            hfNoticeSupervisory.Value = SignatureProcess.NoticeDate("Supervisory", parameter2); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "SignOff", hfArea.Value);

            parameter2.NoticeType = "AppraisalAction";
            hfNoticePermission.Value = SignatureProcess.NoticeDate("Permission", parameter2); // User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "AppraisalAction", hfArea.Value);

            var parameter3 = new SignOffAutoNotice
            {
                Operate = "Auto",
                UserID = User.Identity.Name,
                EmployeeID = hfApprEmployeeID.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ActionRole = hfAppraisalActionRole.Value
            };



            var autonoticeaction = SignatureProcess.AutoNoticeAction("Get", parameter3);
            if (autonoticeaction == "Auto" || autonoticeaction == "Yes")
                CheckBoxAutoEmailNotice.Checked = true;
            else
                CheckBoxAutoEmailNotice.Checked = false;

            parameter3.Operate = "Template";
            var template = SignatureProcess.AutoNoticeAction("Get", parameter3);
            if (template == "System")
                rblTemplate.SelectedIndex = 0;
            else
                rblTemplate.SelectedIndex = 1;

            hfCurrentdatetime.Value = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");

            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            if (hfAppraisalActionRole.Value == "Appraisee")
            {
                noticeGo = "Appraiser";
                noticeFrom = "Appraisee";
            }
            string purpose = "Notice";
            string category = WorkingAppraisee.AppraisalCategory;
            string templateArea = hfArea.Value; // (category == "PPA") ? "PPA" : "TPA";
            hfNoticeAuto.Value = GetNoticeFile.EMailContentByTemplate("AutoNotice", User.Identity.Name, category, "SignOff", templateArea, noticeGo, noticeFrom, purpose);

            CheckSignOffControl();
            SetExtContentRow();
        }


        protected void CheckSignOffControl()
        {

            urlDemandAppraiseeRow.Visible = false;
            urlDemandAppraiserRow.Visible = false;

            if (hfSignOffAppraisee.Value == "Complete")
            {
                if (hfDemandUserRole.Value == "Appraisee")
                {
                    imgSignoffAppraisee.Attributes.Add("src", "../images/signatureAsk.png");
                    urlDemandAppraiserRow.Visible = true;
                }
                else
                { imgSignoffAppraisee.Attributes.Add("src", "../images/signatureDone.png"); }
            }

            if (hfSignOffAppraiser.Value == "Complete")
            {
                if (hfDemandUserRole.Value == "Appraiser")
                {
                    imgSignoffAppraiser.Attributes.Add("src", "../images/signatureAsk.png");
                    urlDemandAppraiseeRow.Visible = true;
                }
                else
                {
                    imgSignoffAppraiser.Attributes.Add("src", "../images/signatureDone.png");
                }
            }

            if (hfSignOffSupervisory.Value == "Complete")
            {
                imgSignoffSupervisory.Attributes.Add("src", "../images/signatureDone.png");
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
            //if (hfNoticePermission.Value != "")
            //{
            //    imgNoticePermission.Attributes.Add("src", "../images/emailok.png");
            //    imgNoticePermission.Attributes.Add("title", "Sign Off at " + hfNoticePermission.Value);
            //}



            string signOffCompleteIndicate = "InComplete";

            AppraiseeControl(false);
            AppraiserControl(false);

            if (ActionRole == "Appraisee")
            {
                signOffCompleteIndicate = hfSignOffAppraisee.Value;
                hfCurrentUserName.Value = WorkingAppraisee.AppraiseeName;
                //  rblViewPermission.Enabled = false;
                if (SignOffType == "I")
                {
                    AppraiseeControl(true);
                }
                else
                {
                    if (hfSignOffAppraiser.Value == "Complete" || rblViewPermission.SelectedValue == "SignOff")
                    { AppraiseeControl(true); }

                }
            }

            if (ActionRole == "Appraiser")
            {
                signOffCompleteIndicate = hfSignOffAppraiser.Value;
                hfCurrentUserName.Value = WorkingAppraisee.AppraiserName;
                //  rblViewPermission.Enabled = true;

                if (SignOffType == "I" && hfSignOffAppraisee.Value == "Complete")
                {
                    AppraiserControl(true);
                }
                else
                {
                    AppraiserControl(true);
                }
            }

            if (ActionRole == "Supervisory")
            {
                AppraiserControl(false);
                AppraiseeControl(false);
            }



            if (hfAppraisalActionRole.Value == "Supervisory")
            {
                hfCurrentUserName.Value = WorkingProfile.UserName;
                imgSignoffSupervisory.Disabled = false;
                btnYesNo.Enabled = true;
                signOffCompleteIndicate = hfSignOffSupervisory.Value;
            }
            string showText = "Sign Off";

            if (signOffCompleteIndicate == "Complete")
            {
                if (hfSignOffComplete.Value == "Complete")
                {
                    showText = "Demand Undo Sign Off";
                    if (ActionRole == "Appraisee")
                    {
                        urlDemandAppraiserRow.Visible = false;
                        if (hfSignOffActionAppraisee.Value == "Demand Undo Sign Off")
                        {
                            showText = "Recall Undo Sign Off";
                            hfSignOffAction.Value = "Recall Undo Sign Off";
                        }
                        else
                        {
                            if (hfSignOffActionAppraiser.Value == "Demand Undo Sign Off")
                            {
                                showText = "Authorize Undo Sign Off";
                                hfSignOffAction.Value = "Authorize Undo Sign Off";
                            }
                        }
                       
                    }
                    if (ActionRole == "Appraiser")
                    {
                        urlDemandAppraiseeRow.Visible = false;
                        if (hfSignOffActionAppraiser.Value == "Demand Undo Sign Off")
                        {
                            showText = "Recall Undo Sign Off";
                            hfSignOffAction.Value = "Recall Undo Sign Off";
                        }
                        else
                        {
                            if (hfSignOffActionAppraisee.Value == "Demand Undo Sign Off")
                            {
                                showText = "Authorize Undo Sign Off";
                                hfSignOffAction.Value = "Authorize Undo Sign Off";
                            }

                        }
                    }
                    if (ActionRole == "Supervisory")
                    {
                        if (hfSignOffActionSupervisory.Value == "Demand Undo Sign Off")
                        {
                            showText = "Recall Undo Sign Off";
                            hfSignOffAction.Value = "Recall Undo Sign Off";
                        }
                    }
                }
                else
                { showText = "Undo Sign Off"; }
            }
 
            btnSignOff.Text = showText;
            LabelSignOffTitle.Text = showText + " - Verify User";
            hfSignOffAction.Value = showText;
        }
        private void AppraiseeControl(bool value)
        {
            imgSignoffAppraisee.Disabled = !value;
            imgNoticeAppraisee.Disabled = !value;

            CheckBoxEnforce.Enabled = false;
            btnYesNo.Enabled = false;
            // imgNoticePermission.Visible = false;
            // rblViewPermission.Enabled = false;
        }
        private void AppraiserControl(bool value)
        {

            imgSignoffAppraiser.Disabled = !value;
            imgNoticeAppraiser.Disabled = !value;
            // rblViewPermission.Enabled = true;
            btnYesNo.Enabled = value;
        }
        private void OpenAppraiseeControl()
        { }
        private void OpenAppraiserControl()
        { }
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
        protected void MyDateChange(object sender, EventArgs e)
        {
        }
        protected void BtnYesNo_SelectedIndexChange(object sender, EventArgs e)
        {
            // var value = btnYesNo.SelectedValue;

            var parameter = new AppraisalCommentSignOff()
            {
                Operate = "Chose",
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value,
                Value = btnYesNo.SelectedValue,
            };

            string selectValue = AppraisalData.NotesContentSave(parameter);
            //   AppraisalDataAC.NotesContent("Chose", User.Identity.Name, WorkingAppraisee.AppraisalYear, WorkingAppraisee.AppraisalSchoolCode, WorkingAppraisee.EmployeeID, WorkingAppraisee.SessionID, WorkingAppraisee.AppraisalType, WorkingAppraisee.AppraisalArea, WorkingAppraisee.AppraisalCode, value);

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

        protected void SignOff_Click(object sender, EventArgs e)
        {
            try
            {
                if (chbCreateDS.Checked)
                {
                    string goEncryption = User.Identity.Name + hfCurrentdatetime.Value + hfEmployeeID.Value;
                    string digitalKey = GetMySymetricEncryption.GetMyEncryptedValue(goEncryption);
                    SignatureProcess.DigitalSignature("Create", User.Identity.Name, hfEmployeeID.Value, hfCurrentdatetime.Value, digitalKey);
                }
                string enforceSign = (CheckBoxEnforce.Checked) ? "1" : "0";
                var parameter = new AppraisalCommentSignOff()
                {
                    Operate = "Save",
                    UserID = User.Identity.Name,
                    SchoolYear = hfApprYear.Value,
                    SchoolCode = hfApprSchool.Value,
                    EmployeeID = hfEmployeeID.Value,
                    SessionID = hfApprSession.Value,
                    Category = hfCategory.Value,
                    ItemCode = hfCode.Value,
                    UserRole = WorkingProfile.UserRole,
                    SignOffName = hfCurrentUserName.Value,
                    SignOffDate = hfCurrentdatetime.Value,
                    SignOffAction = hfSignOffAction.Value,
                    SignOffType = hfAppraisalActionRole.Value,
                    EnforceSignOff = enforceSign

                };

                string result = SignatureProcess.SignOffName(hfAppraisalActionRole.Value, parameter, "SignOff", "Enforce");
                // string result = SignatureProcess.SignOffName(hfAppraisalActionRole.Value, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfEmployeeID.Value, hfApprSession.Value, hfCategory.Value, hfCode.Value, WorkingProfile.UserRole, hfCurrentUserName.Value, hfCurrentdatetime.Value, signoffAction, enforceSign);
                // hfSignOffAction.Value = signoffAction;

                switch (hfSignOffAction.Value)
                {
                    case "Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgSignoffAppraisee.Attributes.Add("src", "../images/signatureDone.png"); }
                        else
                        { imgSignoffAppraiser.Attributes.Add("src", "../images/signatureDone.png"); }
                        break;
                    case "Undo Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgSignoffAppraisee.Attributes.Add("src", "../images/signature.png"); }
                        else
                        { imgSignoffAppraiser.Attributes.Add("src", "../images/signature.png"); }

                        break;
                    case "Demand Undo Sign Off":
                        if (hfAppraisalActionRole.Value == "Appraisee")
                        { imgSignoffAppraisee.Attributes.Add("src", "../images/signatureAsk.png"); }
                        else
                        { imgSignoffAppraiser.Attributes.Add("src", "../images/signatureAsk.png"); }
                        break;
                    default:
                        break;
                }
                if (CheckBoxAutoEmailNotice.Checked)
                {
                    SendEmailNotification();
                }

                string twoSatisfactoryComplete = btnYesNo.SelectedValue;
                if (twoSatisfactoryComplete == "Yes")
                {
                    if (SignatureProcess.SignOffComplete("Both", parameter) == "Complete") SendEmailNotificationToHRAppAdmin();
                }

                BindMyData();
            }
            catch (Exception ex)
            {
                string exM = ex.Message;
            }
        }

        //protected void RblViewPermission_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    OperationMyData("Save");
        //    //  PrincipalAppraisalActionNotification();
        //}
        private void AllowViewPermissionCheck()
        {
            OperationMyData("Get");
        }

        protected void OperationMyData(string action)
        {

            var parameter = new AppraisalCommentSignOff()
            {
                Operate = action,
                UserID = User.Identity.Name,
                SchoolYear = hfApprYear.Value,
                SchoolCode = hfApprSchool.Value,
                EmployeeID = hfEmployeeID.Value,
                SessionID = hfApprSession.Value,
                Category = hfCategory.Value,
                Area = hfArea.Value,
                ItemCode = hfCode.Value,
                UserRole = WorkingProfile.UserRole,
            };

            rblViewPermission.Enabled = false;

            AppraisalData.ListPermission(ref rblViewPermission, action, parameter);
            //   AppraisalData.ListPermission(ref rblViewPermission, action, User.Identity.Name, schoolyear, schoolcode, sessionid, employeeid, category, area, code);
            if (action == "Get")
            {
                if (hfAppraisalActionRole.Value == "Appraisee")
                {
                    rblViewPermission.Enabled = false;
                }
            }
        }
        private void ShowMessage(string result, string action)
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
                string noticeType = hfSignOffAction.Value.Replace(" ", "");//   "SignOff";
                string actionRole = hfAppraisalActionRole.Value;
                string noticeArea = hfArea.Value;

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

                var parameter = new EmailNoticePara()
                {
                    Operate = hfSignOffAction.Value,
                    UserID = User.Identity.Name,
                    SchoolYear = hfApprYear.Value,
                    SchoolCode = hfApprSchool.Value,
                    EmployeeID = hfEmployeeID.Value,
                    SessionID = hfApprSession.Value,
                    Category = hfCategory.Value,
                    NoticeRole = actionRole,
                    NoticeType = noticeType,
                    NoticeArea = noticeArea,
                    NoticeDate = DateTime.Now.ToString("yyyy/MM/dd"),
                    DeadLineDate = DateTime.Now.ToString("yyyy/MM/dd"),
                };

                string permission = Page.Request.QueryString["permission"];
                string subject = GetNoticeFile.GetEmailBodyInfo("GetSubject", hfSignOffAction.Value, signOffDate, permission, parameter);
                string cBody = GetNoticeFile.GetEmailBodyInfo("GetBody", hfSignOffAction.Value, signOffDate, permission, parameter);

                parameter.NoticeSubject = subject;
                parameter.Comments = cBody;
                parameter.NoticeType = noticeType;
                result = MailNotification.NotificationeMailSave(parameter);//  actionRole, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea, noticeDate, noticeDate, eMailSubject, eMailBody);


                var emailPara = new EmailNotice()
                {
                    EmailTo = MailNotification.NotificationeMailUser("NoticeUser", parameter),
                    EmailCC = MailNotification.NotificationeMailUser("CCUser", parameter),
                    EmailFrom = MailNotification.NotificationeMailUser("OperateUser", parameter),
                    EmailBcc = "",
                    EmailSubject = subject,
                    EmailBody = cBody,
                    EmailFormat = "HTML"
                };


                result = MailNotification.SendMail(emailPara);


            }
            catch
            {
                result = "Failed";
            }
            ShowMessage(result, "Send Email Notification");

        }
        private void SendEmailNotificationToHRAppAdmin()
        {
            string result = "";
            try
            {
                string noticeType = "CompleteNTIPStrategy"; //" hfSignOffAction.Value.Replace(" ", "");//   "SignOff";
                string actionRole = hfAppraisalActionRole.Value;
                string noticeArea = hfArea.Value;

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

                var parameter = new EmailNoticePara()
                {
                    Operate = hfSignOffAction.Value,
                    UserID = User.Identity.Name,
                    SchoolYear = hfApprYear.Value,
                    SchoolCode = hfApprSchool.Value,
                    EmployeeID = hfEmployeeID.Value,
                    SessionID = hfApprSession.Value,
                    Category = hfCategory.Value,
                    NoticeRole = actionRole,
                    NoticeType = noticeType,
                    NoticeArea = noticeArea,
                    NoticeDate = DateTime.Now.ToString("yyyy/MM/dd"),
                    DeadLineDate = DateTime.Now.ToString("yyyy/MM/dd"),
                };
                string permission = Page.Request.QueryString["permission"];
                string subject = GetNoticeFile.GetEmailBodyInfo("GetSubjectHR", hfSignOffAction.Value, signOffDate, permission, parameter);
                string cBody = GetNoticeFile.GetEmailBodyInfo("GetBodyHR", hfSignOffAction.Value, signOffDate, permission, parameter);

                parameter.NoticeSubject = subject;
                parameter.Comments = cBody;
                parameter.NoticeType = noticeType;
                result = MailNotification.NotificationeMailSave(parameter);//  actionRole, User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea, noticeDate, noticeDate, eMailSubject, eMailBody);


                var emailPara = new EmailNotice()
                {
                    EmailTo = MailNotification.NotificationeMailUser("HRAdminUser", parameter),
                    EmailCC = MailNotification.NotificationeMailUser("AppraisalCCUser", parameter),
                    EmailFrom = MailNotification.NotificationeMailUser("SystemUser", parameter),
                    EmailBcc = "",
                    EmailSubject = subject,
                    EmailBody = cBody,
                    EmailFormat = "HTML"
                };

                result = MailNotification.SendMail(emailPara);


            }
            catch
            {
                result = "Failed";
            }
            ShowMessage(result, "Send Email Notification");

        }
        //private string GetEmailBodyInfo(string contentType)
        //{
        //    try
        //    {
        //        string actionRole = hfAppraisalActionRole.Value;
        //        string noticeArea = hfArea.Value;
        //        string noticeType = "SignOff";
        //        if (hfNoticeAction.Value == "Undo Sign Off")
        //        {
        //            noticeType = "UndoSignOff";
        //        }
        //        if (hfNoticeAction.Value == "Demand Undo Sign Off")
        //        {
        //            noticeType = "DemandUndoSignOff";
        //        }
        //        if (hfNoticeAction.Value == "Authorize Undo Sign Off")
        //        {
        //            noticeType = "AuthorizeUndoSignOff";
        //        }


        //        string signOffDate = TextSignOffDateSupervisory.Text;
        //        if (actionRole == "Appraisee")
        //        {
        //            signOffDate = TextSignOffDateAppraisee.Text;
        //        }
        //        if (actionRole == "Appraiser")
        //        {
        //            signOffDate = TextSignOffDateAppraiser.Text;
        //        }
        //        string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
        //        if (signOffDate == "")
        //        {
        //            signOffDate = noticeDate;
        //        }
        //        string category = hfCategory.Value;

        //        string purpose = "Notice";
        //        string noticeGo = "Appraisee";
        //        string noticeFrom = "Appraiser";
        //        if (actionRole == "Appraisee")
        //        {
        //            noticeGo = "Appraiser";
        //            noticeFrom = "Appraisee";
        //        }
        //        string templateArea = noticeArea;
        //        string templateAction = noticeType;
        //        if (noticeType == "SignOff" || noticeType == "UndoSignOff" || noticeType == "DemandUndoSignOff" || noticeType == "AuthorizeUndoSignOff")
        //        {
        //            templateAction = "SignOff";
        //         //   templateArea = (category == "PPA") ? "PPA" : "EPA";
        //        }
        //        string cBody = GetNoticeFile.EMailContentByType(contentType, User.Identity.Name, category, templateAction, templateArea, noticeGo, noticeFrom, purpose);

        //        if (contentType == "GetSubject")
        //        {
        //            cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
        //            cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.EMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
        //        }
        //        else
        //        {
        //            cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
        //            cBody = cBody.Replace("{{PlaceHolder:AppraisalSession}}", WorkingAppraisee.SessionID);
        //            cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", GetNoticeFile.EMailContentAppCategory("AppCategory", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
        //            cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
        //            cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
        //            cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", signOffDate);
        //            cBody = cBody.Replace("{{PlaceHolder:ActionDate}}", signOffDate);
        //            cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
        //            cBody = cBody.Replace("{{PlaceHolder:ReviewSignOff}}", permission);
        //            cBody = cBody.Replace("{{PlaceHolder:SignOffAction}}", GetTitle(noticeType));
        //            cBody = cBody.Replace("{{PlaceHolder:AppraisalArea}}", GetNoticeFile.EMailContentAppCategory("AppAreaTitle", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
        //            if (actionRole == "Appraisee")
        //            {
        //                cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiserName);
        //                cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiseeName);
        //                cBody = cBody.Replace("{{PlaceHolder:Whom}}", "my");
        //            }
        //            else
        //            {
        //                cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiseeName);
        //                cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiserName);
        //                cBody = cBody.Replace("{{PlaceHolder:Whom}}", "your");
        //            }
        //            if (WebConfig.getValuebyKey("eMailTry") == "Test")
        //            {
        //                string eMailTo = MailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
        //                string eMailCc = MailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);

        //                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
        //                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCc);
        //            }
        //            else
        //            {
        //                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
        //                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
        //            }
        //        }
        //        return cBody;
        //    }
        //    catch
        //    {
        //        return "";
        //    }

        //}
        //private string GetTitle(string action)
        //{
        //    string rVal = "";
        //    switch (action)
        //    {
        //        case "SignOff":
        //            rVal = "Sign Off ";
        //            break;
        //        case "UndoSignOff":
        //            rVal = "Undo Sign Off";
        //            break;
        //        case "DemandUndoSignOff":
        //            rVal = "Demand Undo Sign Off";
        //            break;
        //        case "AuthorizeUndoSignOff":
        //            rVal = "Authorize Undo Sign Off";
        //            break;
        //        case "AppraisalAction":
        //            rVal = "Review Permission";
        //            break;
        //        case "AppraisalStart":
        //            rVal = "Appraisal Start Notification";
        //            break;
        //        default:
        //            rVal = "Sign Off ";
        //            break;
        //    }
        //    return rVal;
        //}
    }
}
