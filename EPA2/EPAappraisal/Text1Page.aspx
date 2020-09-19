<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text1Page.aspx.cs" Inherits="EPA2.EPAappraisal.Text1Page" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        header {
            display: none;
        }

        .ContentSubTitle {
            text-align: left;
            display: inline-block;
        }

        #ContentTitleLeft {
            display: inline;
            float: left;
            width: 75%;
        }

        #ContentTitleRight {
            display: inline;
            float: right;
            text-align: right;
            width: 25%;
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
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgEP" runat="server" id="imgEP" src="../images/ep.png" title="Effective Practice" visible="false" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />

                </div>
                <div id="ContentTitleRight">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>
            <br />
            <div class="ContentSubTitle">
                <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitle">Text Box Sub Title</asp:Label>
            </div>
            <div class="ContentMessage">
                <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Text Box Message</asp:Label>
            </div>
            <div class="ContentTextarea">
                <asp:TextBox ID="myText" runat="server" CssClass="myTextEdit" OnTextChanged="MyText_TextChanged" spellcheck="true" Height="525px" MaxLength="5000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>


        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="BtnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="BtnNext_Click" />
        </footer>


        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" contenteditable="true" placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
            <%-- <div id="textHelp"></div>--%>
        </div>


        <div id="ActionMenuDIV" class="bubble epahide">
            <ul>
                <li><a id="CommentsBank" class="menuLink" href="#">Comments Bank </a></li>
                <li><a id="SchoolLearningPlan" class="menuLink" href="#">School Learning Plan</a></li>
                <li><a id="BoardStrategyPlan" class="menuLink" href="#">Board Strategy Plan</a>  </li>
                <li><a id="Recovery" class="menuLink" href="#">Content Recover</a>  </li>
                <li><a id="CommentsSnippet" class="menuLink" href="#">Comments Snippet</a>  </li>
            </ul>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 410px; width: 99%" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
            <asp:HiddenField ID="hfSignOff" runat="server" />
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
            <asp:HiddenField ID="hfWorkingCell" runat="server" Value="myText" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />

            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var appraisalYear;
    var DomainID = "0";
    var CompetencyID = "0";


    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();

        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }
        else { $("#myText").addClass("myEditItem"); }


        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});


        //$(".labelTitle").dblclick(function (event) {
        //    EditPageItemTitle();
        //});
        $(".myTextEdit").click(function (event) {
            var tId = $(this)[0].id;
            $("#hfWorkingCell").val(tId);
        });
    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
        $("#myText").removeClass("myEditItem");
        $("#myText").addClass("myEditItemDisable");
    }
    function updateTextCellAfterContentAction() {
        try {
            //  var workingCell = $("#hfWorkingCell").val();
            //  var value = $("#" + workingCell).val();
            //   var rValue = EPA2.Models.WebService1.SaveAGPText("Comment", UserID, CategoryID, AreaID, ItemCode, seqNo, actionItem, value, onSuccess, onFailure);
        }
        catch (e) { window.alert("Update Text Cell Failed!"); }


    }
</script>
