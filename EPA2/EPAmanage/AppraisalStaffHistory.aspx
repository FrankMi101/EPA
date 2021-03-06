﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppraisalStaffHistory.aspx.cs" Inherits="EPA2.EPAmanage.AppraisalStaffHistory" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Position Publsh List</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
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



        .defaultBoard {
            border: 1px blue none;
        }

        #ActionMenuDIV {
            border: 2px lightblue ridge;
            height: 150px;
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

        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey, .hfIDs {
            display: none;
            width: 0px;
        }

        img {
            border-color: yellow;
        }

        .label1 {
            font-family: Arial;
            font-size: 13px;
        }

        .imgHelp {
            width: 23px;
            height: 23px;
            margin-bottom: 1px;
        }
          #SearchBar {
            position: absolute;
            top: 3px;
            left: 1000px;
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
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    Appraisee Name: 
                    <asp:Label ID="LabelName" runat="server" Text="" Font-Bold="true" ForeColor="Purple" Font-Underline="true"></asp:Label>
                    Current Appraisal Phase:
                    <asp:Label ID="LabelPhase" runat="server" Text="" Font-Bold="true" ForeColor="Purple" Font-Underline="true"></asp:Label>
                    Current Administrator:
                     <asp:Label ID="LabelAdmin" runat="server" Text="" Font-Bold="true" ForeColor="Purple" Font-Underline="true"></asp:Label>

                    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="BtnSearch_Click" CssClass="Gobutton" />

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
                    <div id="DivRoot" style="width: 100%; height: 100%;">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                            </table>
                        </div>

                        <div id="DivMainContent" style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="1%" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("Action") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ALP" ItemStyle-CssClass="myALP">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link2" runat="server" Text='<%# Bind("ALP") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EPA" ItemStyle-CssClass="myEPA">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link3" runat="server" Text='<%# Bind("EPA") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="School Year" ItemStyle-CssClass="myYear">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link4" runat="server" Text='<%# Bind("AppraisalYear") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="5%" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" ItemStyle-CssClass="myType">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("AppraisalType") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" />
                                    </asp:TemplateField>
                                  
                                    <asp:BoundField DataField="AppraisalStatus" HeaderText="Status">
                                        <ItemStyle Width="3%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date">
                                        <ItemStyle Width="4%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EndDate" HeaderText="End Date">
                                        <ItemStyle Width="4%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalPhase" HeaderText="Appraisal Phase">
                                        <ItemStyle Width="10%" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Assignment" HeaderText="Assignment">
                                        <ItemStyle Width="9%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalSchool" HeaderText="School">
                                        <ItemStyle Width="12%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Appraiser" HeaderText="Appraiser" ItemStyle-CssClass="myAppraiser">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mentor" HeaderText="Mentor" ItemStyle-CssClass="myMentor">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Outcome">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("AppraisalOutcome") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Appraisal 1">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link6" runat="server" Text='<%# Bind("Appraisal1") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 2">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link7" runat="server" Text='<%# Bind("Appraisal2") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Appraisal 3">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link8" runat="server" Text='<%# Bind("Appraisal3") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 4">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link9" runat="server" Text='<%# Bind("Appraisal4") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Comments" HeaderText="Comments">
                                        <ItemStyle Width="7%" />
                                    </asp:BoundField>
                                   <%-- <asp:BoundField DataField="IDs" ReadOnly="True" ItemStyle-CssClass="hfIDs" />--%>
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

        <div id="ActionMenuDIV" class="bubble epahide">
            <asp:Label runat="server" ID="LabelTeacherName" Text=""> </asp:Label>
            <ul>
                <li id ="submenu1" ><a class="menuLink" href="javascript:openEditPage3('500','700','./EPAmanage/Loading2.aspx?pID=Notes','Write Appraisal Notes');">Write Appraisal Notes </a></li>
                <li id ="submenu2" ><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=ALP99','Print Annual Learning Plan');">Print Annual Learning Plan </a></li>
                <li id ="submenu3" ><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=SUM99','Print Summative Report');">Print Summative Report </a></li>
                <li id ="submenu4" ><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=STR99','Print Strategy Report');">Print Strategy Report </a></li>
                <li id ="submenu5" ><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=EvidenceLog','Print Evidenc Log');">Print Evidenc Log </a></li>
                <li id="forAdminAction"  ><a class="menuLink" href="javascript:openEditPage3('470','650','./EPAmanage/Loading2.aspx?pID=AppraisalProfile','Edit Appraisal Profile');">Edit Appraisal Profile </a></li>
            </ul>
        </div>
        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" frameborder="0" scrolling="no" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
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
    var AreaID = "HistryList";
    var ItemCode = "Appraisal";

    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var sessionid;
    var phase;
    var category;
    var myKey;
 //   var currentTR;
    currentListPage = "History";
    $(document).ready(function () {
        var vHeight = window.innerHeight - 70;
        if ($("#hfUserLoginRole").val() == "Teacher")
            $("#forAdminAction").hide();
        else
            $("#forAdminAction").show();

        MakeStaticHeader("GridView1", vHeight, 1300, 20, false);

        $("#GridView1 tr").mouseenter(function (event) {
            if (currentTR != undefined) { currentTR.removeClass("highlightRow"); }
            currentTR = $(this);
            //  $(this).addClass("highlightBoard");
            currentTR.addClass("highlightRow");
        });

    });
</script>

