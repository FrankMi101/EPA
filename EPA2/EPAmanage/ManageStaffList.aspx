<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStaffList.aspx.cs" Inherits="EPA2.EPAmanage.ManageStaffList" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Perforamnace Appraisal Staff List</title>
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />

    <style type="text/css">
        body {
            height: 99.5%;
            width: 99.5%;
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

        #ActionMenuDIV {
            border: 2px lightblue ridge;
            height: 150px;
            width: 200px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }
          #ActionMenuDIV li {
             height:25px;
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
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    
                    <asp:Label ID="Label2" runat="server" Text="School"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolCode_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSchool" runat="server" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Searchby" runat="server" Text="Search by"></asp:Label>


                    <asp:DropDownList ID="ddlSearchby" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
                        <asp:ListItem Value="Teacher" Selected="True"> Teacher</asp:ListItem>
                        <asp:ListItem Value="Status">Employee Status</asp:ListItem>
                        <asp:ListItem Value="Position">Employee Position</asp:ListItem>    
                    </asp:DropDownList>

                    <asp:TextBox ID="TextSearch" runat="server" Width="150px" placeholder="Search by Surname"></asp:TextBox>

                    <asp:DropDownList ID="ddlSearch" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
                    <a style ="margin-left:50px" visible="false" id="linkAddNew" runat="server" href ="javascript:OpenStaffEdit();">Add New Staff</a>
                    <div id="Div1" runat="server" style="display: inline;">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <img src="../images/indicator.gif" alt="" />
                                <b>Searching.....</b>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="DivRoot" style="width: 100%; height:99.5%;">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                            </table>
                        </div>

                        <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("Action") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="40px"  />
                                    </asp:TemplateField>      

                                    <asp:BoundField DataField="FirstName" HeaderText="First Name">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="LastName" HeaderText="Last Name">
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                     <asp:BoundField DataField="Gender" HeaderText="Gender">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EmployeeStatus" HeaderText="Status">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="EmployeePosition" HeaderText="Position">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Assignment" HeaderText="Assignment" ItemStyle-CssClass="Assignment">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="email" ItemStyle-CssClass="email">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    
                                     <asp:BoundField DataField="TimeType" HeaderText="F/P">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                       <asp:BoundField DataField="StartDate" HeaderText="Start Date">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                             
                                       <asp:BoundField DataField="EndDate" HeaderText="End Date">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                     
                                       <asp:BoundField DataField="Comments" HeaderText="Comments">
                                        <ItemStyle Width="15%" />
                                    </asp:BoundField>
                                    
                                       <asp:BoundField DataField="School" HeaderText="School">
                                        <ItemStyle Width="15%" />
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
        <div style="color: Red; font-size: x-small; height: 20%">
            <asp:Label runat="server" ID="remaind22" Text="* Click on the Apply button to see interview candidate list "> </asp:Label>
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
<script src="../Scripts/Appr_ListPage.js"></script>
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
    $(document).ready(function () {
        try {

            MakeStaticHeader("GridView1", 650, 1300, 25, false);
        }
        catch (ex )
        {

        }
        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });


        $(".labelTitle").dblclick(function (event) {
            EditPageItemTitle();
        });

    });
</script>

