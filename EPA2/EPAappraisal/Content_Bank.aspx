<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_Bank.aspx.cs" Inherits="EPA2.EPAappraisal.ContentBank" %>

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
                    <asp:Button ID="btnBoard" runat="server" Text="Board Comments" CssClass="BottonTab" OnClick="BtnBoard_Click" />
                    <asp:Button ID="btnSchool" runat="server" Text="School Comments" CssClass="BottonTab" OnClick="BtnSchool_Click" />
                    <asp:Button ID="btnPersonal" runat="server" Text="Personal Comments" CssClass="BottonTab" OnClick="BtnPersonal_Click" />
                    <asp:Label runat="server" Font-Size="X-Small" ForeColor="Red" ID="remaind22" Text="*Click on the comments to add selected comments. "> </asp:Label>
                    <asp:HiddenField ID="hfSelectedTab" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

          <div  style ="height:100%; overflow: auto;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>


                    <div id="DivRoot" style="width: 100%;">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;"  >
                            </table>
                        </div>

                        <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1"
                                EmptyDataText="No History Data" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>

                                  <%--  <asp:TemplateField HeaderText="Add" ItemStyle-CssClass="myAction">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("Action") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="40px" Wrap="False" />
                                    </asp:TemplateField>--%>

                                    <asp:BoundField DataField="Shared" HeaderText="Shared">
                                        <ItemStyle Width="20%" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Comments" HeaderText="Comments" ItemStyle-CssClass="myComment">
                                        <ItemStyle Width="75%" />
                                    </asp:BoundField>
                                </Columns>

                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <HeaderStyle BackColor="cornflowerblue" ForeColor="white" Height="25px" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />

                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#33276A" />
                            </asp:GridView>
                        </div>
                    </div>

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
            MakeStaticHeader("GridView1", 360, 600, 22, false);
            // $("#btnBoard").addClass("selectedTab");
            //currentTab = $("#btnBoard");
            $(".BottonTab").click(function (event) {
                currentTab = $("#hfSelectedTab").val();
                if (currentTab != undefined)
                { $("#" + $("#hfSelectedTab").val()).removeClass("selectedTab"); }
                $("#hfSelectedTab").val($(this).id);
                $(this).addClass("selectedTab");
            });
            $('td.myComment').click(function (event) {
                rowNo = $(this).closest('tr').find('td.myRowNo').text();

                var selectedComment =  $(this).closest('tr').find('td.myComment').text();
                $("#hfContentChange", parent.document).val("1");

              //  var workingText = $("#myText", parent.document).val();
              //  $("#myText", parent.document).val(workingText + "\n\r" + selectedComment);
             //   $("#hfContentChange", parent.document).val("1");

                var workingCell = $("#hfWorkingCell", parent.document).val();
                if (workingCell == undefined)
                { workingCell = "myText"; }
                var workingText = $("#" + workingCell, parent.document).val();
                $("#" + workingCell, parent.document).val(workingText + "\n\r" + selectedComment);




            });

            $('#GridView1 tr').mouseenter(function (event) {
                newRowNo = $(this).closest('tr').find('td.myRowNo').text();
                if (currentTR != undefined)
                { currentTR.removeClass("highlightBoard"); }
                currentTR = $(this);
                currentTR.addClass("highlightBoard");
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
