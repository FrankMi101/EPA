<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolManagement.aspx.cs" Inherits="EPA2.EPAsystem.SchoolManagement" %>

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
            width: 1255px;
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

        .myDomain, .myCompetency, .myKey {
            display: none;
        }




        #GridView1 tr {
            height: 35px;
            vertical-align: middle;
        }

        .myCode, .myName, .myComment, .myCheck, .myAction, .mySupervisor, .myDistrict, .myOfficer, .myHeader, .myPanel {
            border: 0px;
            background-color: transparent;
        }
            /*#GridView2 tr th:first-child {
        display:none;
        }*/
            .myAction a {
                margin-top: -13px;
            }

        .myCheck {
            margin-top: 11px;
        }
        #DDLDIV {
        height:50px;
        width:200px;
        }
        
#PopUpDIV2 {
    z-index: 100;
    position: absolute;
    top: 1px;
    left: 1px;
    background: #56c0e9;
    opacity: 0.6;
    filter: alpha(opacity=60);
    height: 100%;
    width: 100%;
    margin:-2px;
}
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService.asmx" /> 
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
                <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>

            </div>

            <br />
            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%; height:580px;">
                    <div style="overflow: hidden;" id="DivHeaderRow">
                        <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                        </table>
                    </div>

                    <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" 
                            EmptyDataText="No School in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true"
                             >
                            <Columns>
                        <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="myAction">
                                    <ItemTemplate>
                                        <asp:Label ID="LinkEdit" runat="server" Text='<%# Bind("Edit") %>' Height="100%"> </asp:Label>
                                     </ItemTemplate>
                                    <ItemStyle Width="40px" Wrap="False" HorizontalAlign="center" VerticalAlign="middle" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="listRowNo">
                                    <ItemStyle Width="4%" HorizontalAlign="center" />
                                </asp:BoundField>


                                <asp:TemplateField HeaderText="Code">
                                    <ItemStyle Width="10%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editCode" runat="server" Text='<%# Eval("Code") %>' CssClass="myCode" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editText" runat="server" Text='<%# Eval("Name") %>' CssClass="myName" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Principal">
                                    <ItemStyle Width="12%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editHeader" runat="server" Text='<%# Eval("Header") %>' CssClass="myHeader" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <asp:TemplateField HeaderText="Panel">
                                    <ItemStyle Width="10%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editPanel" runat="server" Text='<%# Eval("Panel") %>' CssClass="myPanel" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="Supervisor">
                                    <ItemStyle Width="12%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editSupervisor" runat="server" Text='<%# Eval("Supervisor") %>' CssClass="mySupervisor" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District">
                                    <ItemStyle Width="12%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editDistrict" runat="server" Text='<%# Eval("District") %>' CssClass="myDistrict" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               

                                <asp:TemplateField HeaderText="Comments">
                                    <ItemStyle Width="20%" Wrap="True" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="editComments" runat="server" Text='<%# Eval("Comments") %>' CssClass="myComment" Width="100%" Height="100%">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active"  >
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelect" Checked='<%# Convert.ToBoolean(Eval("Active"))%>' runat="server" CssClass="myCheck" Height="100%"></asp:CheckBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Wrap="False" HorizontalAlign="center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="TPA"  >
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbTPA" Checked='<%# Convert.ToBoolean(Eval("TPA"))%>' runat="server" CssClass="myCheck" Height="100%"></asp:CheckBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="3%" Wrap="False" HorizontalAlign="center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="PPA"  >
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbPPA" Checked='<%# Convert.ToBoolean(Eval("PPA"))%>' runat="server" CssClass="myCheck" Height="100%"></asp:CheckBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="3%" Wrap="False" HorizontalAlign="center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                    <ItemTemplate>
                                        <asp:Label ID="Link1" runat="server" Text='<%# Bind("Action") %>' Height="100%"> </asp:Label>
<%--                                        <asp:HyperLink ID="Link12" runat="server" Text='<%# Bind("Action") %>' Height="100%">  </asp:HyperLink>--%>
                                    </ItemTemplate>
                                    <ItemStyle Width="40px" Wrap="False" HorizontalAlign="center" VerticalAlign="middle" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="" ItemStyle-CssClass="myKey"  >
                                    <ItemTemplate>
                                        <asp:Label ID="myKey" runat="server" Text='<%# Bind("IDs") %>' Height="100%" CssClass="listIDs"> </asp:Label>
                                     </ItemTemplate>
                                    <ItemStyle Width="0px" Wrap="False"  />
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
            <asp:Button ID="btnAddNew" runat="server" Text="Add New School of " OnClick="btnAddNew_Click" />
              <asp:DropDownList ID="ddlSchoolType" runat="server" Height="23px" AutoPostBack="true" OnSelectedIndexChanged="ddlSchoolType_SelectedIndexChanged"></asp:DropDownList>


        </section>


        <footer style="display:none; ">
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />

        </footer>


        <div id="HelpDIV" class="bubble epahide">
                      <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>

        </div>
        <div id="DDLDIV" class="bubble epahide">
            <asp:DropDownList ID="ddlDistrictList" runat="server" Height="25px"></asp:DropDownList>
            <asp:DropDownList ID="ddlSupervisor" runat="server" Height="25px"></asp:DropDownList>
            <asp:DropDownList ID="ddlPrincipal" runat="server" Height="25px"></asp:DropDownList>
        </div>
           <div id="PopUpDIV2" class="bubble epahide" ></div>

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


        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID;
    var CompetencyID;
    var currentTR;
    var eventCell;
    var WorkingCell;
    var IDs;
    $(document).ready(function () {
        MakeStaticHeader("GridView1", 550, 1250, 20, false);
        var vHeight = screen.height - 150-300;
        $("section").css("height", vHeight)

     
        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});
        //$(".labelTitle").dblclick(function (event) {
        //    ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
        //    EditPageItemTitle();
        //});
        //$(".labelTitleX").dblclick(function (event) {
        //    ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
        //    EditPageItemTitle();
        //});

        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });

    });

    function DeleteRecord(iDs, roleCode) {
        var result = confirm("Do you want to delete this row?");
        if (result) {
            var result = EPA2.Models.WebService.School("Delete", UserID, CategoryID, AreaID, iDs, roleCode, onSuccessDel, onFailureDel);
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

    function EditRecord(ids, schoolcode)
    {
        var vLeft = 100;
        var vTop = 200;
        goPage = "SchoolManagementEdit.aspx?IDs=" + ids +  "&sID=" + schoolcode; 
            try {              
                $("#ActioniFramePage").attr('src', goPage);
                $("#ActionTitle").html("School Profile Edit");
                $("#ActionPOPDIV").css({
                    top: 100,
                    left: 200,
                    height: 350,
                    width: 700
                })
                $("#ActioniFramePage").css({
                    height: 320,
                    width: 690,
                    border: 0
                })                
                // $("#PopUpDIV").fadeToggle("fast");
                 $("#ActionPOPDIV").fadeToggle("fast");
                //  $("#ActionMenuDIV").fadeToggle("fast");
            }

            catch (e) { }

      
    }
</script>
