<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_Strategy.aspx.cs" Inherits="EPA2.EPAappraisal.ContentStrategy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Content/ContentPage_tab.css" rel="stylesheet" />

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
            margin-top: 0px;
        }

       
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
        </asp:ScriptManager>

        <div style="margin-bottom: -1px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnBoard" runat="server" Text="All Panel" CssClass="BottonTab" OnClick="BtnBoard_Click" />
                    <asp:Button ID="btnSchool" runat="server" Text="Elementary" CssClass="BottonTab" OnClick="BtnSchool_Click" />
                    <asp:Button ID="btnPersonal" runat="server" Text="Secondary" CssClass="BottonTab" OnClick="BtnPersonal_Click" />
                    <asp:Label runat="server" Font-Size="X-Small" ForeColor="Red" ID="remaind22" Text="*Click on the button to add selected comments. "> </asp:Label>
                    <asp:HiddenField ID="hfSelectedTab" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <div style="height: 370px; overflow: auto;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:TreeView ID="TreeView1" runat="server" Width="1500px" ImageSet="Simple" ShowLines="True">
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
            // MakeStaticHeader("GridView1", 340, 600, 25, false);
            // $("#btnBoard").addClass("selectedTab");
            //currentTab = $("#btnBoard");
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
                        //  window.alert(selectNodeT);
                       // var workingText =  $("#myText", parent.document).val();
                      //  $("#myText", parent.document).val(workingText + "\n\r" + selectNodeT);
                      //  $("#hfContentChange", parent.document).val("1");

 

                        var workingCell = $("#hfWorkingCell", parent.document).val();
                        if (workingCell == undefined)
                        { workingCell = "myText"; }

                        var workingText = $("#" + workingCell, parent.document).val();
                        $("#" + workingCell, parent.document).val(workingText + "\n\r" + selectNodeT);
                        $("#hfContentChange", parent.document).val("1");

 

                    }
                }
                catch (ex)
                { }

            });

        });
        //$(document).ready(function () {
        //    $("#" + $("#hfSelectedTab").val()).addClass("selectedTab");
        //    MakeStaticHeader("GridView1", 340, 600, 25, false);
        //    // $("#btnBoard").addClass("selectedTab");
        //    //currentTab = $("#btnBoard");
        //    $(".BottonTab").click(function (event) {
        //        currentTab = $("#hfSelectedTab").val();
        //        if (currentTab != undefined)
        //        { $("#" + $("#hfSelectedTab").val()).removeClass("selectedTab"); }
        //        $("#hfSelectedTab").val($(this).id);
        //        $(this).addClass("selectedTab");
        //    });
        //    $('td.myAction').click(function (event) {
        //        rowNo = $(this).closest('tr').find('td.myRowNo').text();

        //        var recoveryComment = $(this).closest('tr').find('td.myComment').text();
        //        var workingText = $("#myText", parent.document).val();

        //        $("#myText", parent.document).val(workingText + "\n\r" + recoveryComment);
        //        $("#hfContentChange", parent.document).val("1");

        //    });

        //    $('#GridView1 tr').mouseenter(function (event) {
        //        newRowNo = $(this).closest('tr').find('td.myRowNo').text();
        //        if (currentTR != undefined)
        //        { currentTR.removeClass("highlightBoard"); }
        //        currentTR = $(this);
        //        currentTR.addClass("highlightBoard");
        //    });
        //});

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
