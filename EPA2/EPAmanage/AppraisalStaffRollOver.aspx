<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppraisalStaffRollOver.aspx.cs" Inherits="EPA2.EPAmanage.AppraisalStaffRollOver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Perforamnace Appraisal Staff List</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />


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
            height: 80px;
            width: 210px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

            #ActionMenuDIV li {
                height: 25px;
            }

        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey {
            display: none;
            width: 0px;
        }

        img {
            border-color: yellow;
        }

        .imgHelp {
            width: 23px;
            height: 23px;
            margin-top: -1px;
        }



        .btnGo {
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>
        </asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    Staff Rollover For:
                    <asp:Label ID="Label2" runat="server" Text="School"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolCode_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSchool" runat="server" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" class="GoButton" />

                    <br />
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <asp:Label ID="Label3" runat="server" Text="From School Year: "></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Label1" runat="server" Text="To School Year: "></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYearTo" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="btnRollOver" runat="server" Text="Rollover" Width="100px" class="GoButton" OnClick="btnRollOver_Click" />

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
                    <div id="DivRoot" style="width: 100%; height: 99.5%;">
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
                                        <ItemStyle Width="40px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ALP" ItemStyle-CssClass="myALP">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link2" runat="server" Text='<%# Bind("ALP") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="30px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EPA" ItemStyle-CssClass="myEPA">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link3" runat="server" Text='<%# Bind("EPA") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="30px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Teacher Name" ItemStyle-CssClass="myName">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link4" runat="server" Text='<%# Bind("TeacherNameL") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="AppraisalType" HeaderText="Type">
                                        <ItemStyle Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalStatus" HeaderText="Status">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalPhaseP" HeaderText="Previous Phase">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalPhase" HeaderText="Appraisal Phase">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalPhaseN" HeaderText="Next Phase">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Assignment" HeaderText="Assignment">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Appraiser" HeaderText="Apprailser" ItemStyle-CssClass="myApprailser">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mentor" HeaderText="Mentor" ItemStyle-CssClass="myMentor">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Appraisal Outcome">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("Appraisaloutcome") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CurrentSession" HeaderText="cSession">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalProcess" HeaderText="process">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Appraisal 1">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link6" runat="server" Text='<%# Bind("Appraisal1") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 2">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link7" runat="server" Text='<%# Bind("Appraisal2") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Appraisal 3">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link8" runat="server" Text='<%# Bind("Appraisal3") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 4">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link9" runat="server" Text='<%# Bind("Appraisal4") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                    <%-- <asp:BoundField DataField="Comments" HeaderText="Comments">
                                        <ItemStyle Width="15%" />
                                    </asp:BoundField>--%>

                                    <%--  <asp:BoundField DataField="School_Year" ReadOnly="True"  ItemStyle-CssClass="hfSchoolYear" />
                                    <asp:BoundField DataField="School_Code" ReadOnly="True"  ItemStyle-CssClass="hfSchoolCode" />
                                    <asp:BoundField DataField="Employee_ID" ReadOnly="True"  ItemStyle-CssClass="hfEmployeeID" />--%>
                                    <%--<asp:BoundField DataField="myKey" ReadOnly="True" ItemStyle-CssClass="hfmyKey" />--%>
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
        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" CssClass="HelpTextBox"></asp:TextBox>
            <%-- <div id="textHelp"></div>--%>
        </div>


        <div id="ActionMenuDIV" class="bubble epahide">
            <asp:Label runat="server" ID="LabelTeacherName" Text=""> </asp:Label>
            <ul>
                <li><a class="menuLink" href="javascript:openEditPage3('500','650','../EPAmanage/Loading2.aspx?pID=AppraisalProfile','Edit Appraisal Profile');">Edit Appraisal Profile </a></li>
                <li><a class="menuLink" href="javascript:openEditPage3('500','650','../EPAmanage/Loading2.aspx?pID=EditStaffProfile','Edit Employee Profile');">Edit Employee Profile </a></li>

            </ul>
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

<script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>

<script type="text/javascript">
    var UserID = $("#hfUserID").val();
    var CategoryID = "TPA";
    var AreaID = "RollOverList";
    var ItemCode = "RollOver";

    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var sessionid;
    var phase;
    var category;
    var myKey;
    var currentTR;
    $(document).ready(function () {
        MakeStaticHeader("GridView1", 650, 1300, 20, false);

        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});


        //$(".labelTitle").dblclick(function (event) {
        //    EditPageItemTitle();
        //});

    });

    function CallShowMessage(action, message) {
        window.alert(action + " " + message);
    }

</script>


