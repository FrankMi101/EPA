<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Text5PageIMP.aspx.cs" Inherits="EPA2.EPAappraisal.Text5PageImp" %>

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

        #GridView1 textarea {
            height: 140px;
            width: 90%;
            border: 1px solid #b6b4b4;
            border-bottom: 0px;
            border-top: 0px;
            border-left: 0px;
            margin: 0px;
            padding: 0px;
            background-color: transparent;
        }

        #btnViewAGP {
            background-color: lightcyan;
            border: 2px outset, #0094ff;
        }

        #GridView1 {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: small;
        }

            #GridView1 th {
                font-weight: 100;
            }

        #ActionDeleteDIV {
            border: 2px solid lightsalmon;
            width: 300px;
            height: 60px;
            text-align: center;
        }

        .saveButton1 {
            border: 2px outset lightsalmon;
            background-color: lavender;
            width: 150px;
        }

            .saveButton1:hover {
                background-color: lightsalmon;
            }

        .Criteria {
            font-size: small;
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
                    <img class="imgChat" src="../images/help.png" title="Help Workflow" id="APP" visible="false" />
                    <img class="imgEP" runat="server" id="imgEP" src="../images/ep.png" title="Effective Practice" visible="false" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />
                    <%-- <asp:Button ID="btnViewAGP" runat="server" Visible="false" Text="RollOver Last Year AGP" OnClick="btnViewAGP_onClick" />--%>
                </div>
                <div id="ContentTitleRight" style="display: inline; float: right">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>

            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%; height: 620px;">
                    <%-- <div style="overflow: hidden;" id="DivHeaderRow">
                        <table id="GridView2" style="border: 1px ridge gray; width: 99%; height: 30px; background-color: white;" rules="all" cellspacing="0" cellpadding="0">
                        </table>
                    </div>--%>

                    <div style="overflow: scroll; width: 100%; height: 100%" id="DivMainContent">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="0" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="0" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:BoundField DataField="SeqNo" HeaderText="No" ItemStyle-CssClass="SequenceNo">
                                    <ItemStyle Width="1%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Criteria" HeaderText="Element of Criteria for Rating" ItemStyle-CssClass="Criteria">
                                    <ItemStyle Width="15%" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Explanation of Concern">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextConcern" runat="server" Text='<%# Eval("Concern") %>' CssClass="Concern, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Practices and Competencies Needing Attention">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextPractices" runat="server" Text='<%# Eval("Practices") %>' CssClass="Practices, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Steps to Be Taken">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextSteps" runat="server" Text='<%# Eval("Steps") %>' CssClass="Steps, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Indicators of Success">
                                    <ItemStyle Width="13%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextIndicators" runat="server" Text='<%# Eval("Indicators") %>' CssClass="Indicators, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To Be Completed by">
                                    <ItemStyle Width="10%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextCompleted" runat="server" Text='<%# Eval("Completed") %>' CssClass="Completed, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="cornflowerblue" ForeColor="white" Height="25px" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />

                            <SelectedRowStyle BackColor="#9471DE" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                    </div>
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
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" contenteditable="true" placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
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
        <div id="ActionDeleteDIV" class="bubble epahide">
            <asp:Label ID="label1" runat="server">Are you sure to delete this Goal</asp:Label>
            <br />
            <br />
            <asp:Label ID="labelDelete" runat="server" CssClass="saveButton1" Width="100px">Delete</asp:Label>
            &nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="labelCancel" runat="server" CssClass="saveButton1" Width="100px">Cancel</asp:Label>
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
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
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

    var BasePara = {
        UserID: $("#hfUserID").val(),
        Category: $("#hfCategory").val(),
        Area: $("#hfArea").val(),
        ItemCode: $("#hfCode").val(),
        SchoolYear: $("#hfApprYear").val(),
        SchoolCode: $("#hfApprSchool").val(),
        SessionID: $("#hfApprSession").val(),
        EmployeeID: $("#hfApprEmployeeID").val(),
        Value: "",
        SeqNo: "",
        GoalItem:"",
        Operate: "Comment"
    }

    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();
        //   var minD = new Date($("#hfSchoolyearStartDate").val());
        //    var maxD = new Date($("#hfSchoolyearEndDate").val()); 
        $("#GridView1 th").mouseout(function (event) {
            $("#HelpDIV").fadeToggle("fast");
        });
        $("#GridView1 th").mouseenter(function (event) {
            try {

                eventCell = $(this);
                var xTitle = getTitleTips(eventCell[0].textContent);
                $("#textHelp").text(xTitle);
                var vTop = event.originalEvent.clientY;//  event.originalEvent.clientX event.currentTarget.offsetTop;
                var vLeft = event.originalEvent.clientX // event.currentTarget.offsetLeft;
                //   window.alert(vLeft + "  Top =" + vTop);
                $("#HelpDIV").css({
                    top: vTop + 10,
                    left: vLeft,
                    height: 80
                })
                $("#HelpDIV").fadeToggle("fast");

            }
            catch (ex) { }
        })

        $("#GridView1 tr").each(function () {
            try {


            }
            catch (ex) { }
        })

        $('td > .textAreaEdit').click(function (event) {
            eventCell = $(this);
            $("#hfWorkingCell").val(eventCell[0].id);

            BasePara.SeqNo = $(this).closest('tr').find('td.SequenceNo').text();
            BasePara.GoalItem = eventCell[0].className.replace(", textAreaEdit", "");

        });
        $('td > .textAreaEdit').change(function (event) {
            eventCell = $(this);

            BasePara.Value = eventCell[0].value;
            BasePara.Operate = "Comment";
            var rValue = EPA2.Models.WebService1.SaveGridCellText("IMP5", BasePara, onSuccess, onFailure);
            //    var rValue = EPA2.Models.WebService1.SaveIMPText("Comment", UserID, CategoryID, AreaID, ItemCode, seqNo, actionItem, value, onSuccess, onFailure);
        });
        //$("textarea").change(function (event) {
        //    eventCell = $(this);
        //    seqNo = $(this).closest('tr').find('td.SequenceNo').text();
        //    actionItem = eventCell[0].className.replace(", textAreaEdit", "");
        //    var value = eventCell[0].value;
        //    var rValue = EPA2.Models.WebService1.SaveAGPText("Comment", UserID, CategoryID, AreaID, ItemCode, seq, actionItem, value, onSuccess, onFailure);
        //});

        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }




        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});
        //$(".labelTitle").dblclick(function (event) {
        //    ItemCode = ItemCode + $(this)[0].id.replace("labelTitle", "");
        //    EditPageItemTitle();
        //});
        //$(".labelTitleX").dblclick(function (event) {
        //    ItemCode = ItemCode + $(this)[0].id.replace("labelTitle", "");
        //    EditPageItemTitle();
        //});

        //$("#btnSave").click(function (event) {
        //    // SaveCompentencyTextContent();
        //    //   return true;
        //});
        //$("#btnViewAGP").click(function (event) {
        //    if ($("#btnViewAGP")[0].value == "View Last AGP") {
        //        window.open("Text4PageAGP2.aspx", "", "width=1000 height=700, top=2, left=2, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");

        //        return false;
        //    }
        //    else { return true; }
        //});

        //$(".imgChat").click(function (event) {
        //    window.open("Loading3.aspx?pID=APPChat", "", "width=1000 height=700, top=2, left=2, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");

        //});

    });
    function updateTextCellAfterContentAction() {
        try {
            var workingCell = $("#hfWorkingCell").val(); 
            BasePara.Value = $("#" + workingCell).val();
            BasePara.Operate = "Comment";
            var rValue = EPA2.Models.WebService1.SaveGridCellText("IMP5", BasePara, onSuccess, onFailure);

          //  var rValue = EPA2.Models.WebService1.SaveIMPText("Comment", UserID, CategoryID, AreaID, ItemCode, seqNo, actionItem, value, onSuccess, onFailure);
        }
        catch (e) { window.alert("Update Text Cell Failed!"); }


    }
    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }
    function getTitleTips(xTitle) {
        var rVal = "";
        switch (xTitle) {
            case "Element of Criteria for Rating":
                rVal = 'Element of Criteria for Rating (as per the criteria from section 2.7.2.1,"Determining the Rating”)';
                break;
            case "Explanation of Concern":
                rVal = "Explanation of Concern";
                break;
            case "Practices and Competencies Needing Attention":
                rVal = "Practices (from the OLF) and Competencies (from Appendix A) Needing Attention";
                break;
            case "Steps to Be Taken":
                rVal = "Steps to Be Taken (developed by appraiser in consultation with appraisee)";
                break;
            case "Indicators of Success":
                rVal = "Indicators of Success(developed by appraiser in consultation with appraisee)";
                break;
            case "To Be Completed by":
                rVal = " Name of Appraiser";
                break;
            default:
                rVal = "Double clcik on Number to delete the Goal";
                break;
        }
        return rVal;
    }
</script>
