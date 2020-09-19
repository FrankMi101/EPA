<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="DomainText1Log.aspx.cs" Inherits="EPA2.EPAappraisal.DomainText1Log" %>

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
            color: #75ab75;
        }

        .ContentSubTitle, .ContentMessage {
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
    </style>
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
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
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" />

                </div>

            </div>
            <div class="ContentSubTitle">
                <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitle">Text Box Sub Title</asp:Label>
            </div>
            <div class="ContentMessage">
                <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Text Box Message</asp:Label>
            </div>
            <br />
            <div class="ContentCompetency" runat="server">
                <ul id="ContentCompetency" runat="server">
                </ul>
            </div>

            <div id="ContentTitleRight" style="width: 300px; display: inline-block; float: right">
                Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
            </div>
            <div class="ContentTextarea">
                <asp:TextBox ID="myText" runat="server" OnTextChanged="MyText_TextChanged" Height="400px" MaxLength="2000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="BtnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="BtnNext_Click" />
            <asp:Button ID="btnCompetency" runat="server" Text="" OnClick="BtnCompetency_Click" />

        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="TitleEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextTitleEdit" runat="server" Width="98%" Height="40px" TextMode="MultiLine" spellcheck="true" placeholder="Title"></asp:TextBox>
            <asp:TextBox ID="TextSubTitleEdit" runat="server" Width="98%" Height="80px" TextMode="MultiLine" spellcheck="true" placeholder="Sub Title"></asp:TextBox>
            <asp:TextBox ID="TextHelpEditL" runat="server" Width="98%" Height="320px" TextMode="MultiLine" spellcheck="true" placeholder="Help Content"></asp:TextBox>
            <asp:Button ID="ButtonTitleSave" runat="server" Text="Save" />
            <asp:CheckBox ID="chbMessage" runat="server" Text="Message Content" Checked="false" />
        </div>

        <div id="ActionMenuDIV" class="bubble epahide">
            <ul>
                <li><a id="LookFors" class="menuLink" href="#">Competency LookFors </a></li>
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
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" src="iBlankPage.html" runat="server"></iframe>
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
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
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



    var parameter = {
        UserID = $("#hfUserID").val(),
        CategoryID = $("#hfCategory").val(),
        AreaID = $("#hfArea").val(),
        ItemCode = $("#hfCode").val(),
        DomainID = $("#hfDomainID").val(),
        CompetencyID = $("#hfCompetencyID").val(),
        ItemCode = $("#hfCompetencyID").val(),
        ActionRole = $("#hfAppraisalActionRole").val(),
        SchoolYear: $("#hfApprYear").val(),
        SchoolCode: $("#hfApprSchool").val(),
        SessionID: $("#hfApprSession").val(),
        EmployeeID: $("#hfApprEmployeeID").val(),
        Value: "",
        Operate: "Get"
    };
    var workingItem = $("#hfCompetencyID").val();
    var imgItem = "img_" + workingItem;
    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)

        Highlight_LeftMenuSelectNode();
        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }

        $('.cList').each(function () {
            if ($(this)[0].id == workingItem) {
                $(this).addClass("WorkingItem");
                workingItem = $(this);

            }
        });


        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});
        //$(".labelTitle").dblclick(function (event) {
        //    EditPageItemTitle();
        //});
        $(".ContentCompetency").mouseenter(function (event) {
            SaveCompentencyTextContent();
        });
        $("#btnSave").click(function (event) {
            SaveCompentencyTextContent();
            return false;
        });
        $("#ContentCompetency a").click(function (event) {
            parameter.CompetencyID = $(this)[0].id;
            $("#hfCompetencyID").val(parameter.CompetencyID);

            if (workingItem != undefined) {
                workingItem.removeClass("WorkingItem");
            }
            $(this).addClass("WorkingItem");
            workingItem = $(this);
            imgItem = "img_" + parameter.CompetencyID;
            GetCompentencyTextContent();
            //  GetCompentencyRateContent();
            // var saveButton = $("#btnCompetency");
            //  saveButton.click();
        });

    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }

    function onSuccessDC(result) {
        $("#myText").val(result);
    }

    function GetCompentencyTextContent() {
        parameter.DomainID = $("#hfDomainID").val();
        parameter.CompetencyID = $("#hfCompetencyID").val();
        var returntext = EPA2.Models.WebService1.GetCompetencyContentLog1("GetLog", parameter, onSuccessDC, onFailure);
       // var helptext = EPA2.Models.WebService1.GetCompetencyContentLog("Get", UserID, CategoryID, AreaID, ItemCode, domainId, competencyId, ActionRole, onSuccessDC, onFailure);
    }

    function SaveCompentencyTextContent() {
        var appraisalPageTextChange = $("#hfContentChange").val();
        if (appraisalPageTextChange === "1") {
            parameter.DomainID = $("#hfDomainID").val();
            parameter.CompetencyID = $("#hfCompetencyID").val();
            parameter.Value =  $("#myText").val(); 
            var returntext = EPA2.Models.WebService1.SaveCompetencyContentLog1("SaveLog", parameter,  onSuccess, onFailure);
          //  var returntext = EPA2.Models.WebService1.SaveCompetencyContentLog("Save", UserID, CategoryID, AreaID, ItemCode, domainId, competencyId, ActionRole, textValue, onSuccess, onFailure);
            $("#hfContentChange").val("0")
            // var saveButton = $("#btnSave");
            // saveButton.click();
        }
    }
</script>
