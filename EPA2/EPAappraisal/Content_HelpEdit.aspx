<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_HelpEdit.aspx.cs" Inherits="EPA2.EPAappraisal.ContentHelpEdit" %>

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

        <asp:TextBox ID="TextTitleEdit" runat="server" Width="99%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
        <asp:TextBox ID="TextSubTitleEdit" runat="server" Width="99%" Height="70px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Sub Title"></asp:TextBox>
        <div style=" height:20px; margin-top:10px; margin-bottom:-10px">
            <asp:Label ID="lblHelp" runat="server" CssClass="BottonTab">Edit Help Content </asp:Label>
            <asp:Label ID="lblMessage" runat="server"  CssClass="BottonTab"> Message Content  </asp:Label>
            <asp:Label ID="lblEP" runat="server"   CssClass="BottonTab">Effective Practice</asp:Label>
            <span style="text-align: right; float: right; margin-top:-6px;">
                <asp:Button ID="ButtonSave" runat="server" Text="Save" Height="22px" />
            </span>

        </div>
        <asp:HiddenField ID="hfSelectedTab" runat="server" />
        <asp:TextBox ID="TextHelpEditL" runat="server" Width="99%" Height="320px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Help Content"></asp:TextBox>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
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
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var myKey;
    var currentTR;
    var currentTab;
    function pageLoad(sender, args) { }


    $(document).ready(function () {
        $("#lbl" + $("#hfSelectedTab").val()).addClass("selectedTab");
        LoadingHelpAndTitleContent();

        $(".BottonTab").click(function (event) {
            currentTab = $("#hfSelectedTab").val();
            if (currentTab != undefined)
            { $("#lbl" + currentTab).removeClass("selectedTab"); }
            cTab = $(this)[0].id;
            $("#hfSelectedTab").val(cTab.replace("lbl", ""));
            $(this).addClass("selectedTab");
            LoadingContent();
        });


        $("#ButtonSave").click(function (event) {
            var helpType = $("#hfSelectedTab").val();
            if ($("#hfTextChangeTitle").val() == "1") {
                var title = $("#TextTitleEdit").val();
                var subTitle = $("#TextSubTitleEdit").val();
                var titletext = EPA2.Models.WebService1.SaveTitleContent("Save", UserID, CategoryID, AreaID, ItemCode, title, subTitle, onSuccess4, onFailure);
            }
            if ($("#hfTextChangeHelp").val() == "1") {
                var value = $("#TextHelpEditL").val();
                if (helpType == "Message") {
                    if (ItemCode == "Message") {
                        var userRole = $("#hfUserRole").val();
                        var helptext = EPA2.Models.WebService1.SaveMessageContent2("Read", UserID, CategoryID, AreaID, ItemCode, userRole, value, onSuccess4, onFailure);
                    }
                    else {
                        var helptext = EPA2.Models.WebService1.SaveMessageContent("Save", UserID, CategoryID, AreaID, ItemCode, value, onSuccess4, onFailure);
                    }
                }
                else {
                    var helptext = EPA2.Models.WebService1.SaveHelpContent("Save", UserID, CategoryID, AreaID, ItemCode, helpType, value, onSuccess4, onFailure);
                }
            }
            alert("Data Save Successfully! ");
            return false;
        });

        $("#TextTitleEdit").change(function (event) {
            $("#hfTextChangeTitle").val(1);
        });
        $("#TextSubTitleEdit").change(function (event) {
            $("#hfTextChangeTitle").val(1);
        });
        $("#TextHelpEditL").change(function (event) {
            $("#hfTextChangeHelp").val(1);
        });
    });



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

    function LoadingHelpAndTitleContent() {
        var helptext = EPA2.Models.WebService1.GetHelpContent("Read", UserID, CategoryID, AreaID, ItemCode, "Help", onSuccess21, onFailure);
        var title1 = EPA2.Models.WebService1.GetTitleContent("Title", UserID, CategoryID, AreaID, ItemCode, onSuccess22, onFailure);
        var title2 = EPA2.Models.WebService1.GetTitleContent("Subtitle", UserID, CategoryID, AreaID, ItemCode, onSuccess23, onFailure);
    }
    function LoadingContent() {
        var vType = $("#hfSelectedTab").val();
        if (vType == "Message") {
            if (ItemCode == "Message")
            {
                var userRole = $("#hfUserRole").val();
                var helptext = EPA2.Models.WebService1.GetMessageContent2("Read", UserID, CategoryID, AreaID, ItemCode, userRole, onSuccess21, onFailure);
            }
            else
                {
            var helptext = EPA2.Models.WebService1.GetMessageContent("Read", UserID, CategoryID, AreaID, ItemCode, onSuccess21, onFailure);
        }}
        else {
            var helptext = EPA2.Models.WebService1.GetHelpContent("Read", UserID, CategoryID, AreaID, ItemCode, vType, onSuccess21, onFailure);

        }
    }
    function onFailure() {
    }
    function onSuccess4(result) {
    }
    function onSuccess21(result) {
        $("#TextHelpEditL").val(result);
    }

    function onSuccess22(result) {
        $("#TextTitleEdit").val(result);
    }
    function onSuccess23(result) {
        $("#TextSubTitleEdit").val(result);
    }


</script>
