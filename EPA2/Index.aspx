﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EPA2.Index" %>

<!DOCTYPE html>


<html>
<head id="Head1" runat="server">
    <title>Teacher Performance Appraisal</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="Content/DeviceMedia.css" rel="stylesheet" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Content/BubbleHelp.css" rel="stylesheet" />

    <link href="Content/TopLink.css" rel="stylesheet" />
    <link href="Content/TopNavList.css" rel="stylesheet" />
    <link href="Content/TopNavListM.css" rel="stylesheet" />
    <link href="Content/DefaultPage.css" rel="stylesheet" />

    <link href="Index.css" rel="stylesheet" />


    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/NavTopList.js"></script>

    <style>
      
        /*.iFrameDIV {
            height: 100%;
            width: 100%;
            float: left;
            table-layout: auto;
            margin-bottom:-15px; 
        }*/

        #GoList {
            font-size: small;
            font-family: Arial;
            table-layout: auto;
            height: 100%;
            width: 100%;
            border: 0px solid red;
            margin: 0;
            /*      margin-bottom: -50px;
            margin-top: -5px; */
        }

        .CenterDIV {
            width: 300px;
            margin: auto;
            background-color: azure;
            border: 2px blue outset;
            padding: 30px;
        }



        .appheader {
            /*height: 100px;*/
            width: 100%;
            border-top: 2px solid #56c0e9;
            height: 80px;
        }

        #appriFrame {
            margin-bottom: -2px;
            width: 100%;
        }

        .inVisibleBtn {
            display: none;
        }

        #TableVersion {
            margin-right: 0px;
            margin-top: 0px;
        }

        #rblLoginAS input {
            font-family: Arial;
            font-size: x-small;
            font-weight: 100;
        }

        #rblLoginAS label:hover {
            text-decoration: underline;
            color: purple;
        }

        #MobileMenu {
            margin-top: 0px;
            margin-bottom: 1px;
            height: 32px;
            width: 43px;
            color: yellow;
        }

        .epahide {
            display: none;
        }

        #rblLoginAS label {
            font-family: Arial, sans-serif;
            font-size: small;
            padding: 1px;
            margin: -1px;
        }

        .hideme {
            display: none;
        }

        .LinkCell {
            font-size: 0.8em;
        }

        #LinkBtnWorkingOn {
            font-size: 0.8em;
        }

        .loginManu {
            text-align: left;
        }
      
    </style>



