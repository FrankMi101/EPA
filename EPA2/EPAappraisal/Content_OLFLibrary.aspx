<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_OLFLibrary.aspx.cs" Inherits="EPA2.EPAappraisal.ContentOlfLibrary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
       <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Content/ContentPage_tab.css" rel="stylesheet" />

    <style type="text/css">
        body {
            height: 400px;
            width: 99%;
            margin: auto;
        }

       
        #TreeView1 td {
            text-align: left;
            float: left;
            display: inline;
            font-size: small;
        }

        #TreeView1 img {
            float: left;
            text-align: left;
            display: inline;
            margin-top: -3px;
        }

       
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <div style="margin-bottom: -1px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnK12" runat="server"  Text="K-12 School" CssClass="BottonTab" OnClick="BtnTab_Click" ToolTip="K-12 School Effectiveness Framework" />
                    <asp:Button ID="btnSchool" runat="server" Text="School-level" CssClass="BottonTab" OnClick="BtnTab_Click" ToolTip="School-level Leadership" />
                    <asp:Button ID="btnSystem" runat="server" Text="System-level" CssClass="BottonTab" OnClick="BtnTab_Click" ToolTip="System-level Leadership" />
                    <asp:Button ID="btnDistrict" runat="server" Text="District" CssClass="BottonTab" OnClick="BtnTab_Click"  ToolTip="District Effectiveness Framework" />
                    <asp:Button ID="btnPersonal" runat="server" Text="Personal" CssClass="BottonTab" OnClick="BtnTab_Click" ToolTop="Personal Leadership Resources" />
                    <asp:Label runat="server" Font-Size="X-Small" ForeColor="Red" ID="remaind22" Text="*Click on the button to add selected comments. "> </asp:Label>
                    <asp:HiddenField ID="hfSelectedTab" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <div style="float: left; width: 100%;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:TreeView ID="TreeView1" runat="server" Width="1800px" ImageSet="Simple" ShowLines="True">
                    </asp:TreeView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<%--<script type="text/javascript">
    var IE = document.all ? true : false
    document.onmousemove = getMousepoints;
    var mousex = 0;
    var mousey = 0;
    function getMousepoints() {
        mousex = event.clientX + document.body.scrollLeft;
        mousey = event.clientY + document.body.scrollTop;
        return true;
    }
</script>--%>
<script type="text/javascript">
    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var phase;
    var category;
    var myKey;
    var currentTR;
    var currentTab;
    function pageLoad(sender, args) {

        $(document).ready(function () {
            $("#" + $("#hfSelectedTab").val()).addClass("selectedTab");    
            $(".BottonTab").click(function (event) {
                currentTab = $("#hfSelectedTab").val();
                if (currentTab != undefined)
                { $("#" + $("#hfSelectedTab").val()).removeClass("selectedTab"); }
                $("#hfSelectedTab").val($(this).id);
                $(this).addClass("selectedTab");
            });

            $("a").click(function (event) {
                try {
                    var selectNode = $(this).val();
                    var selectNodeT = $(this).html();
                    if (selectNodeT.substr(1, 3) != "img") {
                        var workingCell = $("#hfWorkingCell", parent.document).val();
                        if (workingCell == undefined)
                            { workingCell = "myText"; }
                        var workingText = $("#" + workingCell, parent.document).val();
                        $("#" + workingCell, parent.document).val(workingText + "\n\r" + selectNodeT);
                        $("#hfContentChange", parent.document).val("1");
                        //  $("#" + workingCell, parent.document).triggerHandler("change");
                        //  $("textarea", parent.document).triggerHandler("change");
                        parent.updateTextCellAfterContentAction();
                    }
                }
                catch (e)
                { }

            });

        });

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

</script>
