<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appraisal00.aspx.cs" Inherits="EPA2.EPAappraisal.Appraisal00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/DeviceMedia.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />

    <style>
        html, body {
            height: 100%;
            width: 100%;
            margin: auto;
        }

        .appheader {
            margin: auto;
            height: 80px;
            width: 100%;
            display: block;
            float: left;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

        .TopMessagebar {
            height: 33px;
            width: 100%;
            border-bottom: 2px solid lightsalmon;
            /*background-image: url(images/menubar.png);*/
            display: block;
            float: left;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        .topMessage {
            background-color: transparent;
            color: yellow;
            font-weight: 500;
        }

        .topMessageDDL {
            background-color: aquamarine;
            color: yellow;
            font-weight: 400;
            margin-top: -5px;
            padding-top: 0;
        }

            .topMessageDDL option {
                background: lightblue;
            }

        .iFrameDIV {
            width: 100%;
            display: block;
            float: left;
            height: 100%; /* 650px;*/
            margin: auto;
        }

        #iFrameGoItem {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        .EditPage {
            width: 600px;
            height: 450px;
            margin: auto;
            border: 2px lightblue outset;
            padding: 1px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

        #EditDIV {
            z-index: 999;
            overflow: hidden;
            border: outset 2px purple;
            width: 100%;
            height: 100%;
            margin: -2px;
        }


        #PopUpDIV {
            z-index: 100;
            position: absolute;
            top: 1px;
            left: 1px;
            background: #56c0e9;
            opacity: 0.6;
            filter: alpha(opacity=60);
            height: 100%;
            width: 100%;
            margin: -3px;
        }

        #LabelAppraisalTitle {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-weight: 800;
        }

        #imgfeedback, #imgRefresh, #imgNotes {
            margin: auto;
        }

        .TopMessagebar .imgOver {
            border: 1px solid darkblue;
            font-family: 'Arial Narrow', Arial;
            font-size:10px;

            /*margin:-3px;*/
        }

        #LeftMenuShow {
            height: 25px;
            width: 25px;
            margin-bottom: -8px;
            margin-top: -3px;
        }





        /*#ProgressSteps a {
            height: 25px !important;
            width: 200px !important;
            background-image: url(../images/pgBar1.png);
            margin-top: -5px;
            border: 0px;
        }*/



        .stepLabel {
            height: 25px;
            width: 180px;
            margin: 0px;
            padding-left: 3px;
        }

        #ProgressSteps td {
            margin: -1px;
            border: 0px;
            height: 25px;
        }


        .imgTCcell /*#step1imgTD, #step2imgTD, #step3imgTD, #step4imgTD, #step5imgTD, #step6imgTD*/ {
            width: 15px;
        }

        #ProgressSteps img {
            width: 15px;
            height: 25px;
        }

        #ddlSchoolYear, #ddlSession {
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        .container, .row, .col-xs-12, .col-sm-6, .col-md-5, .col-lg-5, .col-md-4, .col-lg-4, .col-md-3, .col-lg-3 {
            margin: 0px;
            padding: 0px;
            padding-left: 0px;
            padding-right: 0px;
            margin-top: -1px;
        }
    </style>

    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
    <script type="text/javascript">
        function getResolution() {
            try {
                var screenWidth = screen.width;
                var screenHeight = screen.height;
                var elem = document.elements['txtResolution'];
                elem.value = screenWidth + "x" + screenHeight;
            }
            catch (err) {
            }
        }
        //function resizeIframe(obj) {
        //    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
        //}
        //function autoResize() {
        //    $('#iFrameGoItem').height($('#iFrameGoItem').contents().height());
        //}
    </script>

