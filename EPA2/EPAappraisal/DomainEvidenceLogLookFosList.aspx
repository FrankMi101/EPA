<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="DomainEvidenceLogLookFosList.aspx.cs" Inherits="EPA2.EPAappraisal.DomainEvidenceLogLookFosList" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Evidence Log check</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JQueryUI/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Scripts/JQueryUI/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/JQueryUI/jquery-ui.structure.min.css" rel="stylesheet" />

    <style>
        body {
            height: 99.5%;
            width: 99.5%;
            font-size: x-small;
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

        #RubricTable td {
            width: 33.33%;
        }

        .ContentRubric, .ContentCompetency {
            width: 100%;
        }

        #ContentCompetency, #ContentCompetency li {
            margin-left: -20px;
        }

            #ContentCompetency a {
                text-decoration: none;
                color: black;
            }

                #ContentCompetency a:hover {
                    text-decoration: underline;
                    color: purple;
                }

                #ContentCompetency a:visited {
                    color: forestgreen;
                }

        #btnCompetency {
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

        .myDomain, .myCompetency {
            display: none;
        }

        .myCommentsText {
            background-color: transparent;
            border: 0;
        }

        .hfmyKey {
            display: none;
        }

        .btnTab {
            display: none;
        }

        .editRow {
            height: 40px;
            background-color: cornsilk;
        }

        .editText {
        }
    </style>

