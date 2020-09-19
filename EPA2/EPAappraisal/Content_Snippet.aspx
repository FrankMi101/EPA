<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_Snippet.aspx.cs" Inherits="EPA2.EPAappraisal.Content_Snippet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Help Edit</title>

    <style type="text/css">
        body {
            height: 99%;
            width: 99%;
            margin: auto;
        }

        div {
            font-family: Arial;
            font-size: small;
        }




        .SubstituedCell {
            color: red;
            text-decoration: underline;
        }

        .emptyData {
            font-size: xx-large;
            text-align: center;
            color: blue;
        }


        .FixedHeader {
            position: absolute;
            font-weight: bold;
            width: 100%;
            display: block;
        }

        .highlightBoard {
            border: 1px blue solid;
        }

        .defaultBoard {
            border: 1px blue none;
        }

        .BottonTab {
            height: 25px;
            display: inline;
            margin: 1px 0px -10px 0px;
            padding: 3px 5px 0px 5px;
            border: 1px solid lightsalmon;
            border-top-left-radius: 9px;
            border-top-right-radius: 9px;
            border-radius: 9px 9px 0px 0px;
            background-color: transparent;
        }

        .selectedTab {
            color: white;
            border-top: 3px solid orange;
            border-bottom: 2px solid dodgerblue;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue,dodgerblue ); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue,dodgerblue ); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue,dodgerblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient( lightblue,dodgerblue); /* Standard syntax */
        }

        img {
            height: 25px;
            width: 25px;
        }
        .SaveSnippet .RecoverSnippet {
        }
        .TextSnippet {
             height:125px;
       width:100%;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>
        <table style="height:100%; width:100%">
            <tr style="height: 33%">
                <td style="width: 2%">1. <br />
                    <img class="RecoverSnippet" id="Recover1" src="../images/Recover2.bmp" title="Copy No 1. Snippet comments to edit box" /></td>
                <td style="width: 95%">
                    <asp:TextBox ID="TextSnippet1" runat="server" CssClass="TextSnippet" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="User Comments Snippet 1"></asp:TextBox>
                </td>
                <td style="width: 3%">
                    <img id="Save1" class="SaveSnippet" src="../images/save.png"   title="Save your No 1. Snippet comments to Snippet Library"/></td>
            </tr>
            <tr style="height: 33%">
                <td>2. <br />
                    <img class="RecoverSnippet" id="Recover2" src="../images/Recover2.bmp" title="Copy No 2. Snippet comments to edit box" /></td>
                <td>
                    <asp:TextBox ID="TextSnippet2" runat="server" CssClass="TextSnippet"  TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="User Comments Snippet 1"></asp:TextBox>
                </td>
                <td>
                    <img id="Save2" class="SaveSnippet" src="../images/save.png"   title="Save your No 2. Snippet comments to Snippet Library"/></td>
            </tr>
            <tr style="height: 33%">
                <td>3. <br />
                    <img class="RecoverSnippet" id="Recover3" src="../images/Recover2.bmp" title="Copy No 3. Snippet comments to edit box" /></td>
                <td>
                    <asp:TextBox ID="TextSnippet3" runat="server" CssClass="TextSnippet"  TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="User Comments Snippet 1"></asp:TextBox>
                </td>
                <td>
                    <img id="Save3" class="SaveSnippet" src="../images/save.png" title="Save your No 3. Snippet comments to Snippet Library" /></td>
            </tr>

        </table>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfDomainID" runat="server" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserRole" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfTextChangeTitle" runat="server" />
            <asp:HiddenField ID="hfTextChangeHelp" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<script type="text/javascript">
    var IE = document.all ? true : false
    document.onmousemove = getMousepoints;
    var mousex = 0;
    var mousey = 0;
    function getMousepoints() {
        mousex = event.clientX + document.body.scrollLeft;
        mousey = event.clientY + document.body.scrollTop;
        return true;
    }
</script>
<script type="text/javascript">
    var BasePara = {
        Operate: "Get",
        UserID: $("#hfUserID").val(),
        CategoryID: $("#hfCategory").val(),
        AreaID: $("#hfArea").val(),
        ItemCode: $("#hfCode").val(),
        DomainID : $("#hfDomainID").val(),
        CompetencyID : $("#hfCompetencyID").val(),
        RowNo: 0,
        Comments: ""
    };

    var myKey;
    var currentTR;
    var currentTab;
    function pageLoad(sender, args) { }


    $(document).ready(function () {
        LoadingSnippetContent();



        $(".SaveSnippet").click(function (e) {
            var id = e.originalEvent.srcElement.id.replace("Save", "");  
            
            BasePara.Operate = "Save";
            BasePara.RowNo =  id;
            BasePara.Comments = $("#TextSnippet" + id).val();
            var titletext = EPA2.Models.WebService1.SaveUserSnippet("Save", BasePara, onSuccess, onFailure);
            return false;
        });
        $(".RecoverSnippet").click(function (e) {
            var id = e.originalEvent.srcElement.id.replace("Recover", "");
       
            var value = $("#TextSnippet" + id).val();
            CopySnippetToEditBox(value);
        })
        $(".TextSnippet").click(function (e) {
            var id = e.originalEvent.srcElement.id; //.replace("TextSnippet", ""); ;
            var value = $("#" + id).val();
            CopySnippetToEditBox(value);
        })

    });

    function CopySnippetToEditBox(value) {
        var workingCell = $("#hfWorkingCell", parent.document).val();
        if (workingCell == undefined) { workingCell = "myText"; }
        $("#" + workingCell, parent.document).val(value);

    }

    function IECompatibility() {
        var agentStr = navigator.userAgent;
        this.IsIE = false;
        this.IsOn = undefined;  //defined only if IE
        this.Version = undefined;
        this.Compatible = undefined;

        if (agentStr.indexOf("compatible") > -1) {
            this.IsIE = true;
            this.IsOn = true;
            this.Compatible = true;
        }
        else {
            this.Compatible = false;
        }

    }

    function LoadingSnippetContent() {
        var text1 = EPA2.Models.WebService1.GetUserSnippet(1, BasePara, onSuccess1, onFailure);
        var text2 = EPA2.Models.WebService1.GetUserSnippet(2, BasePara, onSuccess2, onFailure);
        var text3 = EPA2.Models.WebService1.GetUserSnippet(3, BasePara, onSuccess3, onFailure);
    }
    function onSuccess(result) {
        alert("Data Save Successfully! ");

    }
    function onFailure() {
    }

    function onSuccess1(result) {
        $("#TextSnippet1").val(result);
    }

    function onSuccess2(result) {
        $("#TextSnippet2").val(result);
    }
    function onSuccess3(result) {
        $("#TextSnippet3").val(result);
    }


</script>