</head>
<body>
    <form id="form2" runat="server">
        <div class ="container">
            <div class ="header">
                 <div class ="header-sub1">
                     <img id="Image3" src="images/boardLogo.gif" alt="TCDSB Logo" border="0" style="width: 160px; height: 80px" />
                 </div>
                <div class ="header-sub2">
                      <div class ="header-sub2-1"> 
                            <asp:Button ID="btnLogout" CssClass="inVisibleBtn" runat="server" Text="" OnClick="btnLogout_Click" Visible="true" Height="0px" Width="0px" />
                            <asp:Label ID="LabelTrain" runat="server" Height="20px" Visible="False" Font-Size="Large" ForeColor="#00C000"> Training</asp:Label>
                      </div>
                      <div class ="header-sub2-2"> </div>
                      <div class ="header-sub2-3">  
                            <a href="javascript:openParameter();">School Year:</a>
                            <asp:Label ID="LabelSchoolYear" runat="server" BackColor="Transparent" ForeColor="purple"> </asp:Label>
                            <a href="javascript:openParameter();">School: </a>
                            <asp:Label ID="LabelSchoolCode" runat="server" BackColor="Transparent" ForeColor="purple"> </asp:Label>
                             <asp:Label ID="LabelSchool" runat="server" BackColor="Transparent"    ForeColor="purple"> </asp:Label>
                             <asp:Label ID="Labelitem" runat="server" Text="" ForeColor="red" Visible="false"></asp:Label>
                      </div>
                 </div>
                <div class ="header-sub3">
                    <table cellspacing="0" cellpadding="0" width="400px" align="right" style="display: inline-table;"
                        border="0" id="TableVersion" runat="server">
                        <tr style="height: 30px;">
                            <td style="text-align: right; vertical-align: top; width: 30px" class="visible-sm visible-md visible-lg">
                                <img height="30" src="images/curve.png" width="50" alt="" />
                            </td>

                            <td class="LinkCell">
                                <asp:LinkButton ID="LinkBtnWorkingOn" runat="server" ToolTip="click on to switch to PPA" OnClick="LinkBtnWorkingOn_Click" Visible="false">Go PPA</asp:LinkButton>
                                <ul id="navlistLink" style="margin-right: 10px;">
                                    <li>
                                        <img id="LoginUserIcon" style="margin-bottom:-2px"  src="images/user.png" width="20" height="20" />
                                        <a href="#" id="LoginUserRole" runat="server">UserRole </a>
                                        <asp:HiddenField ID="hfCurrentUserRole" runat="server" />

                                    </li>

                                    <%--<li><a href="http://owa.tcdsb.org" id="TopMenu3" runat="server" target="_blank">Web Mail </a>   </li>--%>
                                    <li><a href="javascript:logoutApp()" id="Logout" runat="server">Log out </a>

                                    </li>
                                </ul>
                                <div id="LoginAsDIV" class="bubble epahide loginManu">
                                    <asp:RadioButtonList ID="rblLoginAS" runat="server" AutoPostBack="true" Height="150px" OnSelectedIndexChanged="rblLoginAS_SelectedIndexChanged"></asp:RadioButtonList>
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <td style="height: 20px; margin-right: 20px; text-align: right; color: #cc0033; font-size: large;" colspan="3">

                                <asp:Label ID="lblApplication" runat="server" Text="Teacher Performance Appraisal"></asp:Label>
                                (<a id="appLink" runat="server" href="~/Default.aspx">EPA</a>) 
                                <br />
                                <asp:Label ID="lblTCDSB" runat="server" Text="TCDSB " ForeColor="#CC0033" ToolTip="Show Application Support" Font-Size="small"></asp:Label>
                                <asp:Label ID="lblVersion" runat="server" Text=" (Version 1.0.1 )" ToolTip="Edit Application Support" Font-Size="small"></asp:Label>
                            </td>
                        </tr>
                    </table>
                 </div>
            </div>
            <div class ="menu"> 
               <div class="TopMenubar">
                    <nav id="TopNav" class="pull-left visible-sm visible-md visible-lg">
                    </nav>

                    <div class="navbar-header pull-left visible-xs hideme">

                        <button id="MobileMenu" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav" aria-expanded="false">

                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div id="collapsable-nav" class="collapse navbar-collapse" style="margin-top: -10px; margin-left: 0px; padding: 0px;">
                            <nav id="TopNavM">
                            </nav>
                        </div>
                    </div>

                </div>

            </div>
            <div class ="content">
                <iframe id="GoList" name="GoList" frameborder="0" scrolling="auto" src="iBlankPage.html"  runat="server"></iframe>
            </div>
        </div>
    
        <div class="POPUP page area">
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfTeacherName" runat="server" />
            <asp:HiddenField ID="hfSchoolArea" runat="server" />
            <asp:HiddenField ID="hfWorkingOn" runat="server" />
            <asp:HiddenField ID="hfGoPageDirect" runat="server" />
            <div id="EditDIV" runat="server" class="EditDIV bubble epahide">
                <div class="editTitle">
                    <table>
                        <tr>
                            <td style="width: 98%">
                                <div id="EditTitle"></div>
                            </td>
                            <td>
                                <img id="closeMe" src="images/close.png" style="height: 30px; width: 30px; margin: -3px 0 -3px 0" /></td>
                        </tr>
                    </table>
                </div>
                <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
            </div>
            <div style="width: 100%; height: 100%; align-content: center">
                <div id="ApprDIV" runat="server" class="ApprDIV bubble epahide" tabindex="998" style="height: 710px; width: 1024px; text-align: center">

                    <iframe class="ApprPage" id="appriFrame" name="appriFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server" style="height: 100%"></iframe>
                </div>
            </div>

            <div id="PopUpDIV" class="bubble epahide"></div>
            <div id="ActionPOPDIV" class="bubble epahide">
                <div class="editTitle" style="display: block">
                    <div id="ActionTitle" style="display: inline; float: left; width: 92%; font-weight: 600;"></div>
                    <div style="display: inline; float: right; width: 30px;">
                        <img id="closeActionPOP" src="images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                    </div>
                </div>
                <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 420px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
            </div>
        </div>

    </form>

</body>
</html>

<script type="text/javascript">
    var currentY = 0;
    var currentNodeLevel1;
    var currentNodeLevel2;
    myTopNav(myTopMenu);

