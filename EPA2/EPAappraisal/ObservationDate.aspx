<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="ObservationDate.aspx.cs" Inherits="EPA2.EPAappraisal.ObservationDate" %>

<!DOCTYPE html>


<html>
<head runat="server">
    <title></title>
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />


    <style>
        body {
            width: 99%;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-size: 1.0em;
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
            font-weight: 600;
            height: 25px;
        }

        .ContentTitleLeft {
            float: left;
            display: block;
            width: 100%;
        }

        .myDomain, .myCompetency {
            display: none;
        }

        .myCommentsText {
            background-color: transparent;
            border: 0;
        }
        .ObservationDate {
            width:100px;
        }
         .ui-datepicker-trigger
        {
            margin-bottom:10px;
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
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" style="margin-bottom:10px;" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" style="margin-bottom:10px;" />

                </div>

            </div>

            <div class="ContentTitleLeft" style="display: block;">

                <div class="container visible-xs visible-sm visible-md visible-lg">
                    <div class="row" style="width: 100%">
                        <div class="col-xs-12 col-sm-4 col-md-4  col-lg-4">
                            <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                            <br />
                            <input runat="server" type="text" id="dateObservationPre" name="PreObservation" class="ObservationDate" size="9" />
                            <br />
                            <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4  col-lg-4">
                            <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                            <br />
                            <input runat="server" type="text" id="dateObservation" name="Observation" class="ObservationDate" size="9" />
                            <br />
                            <asp:Label ID="labelTitle5" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4  col-lg-4">
                            <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                            <br />
                            <input runat="server" type="text" id="dateObservationPost" name="PostObservation" class="ObservationDate" size="9" />
                            <br />
                            <asp:Label ID="labelTitle6" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        </div>
                    </div>
                </div>
                <%-- <table style="width:90%; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size:small;">
                    <tr>
                        <td>
                            </td>
                        <td>
                           </td>
                        <td>
                           </td>
                    </tr>
                   
                </table>--%>
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
                <li><a id="Recovery" class="menuLink" href="#">Content Recover</a>  </li>

            </ul>
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
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfRubricText" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />


        </div>
    </form>
</body>
</html>

<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID;
    var CompetencyID;
    var currentTR;
    var eventCell;
    $(document).ready(function () {
        var vWidth = (window.innerWidth > 0) ? window.innerWidth : screen.width;
        var vHeight = (window.innerHeight > 0) ? window.innerHeight : screen.height;

        $("section").css("height", vHeight - apprScreenH);
        Highlight_LeftMenuSelectNode();
        //   var minD = new Date($("#hfSchoolyearStartDate").val());
        //    var maxD = new Date($("#hfSchoolyearEndDate").val()); 


        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }
        else {
            $("#dateObservation").datepicker(
                {
                    dateFormat: 'yy/mm/dd',
                    showOn: "button",
                    buttonImage: "../images/calendar.gif",
                    buttonImageOnly: true,
                    changeMonth: true,
                    changeYear: true,
                    //minDate: minD,
                    //maxDate: maxD,
                    val: new Date().toDateString
                });
            $("#dateObservationPre").datepicker(
                {
                    dateFormat: 'yy/mm/dd',
                    showOn: "button",
                    buttonImage: "../images/calendar.gif",
                    buttonImageOnly: true,
                    changeMonth: true,
                    changeYear: true,
                    //minDate: minD,
                    //maxDate: maxD,
                    val: new Date().toDateString
                });

            $("#dateObservationPost").datepicker(
                {
                    dateFormat: 'yy/mm/dd',
                    showOn: "button",
                    buttonImage: "../images/calendar.gif",
                    buttonImageOnly: true,
                    changeMonth: true,
                    changeYear: true,
                    //minDate: minD,
                    //maxDate: maxD,
                    val: new Date().toDateString
                });
        }


        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
        $(".labelTitle").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });
        $(".labelTitleX").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });

        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });
        $(".ObservationDate").change(function (event) {
            $("#hfContentChange").val("1");
        });

    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
        $(".ObservationDate").attr("disabled", "disabled");
    }

</script>
