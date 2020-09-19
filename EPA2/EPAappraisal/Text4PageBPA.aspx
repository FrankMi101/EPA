<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Text4PageBPA.aspx.cs" Inherits="EPA2.EPAappraisal.Text4PageBpa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        table {
            width: 99%;
        }

        th {
             padding-left:5px;
             border: 1px solid silver; 
            background-color: green;
            color: white;
            font-family: Arial, sans-serif;
            font-size: small;
        }

        td {

            width: 25%;
            /*border:1px solid silver;*/
        }

        .myTextEdit {
            width: 99%;
            height: 500px;
            /*border:1px solid silver;*/
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 600;
            font-size: 1.2em;
        }

      
        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            font-size:0.8em;
            color:yellow;
        }
   header {
        display:none;
        }
     #btnViewALP {
        background-color:lightcyan;
        border: 2px outset, #0094ff;
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

     .myTextEdit {
        height:350px;
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
                    <img class="imgChat"  runat="server"  id="imgAGP"   src="../images/help.png" title="Help Workflow"   visible="false" />
                    <img class="imgEP" runat="server" id="imgEP" src="../images/ep.png" title="Effective Practice" visible="false" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />
                  <%--  <asp:Button ID="btnViewAGP" runat="server" Text="RollOver Last Year AGP" OnClick="btnViewAGP_onClick" />--%>
                </div>
                <div id="ContentTitleRight" style="display: inline; float: right">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>
           
             <div class="ContentTextarea">
                <table  style="border-collapse: collapse; border-spacing: 0; border:1px">
                    <tr>
                        <th>
                            <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label><br />
                           <asp:Label ID="labelSubTitle1" runat="server" CssClass="labelSubTitle">Text Box Title</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label><br />
                             <asp:Label ID="labelSubTitle2" runat="server" CssClass="labelSubTitle">Text Box Title</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label> <br />
                            <asp:Label ID="labelSubTitle3" runat="server" CssClass="labelSubTitle">Text Box Title</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label><br />
                            <asp:Label ID="labelSubTitle4" runat="server" CssClass="labelSubTitle">Text Box Title</asp:Label>
                            <br /><br />
                            <asp:DropDownList ID="ddlResultSession" runat="server"  AutoPostBack="true"  OnSelectedIndexChanged="ddlResultSession_SelectedIndexChanged">
                    <asp:ListItem Value="Mid">Mid -term feedback</asp:ListItem>
                    <asp:ListItem Value="Final">Final feedback</asp:ListItem>
                </asp:DropDownList>
                        </th>
                    </tr>
                    <tr>
                        <td>
                           <asp:TextBox ID="myText1" runat="server" CssClass="myTextEdit" OnTextChanged="myText1_TextChanged" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="myText2" runat="server" CssClass="myTextEdit" OnTextChanged="myText2_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="myText3" runat="server" CssClass="myTextEdit" OnTextChanged="myText3_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="myText4" runat="server" CssClass="myTextEdit" OnTextChanged="myText4_TextChanged" TextMode="MultiLine"></asp:TextBox></td>

                    </tr>
                </table>
            </div>
            <br />
            <br />
          <%--  <asp:Button ID="btnAddNewAGP" runat="server" Text="Add New AGP" OnClick="btnAddNewAGP_Click" />--%>



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
            <asp:HiddenField ID="hfContentChange1" runat="server" />
            <asp:HiddenField ID="hfContentChange2" runat="server" />
            <asp:HiddenField ID="hfContentChange3" runat="server" />
            <asp:HiddenField ID="hfContentChange4" runat="server" />
 
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

    var currentTR;
    var eventCell;
    var seqNo;
    var actionItem;
    var DomainID = "1";
    var CompetencyID = "1";
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
      
        $(".myTextEdit").click(function (event) {
            var tId = $(this)[0].id;
            $("#hfWorkingCell").val(tId);
            DomainID = tId.replace("myText", "");
        });
        $(".myTextEdit").keydown(function (event) {
            CountTextBoxCharactors();
        });
        $(".myTextEdit").change(function (event) {
            if ($("#hfPageReadonly").val() != "Yes") {
                var tId = $(this)[0].id.replace("myText", "");
                $("#hfContentChange" + tId).val("1");
                $("#hfContentChange").val("1");
            }
        });
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
        $("table .labelTitle2").dblclick(function (event) {
            var objId = $(this)[0].id;
            ItemCode = ItemCode + objId.replace("labelTitle", "")
            EditPageItemTitle();
            event.stopPropagation();
        });
        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });
        $("#btnViewAGP").click(function (event) {
            if ($("#btnViewAGP")[0].value == "View Last AGP") {
                window.open("Text4PageAGP2.aspx", "", "width=1000 height=700, top=2, left=2, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");

                return false;
            }
            else { return true; }
        });

        $(".imgChat").click(function (event) {
            window.open("Loading3.aspx?pID=AGPChat", "", "width=1000 height=700, top=2, left=2, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,");

        });

    });
    function updateTextCellAfterContentAction() {
        try {
            var workingCell = $("#hfWorkingCell").val();
 
            BasePara.Operate = "Comment";
            BasePara.Value = $("#" + workingCell).val();
            EPA2.Models.WebService1.SaveGridCellText("AGP", BasePara, onSuccess, onFailure);
         //   var rValue = EPA2.Models.WebService1.SaveAGPText("Comment", UserID, CategoryID, AreaID, ItemCode, seqNo, actionItem, value, onSuccess, onFailure);
        }
        catch (e)
        { window.alert("Update Text Cell Failed!"); }


    }
    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }

</script>