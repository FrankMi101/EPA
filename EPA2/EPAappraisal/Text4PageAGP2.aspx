<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Text4PageAGP2.aspx.cs" Inherits="EPA2.EPAappraisal.Text4PageAGP2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        body {
            width: 99.9%;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .ContentSubTitle, .ContentMessage {
            display: none;
        }


        .WorkingItem {
            color: blue !important;
            font-weight: 600;
            height: 25px;
        }

        .ContentTitleLeft {
            float: left;
            display: block;
            width: 100%;
        }

        #GridView1 textarea {
            height: 200px;
            width: 100%;
            border: 0px solid #0094ff;
            margin: 0px;
            padding: 2px;
        }

        #btnViewAGP {
            background-color: lightcyan;
            border: 2px outset, #0094ff;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">

        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft" class="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>

                </div>

            </div>

            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%; height: 650px;">
                    <div style="overflow: hidden;" id="DivHeaderRow">
                        <table id="GridView2" style="border: 1px ridge gray; width: 99%; height: 30px; background-color: white;" rules="all" cellspacing="0" cellpadding="0">
                        </table>
                    </div>

                    <div style="overflow: scroll; width: 99.5%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="0" Height="100%" Width="99%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="0" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:BoundField DataField="SequenceNo" HeaderText="No." ItemStyle-CssClass="SequenceNo">
                                    <ItemStyle Width="1%" />
                                </asp:BoundField>


                                <asp:TemplateField HeaderText="Areas for Growth">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextAreaForGrowth" runat="server" Text='<%# Eval("AreaForGrowth") %>' CssClass="AreaForGrowth, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Growth Strategies/Supports">
                                    <ItemStyle Width="44%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextGrowthStrategy" runat="server" Text='<%# Eval("GrowthStrategy") %>' CssClass="GrowthStrategy, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Target Dates for Completion">
                                    <ItemStyle Width="15%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextTimeLine" runat="server" Text='<%# Eval("TimeLine") %>' CssClass="TimeLine, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Suggested Annual Growth Plan for Next Year">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editTextFutureGrowth" runat="server" Text='<%# Eval("FutureGrowth") %>' CssClass="FutureGrowth, textAreaEdit" Width="100%" TextMode="MultiLine">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>

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



        </section>

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

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
     
    $(document).ready(function () {
        MakeStaticHeader("GridView1", 650, 900, 40, false);
        var vHeight = screen.height - 150 - 110 - 70;
        $("section").css("height", vHeight)

        DisableTextEdit();


    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }

</script>
