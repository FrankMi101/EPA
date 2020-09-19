<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EPA2.Mobile.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Scripts/angular.min.js"></script>
</head>
<body>
    <ul class="Level1" id="NUA0">
        <li><a id="A-1" class="current-menu-item" href="#" target="">System Setup</a>
            <ul class="Level2" id="NUA-1">
                <li><a id="B-11" class="Level-2" href="EPAsystem/Loading.aspx?pID=AppraisalCategory" target="GoList">Appraisal Category Definition</a> </li>
                <li><a id="B-12" class="Level-2" href="EPAsystem/Loading.aspx?pID=AppraisalArea" target="GoList">Appraisal Area Definition</a> </li>
                <li><a id="B-13" class="Level-2" href="#" target="">Appraisal User Management</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-13">
                        <li><a id="C-131" class="Level-3" href="EPAsystem/Loading.aspx?pID=ApplicationRole" target="GoList">Application User Role Setup</a> </li>
                        <li><a id="C-132" class="Level-3" href="EPAsystem/Loading.aspx?pID=UserManagement" target="GoList">Application User Management</a> </li>
                        <li><a id="C-133" class="Level-3" href="EPAsystem/Loading.aspx?pID=MultipleSchoolUser" target="GoList">Multiple School Work User Management</a> </li>
                    </ul>
                </li>
                <li><a id="B-14" class="Level-2" href="#" target="">Appraisal Process Setup</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-14">
                        <li><a id="C-141" class="Level-3" href="EPAsystem/Loading.aspx?pID=Phase" target="GoList">Appraisal Phase Setup</a> </li>
                        <li><a id="C-142" class="Level-3" href="EPAsystem/Loading.aspx?pID=Rate" target="GoList">Appraisal Rate Setup</a> </li>
                        <li><a id="C-143" class="Level-3" href="EPAsystem/Loading.aspx?pID=Progress" target="GoList">Appraisal Progress</a> </li>
                    </ul>
                </li>
                <li><a id="B-15" class="Level-2" href="#" target="">School Management</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-15">
                        <li><a id="C-151" class="Level-3" href="EPAsystem/Loading.aspx?pID=SchoolDistrictSetup" target="GoList">School District Setup</a> </li>
                        <li><a id="C-152" class="Level-3" href="EPAsystem/Loading.aspx?pID=SchoolRegionSetup" target="GoList">School Region Setup</a> </li>
                        <li><a id="C-153" class="Level-3" href="EPAsystem/Loading.aspx?pID=SchoolManagement" target="GoList">School Department Management</a> </li>
                    </ul>
                </li>
                <li><a id="B-16" class="Level-2" href="#" target="">Appraisal Domain Definition</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-16">
                        <li><a id="C-161" class="Level-3" href="EPAsystem/Loading.aspx?pID=Domain" target="GoList">Domain Set up</a> </li>
                        <li><a id="C-162" class="Level-3" href="EPAsystem/Loading.aspx?pID=Competency" target="GoList">Competency Set Up</a> </li>
                        <li><a id="C-163" class="Level-3" href="EPAsystem/Loading.aspx?pID=LookFors" target="GoList">Look Fors Set up</a> </li>
                    </ul>
                </li>
                <li><a id="B-17" class="Level-2" href="EPAsystem/Loading.aspx?pID=EmailTemplate" target="GoList">Email Notification Template Edit</a> </li>
                <li><a id="B-18" class="Level-2" href="EPAsystem/Loading.aspx?pID=BoardStatements" target="GoList">System statements add</a> </li>
                <li><a id="B-19" class="Level-2" href="EPAsystem/Loading.aspx?pID=StaffRollOver" target="GoList">Appraisal Staff Roll Over</a> </li>
                <li><a id="B-20" class="Level-2" href="EPAsystem/Loading.aspx?pID=GridPage.aspx" target="GoList">Grid Sign up Form Test</a> </li>
            </ul>
        </li>
        <li><a id="A-2" class="Level-1" href="#" target="">Comments Bank</a>
            <ul class="Level2" id="NUA-2">
                <li><a id="B-21" class="Level-2" href="EPAsystem/Loading.aspx?pID=BoardGoal" target="GoList">Board Goal and Strategy Setup</a> </li>
                <li><a id="B-22" class="Level-2" href="EPAsystem/Loading.aspx?pID=BoardBank" target="GoList">Board Level Comments Bank</a> </li>
                <li><a id="B-23" class="Level-2" href="EPAsystem/Loading.aspx?pID=SchoolBank" target="GoList">School Level Comments Bank</a> </li>
                <li><a id="B-24" class="Level-2" href="EPAsystem/Loading.aspx?pID=PrincipalBank" target="GoList">Principal Personal Comments Bank</a> </li>
                <li><a id="B-25" class="Level-2" href="EPAsystem/Loading.aspx?pID=eMeilNotice" target="GoList">School Level eMail Notice Setup</a> </li>
                <li><a id="B-26" class="Level-2" href="EPAsystem/Loading.aspx?pID=SchoolStatements" target="GoList">School Level Statements Setup</a> </li>
            </ul>
        </li>
        <li><a id="A-3" class="Level-1" href="#" target="">Appraisal Process Management</a>
            <ul class="Level2" id="NUA-3">
                <li><a id="B-31" class="Level-2" href="EPAmanage/Loading.aspx?pID=AppraisalStaffList" target="GoList">School Appraisal Staff List</a> </li>
                <li><a id="B-32" class="Level-2" href="#" target="">School Appraisal Notification</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-32">
                        <li><a id="C-321" class="Level-3" href="EPAmanage/Loading.aspx?pID=AppraisalNoticeListALP" target="GoList">School Appraisal ALP Batch Notice</a> </li>
                        <li><a id="C-322" class="Level-3" href="EPAmanage/Loading.aspx?pID=AppraisalNoticeList" target="GoList">School Appraisal Batch Notice</a> </li>
                        <li><a id="C-323" class="Level-3" href="EPAmanage/Loading.aspx?pID=AppraisalNoticeListOBS" target="GoList">Classroom Observation schedualing</a> </li>
                        <li><a id="C-324" class="Level-3" href="EPAmanage/Loading.aspx?pID=ALPBatchPrint" target="GoList">All School Staff ALP Batch Print</a> </li>
                    </ul>
                </li>
                <li><a id="B-34" class="Level-2" href="EPAmanage/Loading.aspx?pID=ManageStaffList" target="GoList">School Staff Management</a> </li>
                <li><a id="B-35" class="Level-2" href="EPAmanage/Loading.aspx?pID=AppraisalHistory" target="GoList">PPA Appraisal History</a> </li>
                <li><a id="B-36" class="Level-2" href="EPAsystem/Loading.aspx?pID=StaffRollOver" target="GoList">Appraisal Staff Roll Over</a> </li>
            </ul>
        </li>
        <li><a id="A-4" class="Level-1" href="#" target="_self">Appraisal Reports</a>
            <ul class="Level2" id="NUA-4">
                <li><a id="B-41" class="Level-2" href="EPAreports/Loading.aspx?pID=SchoolReport" target="GoList">School Level Appraisal Report</a> </li>
                <li><a id="B-42" class="Level-2" href="EPAreports/Loading.aspx?pID=BoardReports" target="GoList">Board Level Appraisal Report</a> </li>
                <li><a id="B-43" class="Level-2" href="EPAreports/Loading.aspx?pID=OnsisReports" target="GoList">Onsis Report</a> </li>
                <li><a id="B-44" class="Level-2" href="Loading.aspx?pID=DefaultSummary.aspx" target="GoList">Appraisal Summary Report</a> </li>
            </ul>
        </li>
        <li><a id="A-9" class="Level-1" href="" target="">Documents Help and Feedback</a>
            <ul class="Level2" id="NUA-9">
                <li><a id="B-91" class="Level-2" href="Documents/Loading.aspx?pID=AppUserGuideline" target="GoList">User Guideline</a> </li>
                <li><a id="B-92" class="Level-2" href="#" target="">Ministry Guideline Documents</a>
                    <img style="height: 25px; width: 30px; float: right; padding-top: -3px;" src="images/submenu.png">
                    <ul class="Level3" id="NUA-92">
                        <li><a id="C-921" class="Level-3" href="Documents/Loading.aspx?pID=MinistryGuidelineE" target="GoList">Experiences Teacher Guidline</a> </li>
                        <li><a id="C-922" class="Level-3" href="Documents/Loading.aspx?pID=MinistryGuidelineNTIP" target="GoList">New Teacher Induction</a> </li>
                        <li><a id="C-923" class="Level-3" href="Documents/Loading.aspx?pID=MinistryGuidelineLTO" target="GoList">LTO Teacher Guideline</a> </li>
                        <li><a id="C-924" class="Level-3" href="Documents/Loading.aspx?pID=MinistryGuidelinePPA" target="GoList">Principal Appraisal Guidline</a> </li>
                    </ul>
                </li>
                <li><a id="B-93" class="Level-2" href="Documents/Loading.aspx?pID=MinistryAppraisalFAQ" target="GoList">Ministry Appraisal FAQ </a></li>
                <li><a id="B-94" class="Level-2" href="Documents/Loading.aspx?pID=BoardLearningPlan" target="GoList">Board Learning Plan Strategies</a> </li>
                <li><a id="B-95" class="Level-2" href="Javascript:OpenPopPage('Feed Back');" target="_self">Feed Back</a> </li>
                <li><a id="B-96" class="Level-2" href="Loading.aspx?pID=AppraisalSummary" target="GoList">School Appraisal Summary</a> </li>
            </ul>
        </li>
    </ul>
</body>
</html>