</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">
        <div class="appheader">
            <div style="display: inline; width: 97%;">
                <asp:Label ID="LabelAppraisalTitle" runat="server" Text="Appraisal For Teacher" Height="30px"></asp:Label>
            </div>

            <div style="display: inline; float: right; width: 3%; text-align: right;">
                <img id="closeMe" src="../images/close.png" style="height: 28px; width: 28px;" />
            </div>
            <br />
            <div style="display: inline; float: left; width: 35%; text-align: left;">
                <asp:Label ID="LabelGreetingUser" runat="server" Text="Welcome User" Height="25px"></asp:Label>
            </div>
            <div style="display: inline; float: right; text-align: right; font-size: small; ">
                <a id="MinistryDocumentsLink" runat="server" href="#">Ministry Documents 
                    <img src="../images/ministryDoc2.png" style="height: 20px; width: 20px; margin-top:-8px;" /></a>
            </div>
            <div id="MinistryDocuments" runat="server" class="bubble epahide HelpMenuDIV">
                <div class="visible-md visible-lg" style="display: inline; width: 100%; text-align: left; font-size: small">
                   <br /> <ul>
                        <li> 
                            <a id="DocLink1" runat="server" href="javascript:OpenAppraisalDocument('OLF')">Ontario Leadership Framework</a> </li>

                        <li><a id="DocLink2" runat="server" href="javascript:OpenAppraisalDocument('PPAManual')">Performance Appraisal Manual</a></li>

                        <li><a id="DocLink3" runat="server" href="javascript:OpenAppraisalDocument('BLIP')">Board Learning Improvement Plan</a>   </li>

                        <li><a id="DocLink4" runat="server" href="javascript:OpenAppraisalDocument('SLIP')">School Learning Improvement Plan</a></li>
                        <li><a id="DocLink5" runat="server" href="javascript:OpenAppraisalDocument('Process')">Working Process</a></li>
                   </ul>


                </div>
            </div>


            <%--      <div id="ProgressSteps">
                <table id="ProgressStepsShow" runat="server" title="Clcik to hidden progress bar." style="width: 100%; border: 0px;" cellspacing="0" cellpadding="0">
                    <tr id="ProgressStepsShowTR" runat="server">
                                          <td id="step1">
                            <asp:Label ID="Label1" runat="server" Text="Label 1. Step" CssClass="stepLabel"></asp:Label>
                        </td>
                        <td id="step1imgTD" class="imgTCcell">
                            <img id="pgBar1a" runat="server" src="../images/pgBar1a.png" />
                        </td>
                        <td id="step2">
                            <asp:Label ID="Label3" runat="server" Text="Label 2. Step" CssClass="stepLabel"></asp:Label>

                        </td>
                       <td id="step2imgTD" class="imgTCcell">
                            <img id="pgBar2a" runat="server" src="../images/pgBar12a.png" />
                        </td>
                        <td id="step3">
                            <asp:Label ID="Label4" runat="server" Text="Label 3. Step" CssClass="stepLabel"></asp:Label></td>
                        <td id="step3imgTD" class="imgTCcell">
                            <img id="pgBar3a" runat="server" src="../images/pgBar23a.png" />
                        </td>

                        <td id="step4">
                            <asp:Label ID="Label5" runat="server" Text="Label 4. Step" CssClass="stepLabel"></asp:Label></td>
                       <td id="step4imgTD" class="imgTCcell">
                            <img id="pgBar4a" runat="server" src="../images/pgBar3a.png" />
                        </td>
                        <td id="step5">
                            <asp:Label ID="Label6" runat="server" Text="Label 5. Step" CssClass="stepLabel"></asp:Label></td>
                        <td id="step5imgTD" class="imgTCcell">
                            <img id="pgBar5a" runat="server" src="../images/pgBar3a.png" />
                        </td>
                        <td id="step6">
                            <asp:Label ID="Label7" runat="server" Text="Label 6. Step" CssClass="stepLabel"></asp:Label></td>
                       <td id="step6imgTD" class="imgTCcell">
                            <img id="pgBar6a" runat="server" src="../images/pgBar3e.png" title="Hidden Progress bar" />
                        </td>
                    </tr>
                </table>

            </div>--%>
        </div>

        <div class="TopMessagebar" style="display: inline-block">
            <div style="float: left; display: inline; padding-top: 5px;">
                <img id="LeftMenuShow" src="../images/menu2.png" style="margin-bottom: 5px" class="topMessageDDL" />
                Year:
                <asp:DropDownList ID="ddlSchoolYear" runat="server" CssClass="topMessageDDL" OnSelectedIndexChanged="DdlSchoolYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList> 
             Session: 
                <asp:DropDownList ID="ddlSession" runat="server" CssClass="topMessageDDL" OnSelectedIndexChanged="DdlSession_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList> 
             
                 School:
                <asp:Label ID="LabelSchoolCode" runat="server" Text="Label" CssClass="topMessage"></asp:Label>
                <asp:Label ID="LabelSchool" runat="server" Text="Label" CssClass="topMessage"></asp:Label>

                Appraiser:  
                <asp:Label ID="LabelAppraiser" runat="server" Text="Label" CssClass="topMessage"></asp:Label>

            </div>
            <div style="float: right;">
                <img id="imgRefresh" title="Refresh Appraisal Content" alt="Refresh" style="height: 22px; width: 20px;" src="../images/refreshY.png" />

                <img id="imgNotes" title="Make Appraisal Notes on current Appraisal" alt="Notes" style="height: 25px; width: 25px;" src="../images/notes.png" />


                <img id="imgfeedback" title="FeedBack" alt="feedback" style="height: 25px; width: 25px;" src="../images/feedback.png" />

            </div>
        </div>

        <iframe id="iFrameGoItem" name="iFrameGoItem" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server" style="height: 100%; width: 100%"></iframe>

        <div id="PopUpDIV" class="bubble epahide"></div>
        <div id="EditDIV" runat="server" class="EditDIV bubble epahide">
            <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>

        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block">
                <div id="ActionTitle" style="display: inline; float: left; width: 92%; font-weight: 600;"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 420px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfTeacherName" runat="server" />
        </div>
    </form>
