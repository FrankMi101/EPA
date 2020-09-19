<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage00.aspx.cs" Inherits="EPA2.EPAmanage.Manage00" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%--    <link href="Content/bootstrap.min.css" rel="stylesheet" /> --%>
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <%--    <link href="../Content/DefaultPage.css" rel="stylesheet" />--%>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: -5px;
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
            height: 30px;
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

        .iFrameDIV {
            width: 100%;
            display: block;
            float: left;
            height: 100%; /* 650px;*/
            margin: auto;
        }

        #iFrameGoManage {
            width: 100%;
            height: 380px;
            margin: auto;
            border: 0px;
        }

        .EditPage {
            width: 100%;
            height: 100%;
            margin: auto;
            border: 0px lightblue outset;
            padding: 1px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
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
            /*margin:-3px;*/
        }

        /*#LeftMenuShow {
            height: 25px;
            width: 25px;
            margin-bottom: -8px;
            margin-top: -3px;
        }*/





        /*#ProgressSteps a {
            height: 25px !important;
            width: 200px !important;
            background-image: url(../images/pgBar1.png);
            margin-top: -5px;
            border: 0px;
        }*/



        /*.stepLabel {
            height: 25px;
            width: 180px;
            margin: 0px;
            padding-left: 3px;
        }

        #ProgressSteps td {
            margin: -1px;
            border: 0px;
            height: 25px;
        }*/

        /*#ProgressSteps #step1 {
            background-image: url(../images/pgBar1.png);
        }

        #ProgressSteps #step2 {
            background-image: url(../images/pgBar1.png);
        }

        #ProgressSteps #step3 {
            background-image: url(../images/pgBar2.png);
        }

        #ProgressSteps #step4 {
            background-image: url(../images/pgBar3.png);
        }

        #ProgressSteps #step5 {
            background-image: url(../images/pgBar3.png);
        }

        #ProgressSteps #step6 {
            background-image: url(../images/pgBar3.png);
        }*/
    </style>
    <%--<script type="text/javascript">
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
    </script>--%>
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">
        <div class="appheader">
            <div style="display: inline; width: 95.5%;">
                <asp:Label ID="LabelAppraisalTitle" runat="server" Text="Staff Profile Edit" Height="30px"></asp:Label>
            </div>
            <div style="display: inline; float: right; width: 4.5%; text-align: left;">
                <img id="closeMe" src="../images/close.png" style="height: 28px; width: 28px;" />
            </div>
            <br />
            <div style="display: inline; float: left; width: 45%; text-align: left;">
                <asp:Label ID="LabelGreetingUser" runat="server" Text="" Height="25px"></asp:Label>
            </div>
            <div style="display: inline; float: right; width: 50%; text-align: right;">
            </div>


        </div>

        <%--<div class="TopMessagebar">
            <div style="float: left; display: inline; padding-top: 5px;">

                <div style="width: 95%; text-align: center">
                    <asp:Label ID="LabelEmployeeName" runat="server" Text="" Width="500px" Font-Bold="true" ForeColor="yellow"></asp:Label>
                </div>
            </div>
            <div style="float: right; display: none">
                <img id="imgRefresh" title="Refresh Content" alt="Refresh" style="height: 22px; width: 20px;" src="../images/refreshY.png" />
                &nbsp;  &nbsp;
               

            <img id="imgfeedback" title="FeedBack" alt="feedback" style="height: 25px; width: 25px;" src="../images/feedback.png" />

            </div>
        </div>--%>

        <iframe id="iFrameGoManage" name="iFrameGoManage" scrolling="no" src="iBlankPage.html" runat="server"></iframe>

        <%--<div id="PopUpDIV" class="bubble epahide"></div>
        <div id="EditDIV" runat="server" class="bubble epahide">
            <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>--%>


        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>

<script>

    $(document).ready(function () {
        var vHeight = 350;
        $(".editTitle", parent.document).css("display", "none");
        $(".appheader #closeMe").click(function (event) {
            try {
                if ($("#ActionPOPDIV", parent.document).css("display") === "block")
                { $("#ActionPOPDIV", parent.document).fadeToggle("fast"); }
                if ($("#EditDIV", parent.document).css('display') === "block") {
                    $("#EditDIV", parent.document).fadeToggle("fast");
                    $("#PopUpDIV", parent.document).fadeToggle("fast");
                }
            }
            catch (e)
            { }
            try {
                $("#ActionPOPDIV").fadeToggle("fast");
                //  $("#PopUpDIV").fadeToggle("fast");
            }
            catch (e)
            { }
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

        $("#LabelGreetingUser").click(function (event) {
            $("#ProgressStepsShow").show();
        })
        $('.TopMessagebar img').click(function (event) {
            ItemCode = $(this)[0].id;
            if (ItemCode === "imgRefresh") {
                location.reload(true);
            }
            else {
                if ($("#EditDIV").css('display') === "block") {
                    $("#EditDIV").hide();
                }
                else {

                    var titel = getTitlebyCode(ItemCode, "Title");
                    var pId = getTitlebyCode(ItemCode, "Code");

                    $("#EditTitle").val(titel);
                    var parameter = $("#hfParameters").val();
                    var goPage = "Loading.aspx?pID=" + pId + "&" + parameter;
                    var vTop = event.currentTarget.offsetTop;
                    var vLeft = event.currentTarget.offsetLeft;
                    $("#editiFrame").attr('src', goPage);
                    $("#EditDIV").css({
                        top: vTop + 30,
                        left: vLeft - 600
                    })

                    $("#EditDIV").fadeToggle("fast");
                }

            }
        });


    });
    function getTitlebyCode(code, type) {
        var rVal = ""
        if (type === "Title") {
            if (code === "imgfeedback")
            { rVal = "Application Feedback"; }
            else {
                rVal = "Appraisal Notes";
            }
        }
        else {
            if (code === "imgfeedback")
            { rVal = "Feedback"; }
            else {
                rVal = "Notes";
            }
        }
        return rVal;
    }

</script>
