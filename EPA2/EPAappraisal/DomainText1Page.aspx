<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="DomainText1Page.aspx.cs" Inherits="EPA2.EPAappraisal.DomainText1Page" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            color: red;
        }

        .ContentMessage {
            display: none;
        }

        #RubricTable td {
            width: 33.33%;
        }

        .ContentRubric, .ContentCompetency {
            width: 100%;
        }

        #ContentCompetency, #ContentCompetency li {
            margin-left: -20px;
        }

            #ContentCompetency a {
                text-decoration: none;
                color: black;
            }

                #ContentCompetency a:hover {
                    text-decoration: underline;
                    color: purple;
                }

                #ContentCompetency a:visited {
                    color: forestgreen;
                }

        #btnCompetency {
            display: none;
        }

        .WorkingItem {
            color: blue !important;
            font-weight: 600;
            height: 25px;
        }

        header {
            display: none;
        }
         .HelpTextBox {
        height:98%; 
        width:100%;
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
                <div>
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text Content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />

                </div>
                <div class="ContentSubTitle">
                    <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitle">Text Box Sub Title</asp:Label>
                </div>

            </div>

            <div class="ContentMessage">
                <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Text Box Message</asp:Label>
            </div>

            <div class="ContentCompetency" runat="server">
                <ul id="ContentCompetency" runat="server">
                </ul>
            </div>
           
                        <div class="ContentRubric" style="display: inline; float: left">
                            <asp:RadioButtonList ID="rblRateRubric" runat="server" OnSelectedIndexChanged="rblRateRubric_SelectedIndexChanged" RepeatDirection="Horizontal" Width="500px"></asp:RadioButtonList>
                        </div>
                 
                        <div id="ContentTitleRight" style=" width:100%; display: inline; float: right">
                            Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                            <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                        </div>
               

            <div class="ContentTextarea">
                <asp:TextBox ID="myText" runat="server" OnTextChanged="myText_TextChanged" Height="400px" MaxLength="2000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
            <asp:Button ID="btnCompetency" runat="server" Text="" OnClick="btnCompetency_Click" />

        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="TitleEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextTitleEdit" runat="server" Width="98%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
            <asp:TextBox ID="TextSubTitleEdit" runat="server" Width="98%" Height="80px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Sub Title"></asp:TextBox>
            <asp:TextBox ID="TextHelpEditL" runat="server" Width="98%" Height="320px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Help Content"></asp:TextBox>
            <asp:Button ID="ButtonTitleSave" runat="server" Text="Save" />
            <asp:CheckBox ID="chbMessage" runat="server" Text="Message Content" Checked="false" />
        </div>

        <div id="ActionMenuDIV" class="bubble epahide">
            <ul>
                <li><a id="EvidenceLog" class="menuLink" href="#">Evidence Log </a></li>
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
            <asp:HiddenField ID="hfTextLength" runat="server" Value="2000" />
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

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = $("#hfDomainID").val();
    var CompetencyID = $("#hfCompetencyID").val();
    var workingItem = $("#hfCompetencyID").val();
    var imgItem = "img_" + workingItem
    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)

        Highlight_LeftMenuSelectNode();
        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }
        else { $("#myText").addClass("myEditItem"); }

        $('.cList').each(function () {
            if ($(this)[0].id == workingItem) {
                $(this).addClass("WorkingItem");
                workingItem = $(this);

            }
        });


        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
        $(".labelTitle").dblclick(function (event) {
            EditPageItemTitle();
        });
        $(".ContentCompetency").mouseenter(function (event) {
            // SaveCompentencyTextContent();
        });
        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            return true;
        });
        $("#myText").change(function (event) {
            SaveCompentencyTextContent(event);
        });
        $("#ContentCompetency a").click(function (event) {
            var competencyID = $(this)[0].id;
            $("#hfCompetencyID").val(competencyID);
            CompetencyID = competencyID;
            if (workingItem != undefined) {
                workingItem.removeClass("WorkingItem");
            }
            $(this).addClass("WorkingItem");
            workingItem = $(this);
            imgItem = "img_" + competencyID;
            GetCompentencyTextContent();
            GetCompentencyRateContent();
            // var saveButton = $("#btnCompetency");
            //  saveButton.click();
        });
        $("#rblRateRubric").click(function (event) {
            $("#hfContentChange").val("1");
            var rating = event.target.innerText;
            var pageReadonlyVal = $("#hfPageReadonly").val();
            if (pageReadonlyVal === "No") {
                $("#" + imgItem).attr("src", "../images/Edit2_Hired.jpg");
                var cID = $("#hfCompetencyID").val();
                var checkID = "[1,5,9,14,16,20]";
                var textPerson = "";
                if (cID == "1" || cID == "5" || cID == "9" || cID == "14" || cID == "16" || cID == "20") {
                    textPerson = $("#hfFirstName").val() + "\n\n";
                }
                var LengthmyText = $("#myText").val().length;
                var LengthLookfor = $("#myText").val().indexOf("Look Fors");
                var goDefaultText = "Yes"
                if (LengthmyText - 10 > LengthLookfor) {
                    goDefaultText = "No";
                    window.alert(" You have made the changes on the comments. To switch the Satisfactory/Unstaisfactory, please clean up the comments box first.");
                    return false;
                }
                if (goDefaultText == "Yes") {
                    var rubricText = $("#hfRubricText").val();
                    if (rating == "Unsatisfactory")
                    { rubricText = "Infreqently " + rubricText; }
                    var firstLineTomyText = textPerson + rubricText + "\n\n" + "  Look Fors:";
                    $("#myText").val(firstLineTomyText);
                    SaveCompentencyTextContent(event);
                }
            }

            event.stopPropagation();
        });
        $("#rblRateRubric label").mouseenter(function (event) {
            //    var pID = $(this)[0].id;
            var rating = event.currentTarget.innerText;
            var DomainID = ItemCode.replace("SUM5", "");
            var CompetencyID = $("#hfCompetencyID").val();
            var helptext = EPA2.Models.WebService1.GetRubricHelpContent(rating, UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, onSuccessRubirc, onFailure);

            var vTop = event.originalEvent.clientY;//  event.originalEvent.clientX event.currentTarget.offsetTop;
            var vLeft = event.originalEvent.clientX // event.currentTarget.offsetLeft;
            //   window.alert(vLeft + "  Top =" + vTop);
            $("#HelpDIV").css({
                top: vTop + 10,
                left: vLeft,
                height: 150
            })
            $("#HelpDIV").fadeToggle("fast");
        });
        $("#rblRateRubric label").mouseleave(function (event) {
            $("#HelpDIV").fadeToggle("fast");
        });
        //$('#myText').bind('paste', function (event) {
        //    alert('pasting!')
        //    $("#hfContentChange").val("1");
        //});
    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
        $("#rblRateRubric").attr("disabled", "disabled");
        // $("*[name$='rblRateRubric']").attr("disabled", "disabled");
        $("#myText").removeClass("myEditItem");
        $("#myText").addClass("myEditItemDisable");
    }

    function onSuccessRubirc(result) {
        $("#hfRubricText").val(result);
        $("#HelpTextContent").val(result);
    }
    function onSuccessDC(result) {
        $("#myText").val(result);
    }
    function onSuccessRate(result) {

        $('#rblRateRubric').find("input:radio:checked").prop('checked', false);
        $("#rblRateRubric").find("input[value='" + result + "']").prop("checked", "checked");
    }
    function initalRBList() {
        $('#rblRateRubric').each(function () {
            //  $(this).find('input:radio:checked').prop("checked", false);
            $(this).prop('checked', false);
        });
        //  var rateVaue = $("#rblRateRubric input:checked").val();
        //    $("#rblRateRubric").find("input[value='" + rateVaue + "']").attr("checked", "");
    }
    function GetCompentencyTextContent() {
        var DomainID = $("#hfDomainID").val();
        var CompetencyID = $("#hfCompetencyID").val();
        var helptext = EPA2.Models.WebService1.GetCompetencyContent("Get", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, onSuccessDC, onFailure);
    }
    function GetCompentencyRateContent() {
        var DomainID = $("#hfDomainID").val();
        var CompetencyID = $("#hfCompetencyID").val();
        var helptext = EPA2.Models.WebService1.GetCompetencyContent("Rate", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, onSuccessRate, onFailure);
    }
    function SaveCompentencyTextContent(event) {
        var appraisalPageTextChange = $("#hfContentChange").val();
        if (appraisalPageTextChange === "1") {

            var DomainID = $("#hfDomainID").val();
            var CompetencyID = $("#hfCompetencyID").val();
            var textValue = $("#myText").val();
            var rateVaue = $("#rblRateRubric input:checked").val();  //$('#radiobuttonListId').find(":checked").val();
            if (typeof rateVaue === 'undefined') {
                if (event.target.innerText == "Satisfactory")
                { rateVaue = "3"; }
                else if (event.target.innerText == "Unsatisfactory")
                { rateVaue = "5"; }
                else
                { rateVaue = "4"; }
            }
            var helptext = EPA2.Models.WebService1.SaveCompetencyContent("Save", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, rateVaue, textValue, onSuccess, onFailure);
            $("#hfContentChange").val("0");
            // var saveButton = $("#btnSave");
            // saveButton.click();
        }
    }
</script>
