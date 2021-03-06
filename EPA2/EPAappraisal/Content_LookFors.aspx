﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_LookFors.aspx.cs" Inherits="EPA2.EPAappraisal.ContentLookFors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
    <link href="../Content/ListPage.css" rel="stylesheet" />

    <style type="text/css">
        body {
            height: 99%;
            width: 99%;
            margin:auto;
        }

        div {
            font-family: Arial;
            font-size: small;
        }


        .DataContentTile {
            font-family: Arial;
            font-size: small;
            font-weight: 300;
            color: blue;
            table-layout: auto;
            display: block;
            height: 99%;
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

      
        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey {
            display: none;
            width: 0px;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <div>
     
                    <asp:Label ID="Label3" runat="server" Text="School Year: "></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
               <asp:Label runat="server" Font-Size= "X-Small"  ForeColor="Red" ID="remaind22" Text="* Click on the Add button to add selected look fors to Evidence log. "> </asp:Label>

        </div>

        <div>
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>      </ContentTemplate>
            </asp:UpdatePanel>--%>
                    <div id="DivRoot" style="width: 100%;">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                            </table>
                        </div>

                        <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" 
                                EmptyDataText="No Look Fors Data" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("Action") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="40px" Wrap="False" />
                                    </asp:TemplateField>
                                  
                                    <asp:BoundField DataField="ActionDate" HeaderText="Date" Visible="false">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                     
                                    <asp:BoundField DataField="LookForsName" HeaderText="Look Fors"  ItemStyle-CssClass="myComment">
                                        <ItemStyle Width="90%" />
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
    function pageLoad(sender, args) {

        $(document).ready(function () {
            MakeStaticHeader("GridView1",350, 600, 25, false);

            $('td.myAction').click(function (event) {
                rowNo = $(this).closest('tr').find('td.myRowNo').text();
                var selectLookFor = $(this).closest('tr').find('td.myComment').text();
                var workingText = $("#myText", parent.document).val();
                var newValue = workingText + "\n" + selectLookFor;
                $("#myText",  parent.document).val(newValue);
                $("#hfContentChange",  parent.document).val("1");
 
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