</body>
</html>

<script>
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var sessionid;
    var pageid;
    var userid;

    $(document).ready(function () {

        var vHeight = window.innerHeight - apprScreenH2;

        $("#iFrameGoItem").css("height", vHeight)
        if (screen.width > 1024) {
            $(".container").attr("width", "1024px");
        }

        $(".editTitle", parent.document).css("display", "none");
        $(".appheader #closeMe").click(function (event) {
            $("#ApprDIV", parent.document).fadeToggle("fast");
            $("#PopUpDIV", parent.document).fadeToggle("fast");
        });


        $("#MinistryDocumentsLink").click(function (event) {

            var vTop = event.currentTarget.offsetTop;
            var vLeft = event.currentTarget.offsetLeft - 300;
            $("#MinistryDocuments").css({
                top: vTop + 20,
                left: vLeft,
                height: 150,
                width: 380
            });
            $("#MinistryDocuments").fadeToggle("fast");
        });
        $("#MinistryDocuments").click(function (event) {
            $("#MinistryDocuments").hide();
        });



        $("img").mouseenter(function (event) {
            ItemCode = $(this)[0].id;
            //  $(this).css("background-color", "skyblue");
            $(this).addClass("imgOver");
        });

        $("img").mouseleave(function (event) {
            //    $(this).css("background-color", "");
            //    $("p").removeClass("myClass noClass").addClass("yourClass");
            $(this).removeClass("imgOver");
        });
        $("#ProgressStepsShow").click(function (event) {
            $("#ProgressStepsShow").hide();
        });
        $("#LabelGreetingUser").click(function (event) {
            $("#ProgressStepsShow").show();
        })
        $('.TopMessagebar img').click(function (event) {
            ItemCode = $(this)[0].id;

            switch (ItemCode) {
                case "imgRefresh":
                    location.reload(true);
                    break;
                case "imgNotes":
                    teachername = $("#hfTeacherName").val();
                    schoolyear = $("#hfApprYear").val();
                    schoolcode = $("#hfApprSchool").val();
                    employeeid = $("#hfApprEmployeeID").val();
                    sessionid = $("#hfApprSession").val();
                    $(".editTitle").css({ "display": "none" });
                    openEditPageA('530', '800', '../EPAmanage/Loading2.aspx?pID=Notes', 'Write Appraisal Notes');
                    break;
                case "imgfeedback":
                    teachername = $("#hfTeacherName").val();
                    schoolyear = $("#hfApprYear").val();
                    schoolcode = $("#hfApprSchool").val();
                    employeeid = $("#hfApprEmployeeID").val();
                    sessionid = $("#hfApprSession").val();
                    pageid = $("#hfPageID").val();
                    userid = $("#hfUserID").val();
                    $(".editTitle").css({ "display": "none" });
                    openEditPageA('560', '800', '../EPAmanage/Loading2.aspx?pID=Feedback', 'FeedBack');
                    break;
                default:
                    //if ($("#EditDIV").css('display') === "block") {
                    //    $("#EditDIV").hide();
                    //}
                    //else {
                    //    var titel = getTitlebyCode(ItemCode, "Title");
                    //    var pID = getTitlebyCode(ItemCode, "Code");
                    //    $("#EditTitle").val(titel);
                    //    var parameter = $("#hfParameters").val();
                    //    var goPage = "Loading.aspx?pID=" + pID + "&" + parameter;
                    //    var vTop = event.currentTarget.offsetTop;
                    //    var vLeft = event.currentTarget.offsetLeft;
                    //    $("#editiFrame").attr('src', goPage);
                    //    $("#EditDIV").css({
                    //        top: vTop + 30,
                    //        left: vLeft - 600
                    //    })
                    //    $("#EditDIV").fadeToggle("fast");
                    //}
                    break;
            }


            if (ItemCode === "imgRefresh") {
                location.reload(true);
            }
            else {


            }
        });

        $('#LeftMenuShow').click(function (event) {
            var menuW = $("#iFrameGoItem").contents().find(".MenuPanel").css("width");
            if (menuW != "0px") {
                $("#iFrameGoItem").contents().find(".MenuPanel").css("width", "0%");
                $("#iFrameGoItem").contents().find(".ContentPanel").css("width", "100%");
            }
            else {
                $("#iFrameGoItem").contents().find(".MenuPanel").css("width", "20%");
                $("#iFrameGoItem").contents().find(".ContentPanel").css("width", "80%");
            }
        })
        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
    });
    function getTitlebyCode(code, type) {
        var rVal = ""
        if (type === "Title") {
            if (code === "imgfeedback") { rVal = "Application Feedback"; }
            else {
                rVal = "Appraisal Notes";
            }
        }
        else {
            if (code === "imgfeedback") { rVal = "Feedback"; }
            else {
                rVal = "Notes";
            }
        }
        return rVal;
    }
    function OpenAppraisalDocument(docId) {
        window.open("Loading3.aspx?pID=" + docId, "", "width=900 height=700, top=10, left=10, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");
    }
    function openAssignment(employeeId) {
        //  window.open("Loading3.aspx?pID=Assignment&tID=" + employeeID, "", "width=500 height=300, top=10, left=10, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");
        var goPage = "Loading3.aspx?pID=Assignment&tID=" + employeeId;
        var pTitle = "Assignment Update";
        openEditPageA(200, 400, goPage, pTitle);
    }
    function openEditPage4(vHeight, vWidth, goPage, pTitle) {
        var vLeft = (screen.width / 2) - (vWidth / 2) - 100;
        var vTop = (screen.height / 2) - (vHeight / 2) - 100;
        goPage = goPage + "&yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + teachername + "&pageID=" + pageid;
        $(document).ready(function () {
            try {

                $("#ActioniFramePage").attr('src', goPage);
                $("#EditTitle").html(pTitle);
                //$("#hfInvokePageFrom", parent.document).val("LTOHRStaffs/PublishedList2.aspx");

                $("#ActionPOPDIV").css({
                    top: 100,
                    left: 200,
                    height: vHeight,
                    width: vWidth
                })
                $("#ActioniFramePage").css({

                    height: vHeight,
                    width: vWidth,
                    border: 0


                })
                //  $("#PopUpDIV").fadeToggle("fast");
                $("#ActionPOPDIV").fadeToggle("fast");
            }

            catch (e) { }

        });
    }
    function openEditPageA(vHeight, vWidth, goPage, pTitle) {
        var vLeft = (screen.width / 2) - (vWidth / 2) - 100;
        var vTop = (screen.height / 2) - (vHeight / 2) - 100;
        goPage = goPage + "&yID=" + schoolyear + "&cID=" + schoolcode + "&tID=" + employeeid + "&sID=" + sessionid + "&tName=" + teachername + "&pageID=" + pageid;
        $(document).ready(function () {
            try {

                $("#ActioniFramePage").attr('src', goPage);
                $("#ActionTitle").html(pTitle);
                //$("#hfInvokePageFrom", parent.document).val("LTOHRStaffs/PublishedList2.aspx");

                $("#ActionPOPDIV").css({
                    top: 50,
                    left: 150,
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
