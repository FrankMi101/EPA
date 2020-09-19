<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_EvidenceLog.aspx.cs" Inherits="EPA2.EPAappraisal.ContentEvidenceLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 
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

        .btnTab {
            margin-left: -2px;
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
        </div>
        <div class="Horizontal_Tab" style="margin-left: -2px;">
            <asp:Button ID="Appraiser" runat="server" Text="Appraiser"  CssClass="BottonTab"  OnClick="Appraiser_Click" />
            <asp:Button ID="Appraisee" runat="server" Text="Appraisee"  CssClass="BottonTab" OnClick="Appraisee_Click" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:HiddenField ID="hfSelectedTab" runat="server" />
        <%--   <ul>
                <li><a id="Appraiser" class="aLinkTabHS TabClass" runat="server" href="#"
                    style="min-width: 180px;">Principal  </a></li>
                <li><a id="Appraisee" class="aLinkTabH TabClass" runat="server" href="#"
                    style="min-width: 180px;">Teacher </a></li>
            </ul>--%>
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
                        EmptyDataText="No History Data" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
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

                            <asp:BoundField DataField="LogDate" HeaderText="Date">
                                <ItemStyle Width="10%" />
                            </asp:BoundField>

                            <asp:BoundField DataField="LookFors" HeaderText="Look Fors" ItemStyle-CssClass="myComment">
                                <ItemStyle Width="85%" />
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
                <asp:Label runat="server" Font-Size="X-Small" ForeColor="Red" ID="remaind22" Text="* Click on the recover button or comments to add selected comments to Notes box. "> </asp:Label>

            </div>
        </div>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfObjRole" runat="server" />


        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/TabMenu.js"></script>

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
    var preaLinkID = "Appraiser";
    var preTitle = "";
    var actionRole;
    var objRole;
    function pageLoad(sender, args) {

        $(document).ready(function () {
            $("#GridView1 th").each(function () {
                var headText = $(this).text();
                if (headText.length == 1) {
                    $(this).addClass("HideColumn");
                }
            })
            $("#GridView2 th").each(function () {
                var headText = $(this).text();
                if (headText.length == 1) {
                    $(this).addClass("HideColumn");
                }
            })
            $('#GridView1 tr').mouseenter(function (event) {
                newRowNo = $(this).closest('tr').find('td.myRowNo').text();
                if (currentTR != undefined) { currentTR.removeClass("highlightBoard"); }
                currentTR = $(this);
                currentTR.addClass("highlightBoard");
            });

             $("#" + $("#hfSelectedTab").val()).addClass("selectedTab");
           
            $(".BottonTab").click(function (event) {
                currentTab = $("#hfSelectedTab").val();
                if (currentTab != undefined)
                { $("#" + $("#hfSelectedTab").val()).removeClass("selectedTab"); }
                $("#hfSelectedTab").val($(this).id);
                $(this).addClass("selectedTab");
            });
            try {
                MakeStaticHeader("GridView1", 300, 600, 22, false);
            }
            catch (ex) { }
            //$('.TabClass').click(function (event) {
            //    objRole = event.target.id;
            //    $("#hfObjRole").val(objRole);
            //    //$("#" + preaLinkID).parentNode.addClass("selectTab");
            //   // var evidencetext = EPA2.Models.WebService1.GetCompetencyEvidenceLog("Get", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, actionRole, onSuccessLog, onFailure);
            //});
            if ($("#hfObjRole").val() == "Appraiser") {
               // setMyTab('Appraiser', 'Appraisee');
            }
            else {
              //  setMyTab('Appraisee', 'Appraiser');
            }

            //$("#Appraiser").click(function (event) {
            //    setMyTab('Appraiser', 'Appraisee');
            //});
            //$("#Appraisee").click(function (event) {
            //    setMyTab('Appraisee', 'Appraiser');
            //});
            $('td.myAction').click(function (event) {
                 var selComments = $(this).closest('tr').find('td.myComment').text();
                addSelectedCommentTONote(selComments);

            });

            $('td.myComment').click(function (event) {
                 var selComments = $(this).closest('tr').find('td.myComment').text();
                addSelectedCommentTONote(selComments);

            });

        });

    }
    function addSelectedCommentTONote(selComments) {
        try {
           
            var workingCell = $("#hfWorkingCell", parent.document).val();
            if (workingCell == undefined) { workingCell = "myText"; }

            var workingText = $("#" + workingCell, parent.document).val();
            $("#" + workingCell, parent.document).val(workingText + "\n\r" + selComments);
            $("#hfContentChange", parent.document).val("1");
            //   parent.updateTextCellAfterContentAction();
            parent.SaveCompentencyTextContent();
        }
        catch (e) {
        }
    }
    function setMyTab(cTab, oTab) {
        var sTab = "aLinkTabHS";
        var nTab = "aLinkTabH";
        $("#" + oTab).removeClass(sTab).addClass(nTab);
        $("#" + cTab).removeClass(nTab).addClass(sTab);
    }
    //function IECompatibility() {
    //    var agentStr = navigator.userAgent;
    //    this.IsIE = false;
    //    this.IsOn = undefined;  //defined only if IE
    //    this.Version = undefined;
    //    this.Compatible = undefined;

    //    if (agentStr.indexOf("compatible") > -1) {
    //        this.IsIE = true;
    //        this.IsOn = true;
    //        this.Compatible = true;
    //    }
    //    else {
    //        this.Compatible = false;
    //    }

    //}

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