</script>
<script>

    $(document).ready(function () {

        var vHeight = window.innerHeight - 120;
        //var vWidth = screen.width;
        //var vHeight = window.innerHeight - apprScreenH1;
        $("#GoList").css("height", vHeight);

        $("#LoginUserRole").click(function (event) {
            OpenLoginUserRolePage();
        });
        $("#LoginUserIcon").click(function (event) {
            OpenLoginUserRolePage();
        });
        $("#closeMe").click(function (event) {

            $("#PopUpDIV").fadeToggle("fast");

            if ($("#EditDIV").css('display') === "block") { $("#EditDIV").fadeToggle("fast"); }

            if ($("#ApprDIV").css('display') === "block") { $("#ApprDIV").fadeToggle("fast"); }


        });
        $("#MobileMenu").click(function (event) {

            if ($("#GoList").attr("src") === "iBlankPage.html") {
                $("#TopNavM").hide();
                $("#GoList").attr("src", "DefaultSummary.aspx");
            }
            else {
                $("#TopNavM").show();
                $("#GoList").attr("src", "iBlankPage.html");
            }

            //   myTopNavM(myTopMenu);

        });

        $("#LabelTrain").click(function () {
            if ($("#hfUserID").val() == "mif") {
                teachername = $("#hfTeacherName").val();
                schoolyear = $("#hfApprYear").val();
                schoolcode = $("#hfApprSchool").val();
                employeeid = $("#hfApprEmployeeID").val();
                sessionid = "";
                pageid = $("#hfPageID").val();
                userid = $("#hfUserID").val();
                openEditPageA('450', '800', 'EPAsystem/Loading.aspx?pID=Encryption', 'Encription String');
            }
        });
    });
    function OpenLoginUserRolePage() {
        if ($("#hfUserLoginRole").val() === "Admin") {
            var vTop = $("#LoginUserRole")[0].offsetParent.offsetTop + 25;      // event.originalEvent.clientY +5;
            var vLeft = $("#LoginUserRole")[0].offsetParent.offsetLeft + 135;    //    event.originalEvent.clientX + 50;
            $("#LoginAsDIV").css({
                top: vTop,
                left: vLeft - 100,
                height: 160,
                width: 150
            });

            $("#LoginAsDIV").fadeToggle("fast");
            //   $("#LoginAsDIV").addClass("visible");
        }
    }
    function changeAppsRole() {
        if ($("#hfUserLoginRole").val() === "Admin") {
            var vTop = $("#LoginUserRole")[0].offsetParent.offsetTop + 25;
            var vLeft = $("#LoginUserRole")[0].offsetParent.offsetLeft + 150;
            window.alert($("#hfUserLoginRole").val());
            window.alert($(vTop + "  " + vLeft).val());
            $("#LoginAsDIV").css({
                top: vTop,
                left: vLeft - 100,
                height: 150,
                width: 150
            });

            $("#LoginAsDIV").fadeToggle("fast");
        }

    }
    function logoutApp() {
        $("#btnLogout").click();
    }
    function OpenPopPage(type) {
        teachername = $("#hfTeacherName").val();
        schoolyear = $("#hfApprYear").val();
        schoolcode = $("#hfApprSchool").val();
        employeeid = $("#hfApprEmployeeID").val();
        sessionid = "";
        pageid = $("#hfPageID").val();
        userid = $("#hfUserID").val();
        $(".editTitle").css({ "display": "none" });
        openEditPageA('600', '800', 'EPAmanage/Loading2.aspx?pID=Feedback', 'FeedBack');
    }
    function openEditPageA(vHeight, vWidth, goPage, pTitle) {
        var vLeft = (screen.width / 2) - (vWidth / 2) - 100;
        var vTop = (screen.height / 2) - (vHeight / 2) - 100;
        goPage = goPage + "&yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + teachername + "&pageID=" + pageid;
        $(document).ready(function () {
            try {
                $("#ActioniFramePage").attr('src', goPage);
                $("#ActionTitle").html(pTitle);
                $("#ActionPOPDIV").css({
                    top: 100,
                    left: 200,
                    height: vHeight,
                    width: vWidth,
                    "border-width": "2px",
                    "border-color": "Orange",
                    "border-style": "solid"
                })
                $("#ActioniFramePage").css({
                    height: vHeight - 3,
                    width: vWidth - 5,
                    border: 0
                })
                //  $("#PopUpDIV").fadeToggle("fast");
                $("#ActionPOPDIV").fadeToggle("fast");
            }
            catch (e) { }

        });
    }
</script>
