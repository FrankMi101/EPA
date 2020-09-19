<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appraisal11.aspx.cs" Inherits="EPA2.EPAappraisal.Appraisal11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Content/LeftNovList.css" rel="stylesheet" />

    <style>
        body {
            height: 100%;
            width: 100%;
            margin: -2px;
            border: 0px solid green;
        }

        .MenuPanel {
            overflow: auto;
            display: inline;
            float: left;
            width: 20%;
            height: 100%; /* 650px;*/
            border-right: 0px solid lightsalmon;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .ContentPanel {
            overflow: auto;
            display: inline;
            float: left;
            width: 80%;
            height: 100%;
            border: 1px solid lightsalmon;
            margin: -1px;
        }


        #GoPageiFrame {
            width: 100%;
            height: 100%;
            border: 0px solid green;
        }

        .HighLightItem {
            background-color: #fecab5;
        }
        /*.MenuPanel  a {
        height:30px;
        }*/

        .itemDisable {
            color: silver;
            pointer-events: none;
            cursor: default;
            text-decoration: none;
            opacity: 0.3;
        }
    </style>
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">
        <div class="MenulistPanel">
            <div class="MenuPanel" id="myLeftMenu" runat="server">
                <div class="category" id="CateALP">
                    Annual Learning Plan
                </div>
                <div id="MenuALP" runat="server">
                    <ul class="leafMenuALP">
                        <li><a href="Loading2.aspx?pID=ALP11" target="GoPage">
                            <img src="../images/help2.png" />
                            1 Evidence Log </a></li>
                        <li><a href="Loading2.aspx?pID=ALP11">
                            <img src="../images/help2.png" />
                            2 Summative Report</a></li>
                        <li><a href="#">
                            <img src="../images/help2.png" />
                            3 Annual Learning Plan</a></li>
                        <li><a href="#">
                            <img src="../images/help2.png" />
                            4 Evidence Log</a></li>
                        <li><a href="#">
                            <img src="../images/help2.png" />
                            5 Summative Report</a></li>
                        <li><a href="#">
                            <img src="../images/help2.png" />
                            6 Evidence Log</a></li>
                        <li><a href="#">
                            <img src="../images/help2.png" />
                            7 Summative Report</a></li>
                    </ul>
                </div>
                <div class="category" id="CateLOG">
                    Evidence Log
                </div>
                <div id="MenuLOG" runat="server">
                    <ul class="leafMenu2">
                        <li>21 Evidence Log</li>
                        <li>22 Summative Report</li>
                        <li>23 Annual Learning Plan</li>
                        <li>24 Evidence Log</li>
                        <li>25 Summative Report</li>
                    </ul>
                </div>
                <div class="category" id="CateSUM">
                    Summative Report
                </div>
                <div id="MenuSUM" runat="server">
                    <ul class="leafMenu3">
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            31 Evidence Log </a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            32 Summative Report</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            33 Annual Learning Plan</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            34 Evidence Log</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            35 Summative Report</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            36 Evidence Log</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            37 Summative Report</a></li>
                        <li><a href="#">
                            <img src="../images/chinaz13.ico" />
                            38 Summative Report</a></li>
                    </ul>

                </div>
                <div class="category" id="CateIMP">
                    Improvement Plan
                </div>
                <div id="MenuIMP" runat="server">
                    <ul class="leafMenu4">
                        <li>41 Evidence Log</li>
                        <li>42 Summative Report</li>
                        <li>43 Annual Learning Plan</li>
                        <li>44 Evidence Log</li>
                        <li>45 Summative Report</li>
                    </ul>

                </div>

            </div>
        </div>
        <asp:HiddenField ID="hfOpenbrench" runat="server" Value="leafMenuSUM" />

        <div class="ContentPanel">
            <iframe id="GoPageiFrame" name="GoPageiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div id="PopUpDIV" class="bubble epahide"></div>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfCurrentli" runat="server" />

            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfTeacherName" runat="server" />

        </div>
    </form>
</body>

</html>


<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_Help.js"></script>
<script>
    var selectedliCode;
    $(document).ready(function () {
        var openObj = $("#hfOpenbrench").val();
        $("." + openObj).css('display', 'block');


        var vHeight = window.innerHeight - apprScreenH1;
        $("#GoPageiFrame").css("height", vHeight)


        $('.category').click(function (event) {
            ItemCode = $(this)[0].id;
            var leftObj = $("#hfOpenbrench").val();
            $("." + leftObj).css('display', 'none');
            var goObj = ItemCode.replace("MenuTitle", "leafMenu");
            $("." + goObj).css('display', 'block');
            $("#hfOpenbrench").val(goObj);


        });
        $("li").click(function (event) {
            // window.alert($(window).width() + "-" + screen.width);

            if (screen.width < 760) {
                $(".MenuPanel").css("width", "0%");
                $(".ContentPanel").css("width", "100%");
            }
            selectedliCode = $(this)[0].id;
            if (selectedliCode.length == 7) {
                selectedliCode = selectedliCode + "1";
            }

            if ($("#hfCurrentli").val() != "") {
                $("#" + $("#hfCurrentli").val()).removeClass("HighLightItem");
            }
            $("#hfCurrentli").val(selectedliCode);
            //*   $("#" + selectedliCode).addClass('HighLightItem');
            event.stopPropagation();
            // ***********************************************************************************************
            // any postback action add to this event does not work. does not triger the iframe form postback.
            //    postBackAppraisalPage();
            //  $("#btnPostBack").click();
            //*************************************************************************************************
        });
        $(".MenuPanel").mouseenter(function (event) {
            postBackAppraisalPage();
        });

    });
    // this function protect all change user has made to save.
    function postBackAppraisalPage() {
        var appraisalPageTextChange = $("#GoPageiFrame").contents().find("#hfContentChange").val();

        if (appraisalPageTextChange === "1") {
            var saveButton = $("#GoPageiFrame").contents().find("#btnSave");
            saveButton.click();

            //   document.frames["GoPageiFrame"].document.forms[0].submit();
            //   document.frames['GoPageiFrame'].document.getElementById('btnSave').click();
            //   window.frames[0].document.getElementById('btnSave').click();

        }
    }
</script>