</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>


        <div class="ContentLookForsList" runat="server">
            <div id="DivRoot" style="width: 100%; height: 500px;">
                <div  id="DivHeaderRow" style="overflow: hidden;">
                    <table id="GridView2" style="border: 1px ridge gray; width: 99%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                    </table>
                </div>

                <div  id="DivMainContent" style="overflow: scroll; width: 99%; height: 100%" onscroll="OnScrollDiv(this)">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="99%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                        <Columns>
                            <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                <ItemStyle Width="30px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Notice">
                                <ItemTemplate>
                                    <asp:CheckBox ID="LogCheck" Checked='<%# Bind("LogCheck") %>' runat="server" CssClass="myCheck"></asp:CheckBox>
                                </ItemTemplate>
                                <ItemStyle Width="50px" Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="LogDate" HeaderText="Due Date" ItemStyle-CssClass="myDate">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <%-- <asp:BoundField DataField="LookFors" HeaderText="Look Fors">
                                <ItemStyle Width="85%" />
                            </asp:BoundField>--%>
                            <asp:TemplateField HeaderText="Look Fors">
                                <ItemStyle Width="80%" Wrap="True" />
                                <ItemTemplate>
                                    <asp:TextBox ID="editText" runat="server" Text='<%# Eval("LookFors") %>' CssClass="myCommentsText" Width="100%" TextMode="MultiLine" ReadOnly="true">  </asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="LookForsID" ReadOnly="True" ItemStyle-CssClass="hfmyKey">
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
                <asp:Button ID="btnAddNew" runat="server" Text="Add New Log" OnClick="btnAddNew_Click" Enabled="false" />

            </div>
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
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="2000" />
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfLookForsID" runat="server" Value="1" />
            <asp:HiddenField ID="hfAllowView" runat="server" Value="1" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfRubricText" runat="server" />
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfObjRole" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/TabMenu.js"></script>

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
    var employeeID;
    var myKey;
    var lookForsID;
    var eventCell;
    var logDate;
    var logCheck;
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = $("#hfDomainID").val();
    var CompetencyID = $("#hfCompetencyID").val();
    var ActionRole = $("#hfAppraisalActionRole").val();
    var objRole = $("#hfObjRole").val();

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

            if (DomainID == "1" || DomainID == "3")
            { MakeStaticHeader("GridView1", 330, 700, 22, false);}
            else
                { MakeStaticHeader("GridView1", 380, 700, 22, false);}
           
           // var vHeight = screen.height - 150 - 110 - 70;
            if (objRole == ActionRole)
            { SetGridViewEdit("Yes"); }
            else
            { SetGridViewEdit("No"); }

            //$('td.myDate').click(function (event) {
            //    eventCell = $(this);
            //    var cellValue = $(this).closest('tr').find('td.myDate').text();
            //    lookForsID = $(this).closest('tr').find('td.hfmyKey').text();
            //    $("#LogDate").val(cellValue);
            //    $("#LogDate").show();
            //    var xTop = event.currentTarget.offsetTop + 65;
            //    var xLeft = event.currentTarget.offsetLeft;
            //    var key = "NoticeDate";
            //    openDateCellEdit(key, xTop, xLeft, 20, 100);
            //    $("#LogDate").datepicker(
            //         {
            //             dateFormat: 'yy-mm-dd',
            //         });
            //    $("#LogDate").focus();

            //});
            //$('#LogDate').change(function () {
            //    var newValue = $('#LogDate').val();
            //    eventCell.closest('tr').find('td.myDate').text(newValue);
            //    $("#LogDate").hide();
            //});
            $('td .myCheck').change(function () {
                eventCell = $(this);

                lookForsID = $(this).closest('tr').find('td.hfmyKey').text();
                logCheck = (eventCell[0].childNodes['0'].checked ? "1" : "0");
                logDate = eventCell.closest('tr').find('td .myDate').text();
                if (logDate == "") {

                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0!
                    var yyyy = today.getFullYear();
                    today = yyyy + '/' + mm + '/' + dd;  //  mm + '/' + dd + '/' + yyyy
                    logDate = today;
                    eventCell.closest('tr').find('td.myDate').text(logDate);
                }
                var comments = $(this).closest('tr').find('td .myCommentsText').text();
                SaveLookForsListLOGComments(comments);
            });
            $('td > .myCommentsText').change(function (event) {
                var eventCell = $(this);
                lookForsID = $(this).closest('tr').find('td.hfmyKey').text();
                logDate = $(this).closest('tr').find('td.myDate').text();       // eventCell.closest('tr').find('td .myDate').text();
                logCheck = "1"; // ($(this).closest('tr').find('td.myCheck').checked ? "1" : "0");
                var comments = eventCell[0].value; // $(this).closest('tr').find('td.myCommentsText').text();
                SaveLookForsListLOGComments(comments);
            });
        });
    }
    function openDateCellEdit(vKey, vTop, vLeft, vHeight, vWidth) {
        $("#cellEditDateDiv").css({
            top: vTop,
            left: vLeft,
            height: vHeight,
            width: vWidth
        })
        $("#cellEditDateDiv").show();// .fadeToggle("fast");
    }

    function SetGridViewEdit(vEdit) {
        $("#GridView1 tr").each(function () {
            try {
                if (vEdit == "Yes") {
                    $(this).find('td .myCheck').attr('disabled', false);
                    var lookID = $(this).find('td.hfmyKey').text();
                    if (lookID > 200) {
                        //  $(this).find('td .myCommentsText').attr('disabled', false);
                        // $(this).find('td .myCommentsText').attr('Height', "30px");
                        $(this).addClass("editRow");
                        var mytextColumn = $(this).find('td > .myCommentsText');
                        mytextColumn[0].readOnly = false;
                        $(this).find('td .myCommentsText').attr('TextMode', 'MultiLine');
                    }
                }
                else {

                    $(this).find('td .myCheck').attr('disabled', true);
                }
            }
            catch (ex)
            { }
        })
    }


    function SaveLookForsListLOGComments(comments) {
        var allowView = $("#hfAllowView").val();
        if (ActionRole == "Appraiser" && objRole == "Appraiser")
            { allowView = "1" }
        else
        {
            if (allowView == "")
            { allowView = "0" }
        }

        var result = EPA2.Models.WebService1.SaveLookForsChoseLOG("Save", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, lookForsID, ActionRole, objRole, logDate, logCheck, allowView, comments, onSuccess, onFailure);

    }
    function onSuccess(result)
    { }


</script>
