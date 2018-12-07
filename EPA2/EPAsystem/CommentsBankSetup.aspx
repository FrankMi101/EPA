<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentsBankSetup.aspx.cs" Inherits="EPA2.EPAsystem.CommentsBankSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPageSetup.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        body {
            width: 1290px;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelTitleX {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1em;
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
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService.asmx" />
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />
            </Services>

        </asp:ScriptManager>

        <header style="display: none">
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft" class="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />

                </div>

            </div>

            <div class="ContentTitleLeft" style="display: block; text-align: center">
 
            </div>

            <br />
            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%; height: 600px;">
                    <div style="overflow: hidden;" id="DivHeaderRow">
                        <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                        </table>
                    </div>

                    <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                            <Columns>

                                <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="listRowNo">
                                    <ItemStyle Width="5%" HorizontalAlign="center" />
                                </asp:BoundField>


                                <asp:TemplateField HeaderText="Domain">
                                    <ItemStyle Width="15%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editCode" runat="server" Text='<%# Eval("DomainName") %>' CssClass="myDomainBank" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shared">
                                    <ItemStyle Width="15%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editText" runat="server" Text='<%# Eval("Shared") %>' CssClass="myShared" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemStyle Width="60%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editComments" runat="server" Text='<%# Eval("Comments") %>' CssClass="myComment" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active" ItemStyle-CssClass="myActive">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelect" Checked='<%# Convert.ToBoolean(Eval("Active"))%>' runat="server" CssClass="myCheck" Height="100%"></asp:CheckBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Wrap="False" HorizontalAlign="center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Save">
                                    <ItemTemplate>
                                        <asp:Label ID="saveAction" runat="server" Text='<%# Bind("ActionS") %>' Height="100%" CssClass="mySave"> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Wrap="False" HorizontalAlign="center" VerticalAlign="middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                    <ItemTemplate>
                                        <asp:Label ID="Action" runat="server" Text='<%# Bind("Action") %>' Height="100%" CssClass="myAction"> </asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Wrap="False" HorizontalAlign="center" VerticalAlign="middle" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="IDs" HeaderText="" ItemStyle-CssClass="listIDs">
                                    <ItemStyle Width="0px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DomainID" HeaderText="" ItemStyle-CssClass="myDomainID">
                                    <ItemStyle Width="0px" />
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
          


        </section>


        <footer>
             <asp:Button ID="btnAddNew" runat="server" Text="Add New Comments" OnClick="btnAddNew_Click" />
 <%--<asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />--%>

        </footer>

        <div id="DDLDIV" class="bubble epahide">
            <asp:DropDownList ID="ddlDomain" runat="server" Height="25px"></asp:DropDownList>
            <asp:DropDownList ID="ddlShared" runat="server" Height="25px"></asp:DropDownList>

        </div>
        <div id="HelpDIV" class="bubble epahide">
            <div id="textHelp"></div>
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
        <div id="TextEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextCommentsEdit" runat="server" Width="99%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
        </div>
        <div>
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfBankType" runat="server" />
            <asp:HiddenField ID="hfBankOwner" runat="server" />


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
    var bankType = $("#hfBankType").val();
    var bankOwner = $("#hfBankOwner").val();
    var currentTR;
    var workingCell;
    var eventCell;
    var schoolyear = $("#hfSchoolYear").val();
    $(document).ready(function () {
        MakeStaticHeader("GridView1", 650, 1250, 25, false);
        var vHeight = screen.height - 150 - 110 - 70;
        $("section").css("height", vHeight)


        $("#GridView1 tr").change(function () {
            $("#hfContentChange").val("1");
        })
        $('td > .mySave').click(function (event) {
            try {
                if ($("#hfContentChange").val() == "1") {
                    eventCell = $(this);

                    var IDs = $(this).closest('tr').find('td.listIDs').text();
                    var domainID = $(this).closest('tr').find('td.myDomainID').text();
                    var shared = $(this).closest('tr').find('td > .myShared').val();
                    var comm = $(this).closest('tr').find('td > .myComment').val();
                    var check = $(this).closest('tr').find('td > .myCheck');
                    var active = (check[0].childNodes['0'].checked ? "1" : "0");
                    var result = EPA2.Models.WebService.SaveCommentsBank("Update", UserID, CategoryID, AreaID,bankType,bankOwner, IDs, domainID, shared, comm, active, onSuccessUpdate, onFailureUpdate);
                    $("#hfContentChange").val("0");
                }
            }
            catch (ex)
            { }

        });

        $('td > .myDomainBank').click(function (event) {
            //    IDs = $(this).closest('tr').find('td .listIDs').text();
            eventCell = $(this);
            workingCell = $(this).closest('tr').find('td.myDomainID');
            $("#ddlDomain").show();
            $("#ddlShared").hide();  
            openDDL(event);
        });
        $('td > .myShared').click(function (event) {
            //    IDs = $(this).closest('tr').find('td .listIDs').text();
            eventCell = $(this);
             $("#ddlDomain").hide();
            $("#ddlShared").show();
            openDDL(event);
        });


        $("#ddlDomain").change(function (event) {
            var selValue = event.target.value;
            var seltext =  $('#ddlDomain :selected').text(); 
            eventCell.val(seltext);
            workingCell.text(selValue);
            $("#hfContentChange").val("1");
            $("#DDLDIV").fadeToggle("fast");
        });
        $("#ddlShared").change(function (event) {
            var selValue = event.target.value;
            var seltext = $('#ddlShared :selected').text();
            eventCell.val(selValue);
            $("#hfContentChange").val("1");
            $("#DDLDIV").fadeToggle("fast");
        });
        function openDDL(event) {
            var vTop = event.currentTarget.parentNode.offsetTop + 43;
            var vLeft = event.currentTarget.parentNode.offsetLeft;

            $("#DDLDIV").css({
                top: vTop,
                left: vLeft,
                height: 26,
                width: 200
            })

            $("#DDLDIV").fadeToggle("fast");
        }



        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
        $(".labelTitle").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });
        $(".labelTitleX").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });

        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });

    });

    function DeleteRecord(IDs, owner, domainID) {
        var result = confirm("Do you want to delete this row?");
        if (result) {
            var result = EPA2.Models.WebService.SaveCommentsBank("Delete", UserID, CategoryID, AreaID, bankType, owner, IDs, domainID, "", "", "0", onSuccessDel, onFailureDel);
        }
        else {

        }
    }
    function DisableTextEdit() {

    }
    function onSuccessUpdate(result) {
        alert("Data Update " + result);
    }
    function onFailureUpdate(result) {
        alert("Data Update " + result);
    }
    function onSuccessDel(result) {
        alert("Delete Record " + result);
        location.reload(true);
    }
    function onFailureDel(result) {
        alert("Data Update " + result);
    }
</script>
