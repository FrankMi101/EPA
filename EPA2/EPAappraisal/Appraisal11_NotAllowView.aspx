<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appraisal11_NotAllowView.aspx.cs" Inherits="EPA2.EPAappraisal.Appraisal11NotAllowView" %>

<!DOCTYPE html>
  
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        .Centraldiv {
            width: 100%;
            margin-right: -1px;
            border: 0px lightblue outset;
            padding: 0px;
            height: 100%;
        }

        body {
            margin: auto;
            width: 99.8%;
            height: 100%;
            font-family: sans-serif, Arial;
        }

        .TitleArea {
            width: 100%;
            height: 35px;
            font-style: italic;
            font-weight: 800;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        img {
            margin-bottom: 2px;
        }

        .helpImg {
            height: 25px;
            width: 25px;
        }

        #HelpDIV {
            border: 3px solid lightsalmon;
            height: 180px;
            width: 300px;
            -o-border-top-right-bottom-left-radius: 12px;
            -moz-border-radius-toprightbottonleft: 12px;
            -webkit-border-top-right-bottom-left-radius: 12px;
            border-top-right-radius: 12px;
            border-top-left-radius: 12px;
            border-bottom-right-radius: 12px;
            border-bottom-left-radius: 12px;
        }

        #textHelp {
            margin: 5px;
        }




        #TextHelpEdit {
            margin: 2px;
        }

        #ButtonHelpSave {
            text-align: center;
        }

        .Title1 {
            color: forestgreen;
        }

        .Title2 {
            font-style: italic;
        }

        .AreaSubTitle {
            text-align: center;
            font-size: large;
            font-weight: 800;
            width: 100%;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        .ContentMessage {
            color: red;
            height: 600px;
            font-size: 1.5em;
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
        </div>


        <div style="height: 550px;">
            <div style="display: inline; width: 100%; float: left; border: 1px solid lightsalmon; margin: -1px">

                <div class="TitleArea">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                </div>

                <div class="ContentMessage">

                    <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Text Box Message</asp:Label>

                </div>


            </div>



        </div>




        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>


    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var appraisalYear;


    $(document).ready(function () {
        var vHeight = screen.height - 150 - 110 - 170;
         $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();

      

    });


</script>


