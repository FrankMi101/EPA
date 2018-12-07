<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Text4PageAPM.aspx.cs" Inherits="EPA2.EPAappraisal.Text4PageAPM" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        body {
            width: 99.9%;
        }

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

        .ContentSubTitle, .ContentMessage {
            display: none;
        }


        .WorkingItem {
            color: blue !important;
            font-weight: 500;
            height: 25px;
        }

        .ContentTitleLeft {
            float: left;
            display: block;
            width: 100%;
        }

        #ActionMenuDIV {
            height: 150px;
        }

        .highlightBoard {
            border: 1px solid dodgerblue;
        }


        .meetingContent {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            border: 0px;
            margin-left: -1px;
            margin-right: -2px;
            padding-right: 0px;
            width: 98%;
        }

        .meetingDate {
            margin-right: 0px;
            text-align: center;
        }

        span {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: medium;
        }

        table {
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #808080;
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

        <header style="display: none">
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft" class="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgEP" runat="server" id="imgEP" src="../images/ep.png" title="Effective Practice" visible="false" />
                </div>
                <div id="ContentTitleRight" style="display: inline; float: right">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>

            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%; height: 580px;">
                    <table style="border: 1px solid lightblue" id="MeetingTable">
                        <tr>

                            <th style="width: 15%">Meeting Date</th>
                            <th style="width: 85%">Meeting Content</th>
                        </tr>
                        <tr>

                            <td><span>1st Meeting  </span>
                                <br />
                                <input runat="server" type="text" class="meetingDate" id="MeetingDate1" name="MeetingDate1" size="9" onserverchange="MeetingDate1_DateChange" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextMeetingContent1" runat="server" CssClass="meetingContent" OnTextChanged="TextMeetingContent1_TextChange" Height="130px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td><span>2nd Meeting  </span>
                                <br />
                                <input runat="server" type="text" class="meetingDate" id="MeetingDate2" name="MeetingDate2" size="9" onserverchange="MeetingDate2_DateChange" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextMeetingContent2" runat="server" CssClass="meetingContent" OnTextChanged="TextMeetingContent2_TextChange" Height="130px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td><span>3rd Meeting  </span>
                                <br />
                                <input runat="server" type="text" class="meetingDate" id="MeetingDate3" name="MeetingDate3" size="9" onserverchange="MeetingDate3_DateChange" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextMeetingContent3" runat="server" CssClass="meetingContent" OnTextChanged="TextMeetingContent3_TextChange" Height="130px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>

                            <td><span>4th Meeting  </span>
                                <br />
                                <input runat="server" type="text" class="meetingDate" id="MeetingDate4" name="MeetingDate4" size="9" onserverchange="MeetingDate4_DateChange" />
                            </td>
                            <td>
                                <asp:TextBox ID="TextMeetingContent4" runat="server" CssClass="meetingContent" OnTextChanged="TextMeetingContent4_TextChange" Height="130px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
            <%--     <asp:Button ID="btnCompetency" runat="server" Text="" OnClick="btnCompetency_Click" />--%>
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="ActionMenuDIV" class="bubble epahide">
            <ul>
                <li><a id="CommentsBank" class="menuLink" href="#">Comments Bank </a></li>
                <li><a id="SchoolLearningPlan" class="menuLink" href="#">School Learning Plan</a></li>
                <li><a id="BoardStrategyPlan" class="menuLink" href="#">Board Strategy Plan</a>  </li>
                <li><a id="Recovery" class="menuLinkAGP" href="#">Content Recover</a>  </li>
                <li><a id="OLFLibrary" class="menuLinkAGP" href="#">Ontario Leadership Framework</a>  </li>

            </ul>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 370px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div id="TextEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextCommentsEdit" runat="server" Width="99%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
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
            <asp:HiddenField ID="hfTextLength" runat="server" Value="500" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfWorkingCell" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />


        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<%--<script src="../Scripts/GridView.js"></script>--%>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = "1";
    var CompetencyID = "1";
    var currentTR;
    var eventCell;
    var seqNo;
    var actionItem;

    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight) 
        Highlight_LeftMenuSelectNode();

        $("#MeetingDate1").datepicker(
           {
               dateFormat: 'yy/mm/dd',
               showOn: "button",
               buttonImage: "../images/calendar.gif",
               buttonImageOnly: true,
               changeMonth: true,
               changeYear: true,
               val: new Date().toDateString
           });
        $("#MeetingDate2").datepicker(
            {
                dateFormat: 'yy/mm/dd',
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                val: new Date().toDateString
            });
        $("#MeetingDate3").datepicker(
     {
         dateFormat: 'yy/mm/dd',
         showOn: "button",
         buttonImage: "../images/calendar.gif",
         buttonImageOnly: true,
         changeMonth: true,
         changeYear: true,
         val: new Date().toDateString
     });
        $("#MeetingDate4").datepicker(
     {
         dateFormat: 'yy/mm/dd',
         showOn: "button",
         buttonImage: "../images/calendar.gif",
         buttonImageOnly: true,
         changeMonth: true,
         changeYear: true,
         val: new Date().toDateString
     });

        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }


        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
        $(".labelTitle").dblclick(function (event) {
            ItemCode = ItemCode + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });
        $(".labelTitleX").dblclick(function (event) {
            ItemCode = ItemCode + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });

        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });

        $(".meetingContent").change(function (event) {
            $("#hfContentChange").val("1");
        });
        $(".meetingDate").change(function (event) {
            $("#hfContentChange").val("1");
        });

    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }

</script>
