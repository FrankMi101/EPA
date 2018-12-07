<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="LTO8Comments.aspx.cs" Inherits="EPA2.EPAappraisal.LTO8Comments" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <%--    <link href="../Content/ListPage.css" rel="stylesheet" />--%>
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        body {
        width:99.9%;
        }
        table {
            height: 99.5%;
            width: 99.5%;
        }

        .EditTable {
            font-family: Arial;
            font-size: 14px;
            border-spacing: 0;
            border-collapse: collapse;
        }

        .cRequired {
            color: red;
            font-size: xx-small;
            font-family: Arial;
            display: none;
        }

        .CommentsC {
            width: 100%;
            height: 100%;
            background-color: lightyellow;
            text-wrap: normal;
            border: 0;
        }

        .RBL {
            text-wrap: normal;
        }

        .CompentencyTitle {
            font-weight: 600;
            font-family: Arial;
        }

        .LookforList {
        }

        li {
            color: blue;
        }

        ul {
            margin-left: -15px;
            margin-top: 0px;
            margin-bottom: 5px;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-size: 1.2em;
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

        .ContentTitleLeft {
            float: left;
            display: block;
            width: 100%;
        }

        .myDomain, .myCompetency {
            display: none;
        }


        td {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: 13px;
        }

        .EditTable > tbody > tr > td {
            border: 1px solid #808080;
        }

        .HighlightRow {
            border: 2px solid red;
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
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" />

                </div>
                <div id="CountDIV" class="bubble epahide" style="color: red; font-family: Arial; font-size: small;">
                    <asp:Label runat="server" ID="textNo" Width="200px"></asp:Label>
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                </div>
            </div>

            <div id="tpaContaint" style="overflow: auto; width: 100%; height: 95%; display: inline-block">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <table class="EditTable">
                            <tr style="height: 25px; background-color: darkcyan; color: white; font-weight: 600; font-size: small;">
                                <td style="width: 40%">The Teacher:</td>
                                <td style="width: 19%">Rating</td>
                                <td colspan="2" style="width: 41%">Comments <span style="font-size: xx-small; color: yellow">250 characters limit per box</span>
                                    <div style="font-size: xx-small">(required if Development Needed rating given) </div>
                                </td>

                            </tr>
                            <tr id="WorkingRow1" runat="server" class="WorkingRow">
                                <td style="width: 40%">
                                    <div id="Compentency1" runat="server">
                                    </div>
                                </td>
                                <td style="width: 19%">
                                    <asp:RadioButtonList ID="RBL1" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL1" runat="server" class="cRequired">Comments required</div>

                                </td>
                                <td style="width: 40%">

                                    <textarea id="TextCompentency1" runat="server" rows="5" cols="50" placeholder="required"
                                        class="CommentsC"> </textarea>

                                </td>
                                <td style="width: 1%">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextCompentency1" runat="server" ErrorMessage="Must input Field No.1" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow2" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency2" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL2" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL2" runat="server" class="cRequired">Comments required</div>
                                </td>
                                <td>
                                    <textarea id="TextCompentency2" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextCompentency2" runat="server" ErrorMessage="Must input Field No.2" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow3" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency3" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL3" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL3" runat="server" class="cRequired">Comments required</div>
                                </td>
                                <td>
                                    <textarea id="TextCompentency3" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextCompentency3" runat="server" ErrorMessage="Must input Field No.3" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow4" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency4" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL4" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL4" runat="server" class="cRequired">Comments required</div>
                                </td>
                                <td>
                                    <textarea id="TextCompentency4" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextCompentency4" runat="server" ErrorMessage="Must input Field No.4" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow5" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency5" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL5" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL5" runat="server" class="cRequired">Comments required</div>
                                </td>

                                <td>
                                    <textarea id="TextCompentency5" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextCompentency5" runat="server" ErrorMessage="Must input Field No.5" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow6" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency6" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL6" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL6" runat="server" class="cRequired">Comments required</div>
                                </td>

                                <td>
                                    <textarea id="TextCompentency6" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextCompentency5" runat="server" ErrorMessage="Must input Field No.6" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr id="WorkingRow7" runat="server" class="WorkingRow">
                                <td>
                                    <div id="Compentency7" runat="server"></div>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="RBL7" runat="server" CssClass="RBL" Height="50px">
                                        <asp:ListItem Value="3">Meets Expectation</asp:ListItem>
                                        <asp:ListItem Value="4">Development Needed</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <div id="cRBL7" runat="server" class="cRequired">Comments required</div>
                                </td>

                                <td>
                                    <textarea id="TextCompentency7" runat="server" rows="5" cols="50"
                                        class="CommentsC"> </textarea>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="TextCompentency7" runat="server" ErrorMessage="Must input Field No.7" ForeColor="red" Font-Size="x-Large" SetFocusOnError="true" Enabled="false">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>

                            <tr id="WorkingRow8" runat="server" class="WorkingRow">
                                <td style="vertical-align: top">
                                    <div id="Compentency8" runat="server"></div>
                                </td>

                                <td colspan="3">

                                    <textarea id="TextCompentency8" runat="server" rows="8" cols="50" style="height: 150px; width: 100%"
                                        class="CommentsC"> </textarea>
                                    <textarea id="Textarea1" runat="server" rows="1" cols="1"
                                        class="CommentsC" visible="false"> </textarea>
                                </td>

                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
            <asp:HiddenField ID="txtSelectedCompentencyID" runat="server" />



        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = "1";
    var CompetencyID;
    var currentTR;
    var eventCell;
    function pageLoad(sender, args) {
        $(document).ready(function () {
            var vHeight = window.innerHeight - apprScreenH;
            $("section").css("height", vHeight)
            Highlight_LeftMenuSelectNode();


            $(".CommentsC").click(function (event) {
                var tID = event.currentTarget.id;
                var vNo = tID.replace("TextCompentency", "");
                $("#textNo").text("Text Box No." + vNo + " Characters limit: ");
            });
            $(".CommentsC").focus(function (event) {
                //var vTop = event.target.parentNode.offsetTop + 20;
                //var vLeft = event.target.parentNode.offsetLeft - 100;
                var workingID = event.target.id;
                CountTextBoxCharactors(workingID);
                $("#CountDIV").css({
                    top: 1,
                    left: 580,
                    height: 20,
                    width: 250
                })

                $("#CountDIV").fadeToggle("fast");
            });
            $(".CommentsC").focusout(function (event) {
                $("#CountDIV").fadeToggle("fast");
            });
            $(".WorkingRow").mouseenter(function (event) {
                var tID = event.currentTarget.id;

                $("#" + tID).addClass("HighlightRow");
            });
            $(".WorkingRow").mouseleave(function (event) {
                var tID = event.currentTarget.id;

                $("#" + tID).removeClass("HighlightRow");
            });
            $(".CommentsC").keydown(function (event) {
                eventCell = $(this);
                var workingID = eventCell[0].id
                var vTop = event.currentTarget.offsetTop + 10;
                CountTextBoxCharactors(workingID);
            });
            $(".CommentsC").change(function (event) {
                eventCell = $(this);
                var value = eventCell[0].value;
                var tID = event.currentTarget.id;
                CompetencyID = tID.replace("TextCompentency", "");
                var rateVaue = "";
                if (CompetencyID === "8")
                { rateVaue = "3"; }
                else {
                    rateVaue = $("#RBL" + CompetencyID).val();
                }

                var textValue = value;
                var helptext = EPA2.Models.WebService1.SaveCompetencyContent("SaveComments", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, rateVaue, textValue, onSuccess, onFailure);
            });
            $(".RBL").change(function (event) {
                var tID = event.currentTarget.id;
                CompetencyID = tID.replace("RBL", "");
                var rateVaue = event.target.value;
                var rateText = event.target.innerText;
                var textValue = $("#TextCompentency" + CompetencyID).val();
                var rMessage = $("#cRBL" + CompetencyID);
                if (rateVaue == "4") {
                    if (textValue.length < 1)
                    { rMessage.show(); }
                }
                else { rMessage.hide(); }
                var helptext = EPA2.Models.WebService1.SaveCompetencyContent("Save", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, rateVaue, textValue, onSuccess, onFailure);
            });

            if ($("#hfPageReadonly").val() == "Yes") {
                DisableTextEdit();
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

        });

    }

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
        $(".RBL").attr("disabled", "disabled");

    }
    function onSuccess() { }
    function onFailure() { }

    function CountTextBoxCharactors(workingID) {
        try {
            $("#hfContentChange").val("1");
            var maxCount = "250";
            if (workingID.replace("TextCompentency", "") == "8") {
                maxCount = "500";
            }
            var nCnt = $("#" + workingID).val().length;
            if (nCnt > maxCount) {
                window.alert("Text longer than " + maxCount + " charaters");
            }
            else {
                $("#textCount").val(maxCount - nCnt);
            }
        }
        catch (e)
        { }

    }

</script>
