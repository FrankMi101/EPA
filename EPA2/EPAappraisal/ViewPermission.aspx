<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPermission.aspx.cs" Inherits="EPA2.EPAappraisal.ViewPermission" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        header {
            display: none;
        }

        #TextBoxDate {
            display: none;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelMessage {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .AppraisaleeSignOff {
            text-align: center;
            vertical-align: middle;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-weight: 700;
            font-size: 1em;
        }

        #SignatureDIV {
            border: 2px solid lightsalmon;
            height: 250px;
            width: 400px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>

        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section style="height: 500px;">
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img id ="img_1" class="imgHelp" src="../images/help2.png" title="Help Content" />


                </div>

            </div>
            <div class="AppraisaleeSignOff">
                <br />
                <br />
                <table style="width: 100%;">


                    <tr>
                        <td style="text-align: left; width: 70%; font-style: italic; color: orangered">

                            <asp:RadioButtonList ID="rblViewPermission" runat="server" OnSelectedIndexChanged="RblViewPermission_SelectedIndexChanged">
                                <asp:ListItem Value="NotAllow" Selected="true">Not Allow Appraisee to View Appraisal Content by Default</asp:ListItem>
                                <asp:ListItem Value="Allow">Allow Appraisee View only</asp:ListItem>
                                <asp:ListItem Value="SignOff">Allow Appraisee View and Sign off</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:HiddenField ID="hfNoticePermission" runat="server" />
                            <img height="30" width="35" class="imgNotice" runat="server" id="imgNoticePermission" src="../images/email.png" title="Email Notification" />

                        </td>
                    </tr>
                </table>

                <br />
                <br />
                <br />

            </div>

            <div id="ContentTitleLeft2">
                <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                <img id ="img_2" class="imgHelp" src="../images/help2.png" title="Help Content" />

            </div>
            <br />
            <div  style="text-align: left; width:100%; font-style: italic; color: orangered">
                <asp:CheckBox ID="CheckBoxAutoEmailNotice" runat="server"  Checked="true"  Text="Automatically send email notificaiton to your Appraisee/Appraiser when you sign off the Appraisal" OnCheckedChanged="CheckBoxAutoEmailNotice_CheckedChanged" />
            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" Visible="false" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="BtnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />
            <asp:Button ID="btnNext" Visible="false" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="BtnNext_Click" />
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine"  CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 95%"></div>
                <div style="display: inline; width: 5%; float: right;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%"   src="iBlankPage.html" runat="server"></iframe>
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
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentdatetime" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentUserName" runat="server" Value="" />

            <asp:HiddenField ID="hfPageReadonly" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var SignOffWho;
    var SignOffImg;
    function pageLoad(sender, args) {
        $(document).ready(function () {


            // var vHeight = screen.height - 150 - 210 ;
            // $("section").css("height", vHeight)
            // Highlight_LeftMenuSelectNode();


            //$("#closeActionPOP").click(function (event) {
            //    $("#ActionPOPDIV").fadeToggle("fast");
            //});


            //$(".labelTitle").dblclick(function (event) {
            //    EditPageItemTitle();
            //});

        });

    }




</script>
