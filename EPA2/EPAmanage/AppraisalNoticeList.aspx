<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppraisalNoticeList.aspx.cs" Inherits="EPA2.EPAmanage.AppraisalNoticeList" %>

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
    <link href="../Scripts/JQueryUI/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Scripts/JQueryUI/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/JQueryUI/jquery-ui.structure.min.css" rel="stylesheet" />

    <style type="text/css">
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

        #ActionMenuDIV {
            border: 2px lightblue ridge;
            height: 140px;
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
            margin-top: -10px;
        }

        #EmailTemplateDIV {
            border: 2px solid #00c2ff;
        }
        .ui-datepicker-trigger {
        margin-top:-11px;
        height:20px;
        width:22px;
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
                    <asp:Label ID="Label3" runat="server" Text="School Year: "></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Label2" runat="server" Text="School"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolCode_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSchool" runat="server" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Searchby" runat="server" Text="Search by"></asp:Label>


                    <asp:DropDownList ID="ddlSearchby" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
                        <asp:ListItem Value="All" Selected="True"> </asp:ListItem>
                        <asp:ListItem Value="Teacher"> Teacher</asp:ListItem>
                        <asp:ListItem Value="Phase">Appraisal Phase</asp:ListItem>
                        <asp:ListItem Value="ALP">Annual Learnning Plan</asp:ListItem>
                        <asp:ListItem Value="Process">Appraisal Process</asp:ListItem>
                    </asp:DropDownList>

                    <asp:TextBox ID="TextSearch" runat="server" Width="150px" placeholder="Search by Surname"></asp:TextBox>

                    <asp:DropDownList ID="ddlSearch" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
                    <div class="NoticeButton">
                        <table style="font-size: small;">
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rblNoticeType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="rblNoticeType_SelectedIndexChanged" RepeatDirection="Horizontal" Width="400px" Enabled="false">
                                        <asp:ListItem Value="ALP" Selected="True">ALP Notice</asp:ListItem>
                                        <asp:ListItem Value="EPA">Performance Appraisal Notice</asp:ListItem>
                                        <asp:ListItem Value="OBS">Classroom Observation Notice</asp:ListItem>
                                    </asp:RadioButtonList></td>

                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Due Date:"></asp:Label>
                                    <input runat="server" type="text" id="deadlineDate" size="10" /></td>

                                <td>
                                    <asp:CheckBox ID="chbAll" runat="server" Text="Select All" CssClass="checkAll" /></td>
                                <td>
                                    <asp:Button ID="btnSendNotification" runat="server" Text="Send Notification"  Height="20px"/>
                                    <asp:Button ID="btnBatchPrint" runat="server" Text="Batch Print ALP"   Height="20px" />
                                </td>
                                <td style="width: 30%">
                                    <div id="Div1" runat="server" style="display: inline;">
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                            <ProgressTemplate>
                                                <img src="../images/indicator.gif" alt="" />
                                                <b>Searching.....</b>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </div>
                                </td>
                            </tr>
                        </table>


                    </div>


                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="DivRoot" style="width: 100%; height: 550px;">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellpadding="1" gridlines="Both">
                            </table>
                        </div>

                        <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="2%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Notice">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbSelect" Checked='<%# Bind("SelectedC") %>' runat="server" CssClass="myCheck"></asp:CheckBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DueDate" HeaderText="Due Date" ItemStyle-CssClass="myDate">
                                        <ItemStyle Width="4%" />
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
                                    <asp:TemplateField HeaderText="Teacher Name" ItemStyle-CssClass="myName">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link4" runat="server" Text='<%# Bind("TeacherNameL") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="15%" />
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="AppraisalPhase" HeaderText="Appraisal Phase">
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
                                    <asp:BoundField DataField="NoticeDate" HeaderText="Notice Date" ItemStyle-CssClass="myDateNotice">
                                        <ItemStyle Width="4%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Comments" HeaderText="Comments">
                                        <ItemStyle Width="17%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="myKey" ReadOnly="True" ItemStyle-CssClass="hfmyKey" Visible="false" />

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
        <div id="ActionMenuDIV" class="bubble epahide">
            <asp:Label runat="server" ID="LabelTeacherName" Text=""> </asp:Label>
            <ul>
                <li><a class="menuLink" href="javascript:openEditPage3('500','700','./EPAmanage/Loading2.aspx?pID=Notes','Write Appraisal Notes');">Write Appraisal Notes </a></li>
                <li><a class="menuLink" href="javascript:openEditPage3('500','700','./EPAmanage/Loading2.aspx?pID=Notification','Send Appraisal Notification');">Send Appraisal Notification </a></li>
                <li><a class="menuLink" href="javascript:openEditPage3('470','650','./EPAmanage/Loading2.aspx?pID=AppraisalProfile','Edit Appraisal Profile');">Edit Appraisal Profile </a></li>
                <li><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=ALP99','Print Annual Learning Plan');">Print Annual Learning Plan </a></li>
                <li><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=SUM99','Print Summative Report');">Print Summative Report </a></li>

            </ul>
        </div>
        <div id="cellEditDateDiv" class="bubble epahide">
            <input id="cellEditDeadLineDate" runat="server" type="text" size="9" style="display: none;" />
        </div>
        <div id="EmailTemplateDIV" class="bubble epahide">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <table style="width: 99.5%">
                        <tr>
                            <td colspan="4" style="color: red;">This email body template will send to all selected staffs.</td>
                        </tr>
                        <tr>
                            <td style="width: 10%">Notice Type</td>
                            <td style="width: 40%">
                                <asp:Label ID="NoticeLabel" runat="server" Text="Annual Learning Plan"> </asp:Label>
                            </td>
                            <td style="width: 25%; text-align: right">
                                <asp:Label ID="LabelDueDate2" runat="server" Text="Due Date:"></asp:Label></td>
                            <td style="width: 25%">
                                <input runat="server" type="text" id="deadlineDate2" name="deadlineDate2" class="ObservationDate" size="9" /></td>
                        </tr>


                        <tr>
                            <td>Email Subject:</td>
                            <td colspan="3">
                                <asp:TextBox ID="TextSubject" CssClass="EditItem" runat="server" Width="99%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Email Body</td>
                            <td colspan="3">
                                <asp:TextBox ID="myText" runat="server" CssClass="EditItem" Height="280px" MaxLength="1000" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="3">
                                <asp:Button ID="btnSendEmal" runat="server" Text="Send email" CssClass="saveButton" />
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="saveButton" />
                                <asp:Button ID="btnClose" runat="server" Text="Close " CssClass="saveButton" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfAppraisalYear" Value="20172018" runat="server" />
            <asp:HiddenField ID="hfWebSite" Value="Teacher Performance Appraisal Web Site" runat="server" />
            <asp:HiddenField ID="hfNoticeType" Value="" runat="server" />
            <asp:HiddenField ID="hfAppraisalCategory" Value="Teacher Performance Appraisal" runat="server" />
            <asp:HiddenField ID="hfSelectedID" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JQueryUI/jquery-ui.min.js" type="text/javascript"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>


<script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>

<script type="text/javascript">
    var UserID = $("#hfUserID").val();
    var CategoryID = "TPA";
    var AreaID = "NoticeList";
    var ItemCode = "Notice-" +  $("#hfNoticeType").val() ;
    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeID;
    var myKey;
    var currentTR;
    var noticeType;
    var noticeArea;
    var deadlineDate;
    var eventCell;
    function pageLoad(sender, args) {

        $(document).ready(function () {
            MakeStaticHeader("GridView1", 600, 1400, 20, false);
          //  noticeType = $("#hfNoticeType").val();
            noticeType = $("#rblNoticeType").find('input[type=radio]:checked').val();

            $("#GridView1 tr").mouseenter(function (event) {
                if (currentTR != undefined) { currentTR.removeClass("highlightRow"); }
                currentTR = $(this);
                currentTR.addClass("highlightRow");
            });

            $("#closeActionPOP").click(function (event) {
                $("#ActionPOPDIV").fadeToggle("fast");
            });

            $(".labelTitle").dblclick(function (event) {
                EditPageItemTitle();
            });
            $("#deadlineDate").datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true

            });
            $("#deadlineDate2").datepicker({
                dateFormat: 'yy-mm-dd',
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,

            });

            $("#deadlineDate2").change(function (event) {
                try {
                    deadlineDate = $("#deadlineDate2").val();
                    $("#deadlineDate").val(deadlineDate);
                    //if (noticeType != "OBS") {
                    var myText = $("#myText").val();
                    myText = myText.replace("{{PlaceHolder:DeadLineDate}}", deadlineDate);
                    $("#myText").val(myText);
                    //}
                }
                catch (e) {
                }
            });
            $("#deadlineDate").change(function (event) {
                try {
                    deadlineDate = $("#deadlineDate").val();
                    $("#deadlineDate2").val(deadlineDate);
                    //if (noticeType != "OBS") {
                    //   var myText = $("#myText").val();
                    // myText = myText.replace("{{PlaceHolder:DeadLineDate}}", deadlineDate);
                    //   $("#myText").val(myText);
                    //}
                    $("#GridView1 tr").each(function () {
                        try {
                            $(this).find('td.myDate').text(deadlineDate);
                        }
                        catch (ex) {
                            //  window.alert(ex.message);
                        }
                    })
                }
                catch (e) {
                }
            });

            $("#rblNoticeType").change(function (event) {
                var checkedRadioList = $("[id*=rblNoticeType] input:checked");
                var noticeTypetext = checkedRadioList.closest("td").find("label").html();
                noticeArea = checkedRadioList.val();
                noticeType = noticeType = $("#rblNoticeType").find('input[type=radio]:checked').val();
                $("#NoticeLabel").text(noticeTypetext);
                var category = 'TPA';
                var emailTemplate = EPA2.Models.WebService1.GetEmailTemplate("GetBody", noticeType, noticeArea, deadlineDate, onSuccess2, onFailure);
                var emailSubject = EPA2.Models.WebService1.GetEmailTemplate("GetSubject", noticeType, noticeArea, deadlineDate, onSuccess3, onFailure);

            });
            $("#btnClose").click(function (event) {
                $("#EmailTemplateDIV").hide(); // .fadeToggle("fast");
                return false;
            });
            $("#btnCancel").click(function (event) {
                $("#EmailTemplateDIV").hide(); //.fadeToggle("fast");
                return false;
            });
            $("#btnSendNotification").click(function (event) {

                var checkedRadio = $("[id*=rblNoticeType] input:checked");
                var value = checkedRadio.val();
                var text = checkedRadio.closest("td").find("label").html();
                $("#NoticeLabel").text(text);
                var myText = $("#myText").val();

                myText = myText.replace("{{PlaceHolder:OneLine}}", "");
                $("#myText").val(myText);

                deadlineDate = $("#deadlineDate").val();
                if (deadlineDate != "") {
                    myText = myText.replace("{{PlaceHolder:DeadLineDate}}", deadlineDate);
                    $("#myText").val(myText);
                }
                $("#EmailTemplateDIV").css({
                    top: 100,
                    left: 200,
                    height: 400,
                    width: 600
                })
                $("#EmailTemplateDIV").fadeToggle("fast");
                return false;
            });
            $("#btnSendEmal").click(function (event) {
                var checkedRadioList = $("[id*=rblNoticeType] input:checked");
                noticeArea = checkedRadioList.val();
                deadlineDate = $("#deadlineDate2").val();

                $("#GridView1 tr").each(function () {
                    try {
                        var observationcheck = $(this).find('td > .myCheck');
                        if (observationcheck[0].childNodes[0].checked) {
                            var row = $(this).find('td.myRowNo').text();
                            var myKey = $(this).find('td.hfmyKey').text();
                            deadlineDate = $(this).find('td.myDate').text();
                            sendNotification(myKey);
                        }
                    }
                    catch (ex) {
                        //  window.alert(ex.message);
                    }
                })
                return false;
            });
            $("#btnBatchPrint").click(function (event) {
                var selectedIDs = "";
                $("#GridView1 tr").each(function () {
                    try {
                        var observationcheck = $(this).find('td > .myCheck');
                        if (observationcheck[0].childNodes[0].checked) {
                            var myKey = $(this).find('td.hfmyKey').text();
                            var array = myKey.split('-');
                            var employId = array[3];
                            selectedIDs = selectedIDs + employId + ";"
                        }
                    }
                    catch (ex) {
                        //  window.alert(ex.message);
                    }
                })
                var rId = "AnnualLearningPlan";
                window.open("BatchPrintPage.aspx?rID=" + rId + "&eIDs=" + selectedIDs, "PDFDocument", "width=900 height=900, top=10, left=10, toolbars=no, scrollbars=no,status=no,resizable=yes");
            });

            $("#chbAll").click(function (event) {
                var checkedValue = "";
                if ($("#chbAll").prop("checked")) {
                    checkedValue = "checked";   //var checkedValue = $("#chbAll").prop("checked");
                }
                var x = 0;
                $("#GridView1 tr").each(function () {
                    try {
                        // $(this).find("#GridView1_cbSelect_" + x.toString()).prop("checked", checkedValue);
                        $("#GridView1_cbSelect_" + x.toString()).prop("checked", checkedValue);
                    }
                    catch (ex) {
                        window.alert(ex.message);
                    }
                    x++;
                })
            });
            $('td.myAction').click(function (event) {
                myKey = $(this).closest('tr').find('td.hfmyKey').text();
                rowNo = $(this).closest('tr').find('td.myRowNo').text();
            });
            $('td.myAction').mouseenter(function (event) {
                myKey = $(this).closest('tr').find('td.hfmyKey').text();
                rowNo = $(this).closest('tr').find('td.myRowNo').text();
            });

            $('td.myDate').click(function (event) {
                eventCell = $(this);
                var cellValue = $(this).closest('tr').find('td.myDate').text();

                $("#cellEditDeadLineDate").val(cellValue);
                $("#cellEditDeadLineDate").show();
                var xTop = event.currentTarget.offsetTop + 65;
                var xLeft = event.currentTarget.offsetLeft;
                var key = "NoticeDate";
                openDateCellEdit(key, xTop, xLeft, 20, 100);
                $("#cellEditDeadLineDate").datepicker(
                    {
                        dateFormat: 'yy-mm-dd',
                    });
                $("#cellEditDeadLineDate").focus();

            });
            $('#cellEditDeadLineDate').change(function () {
                var newValue = $('#cellEditDeadLineDate').val();
                eventCell.closest('tr').find('td.myDate').text(newValue);
                $("#cellEditDateDiv").hide();
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
    function sendNotification(myKey) {
        var array = myKey.split('-'); // split string on comma space

        var schoolyear = array[1];
        var schoolcode = array[2];
        var employeeId = array[3];
        var teacherName = array[4];
        var fromUser = array[5];
        var toUser = array[6];
        var ccUser = array[7];
        var appraiserName = array[8];
        var appraisalType = array[9];
        var subject = $("#TextSubject").val();
        var ebody = $("#myText").val();
        ebody = ebody.replace("{{PlaceHolder:ToName}}", teacherName);
        ebody = ebody.replace("{{PlaceHolder:DeadLineDate}}", deadlineDate);
        ebody = ebody.replace("{{PlaceHolder:AppraiserName}}", appraiserName);
        ebody = ebody.replace("{{PlaceHolder:AppraisalCategory}}", appraisalType);
        ebody = ebody.replace($("#hfWebSite").val(), "< a href = ' " + $("#hfWebSite").val() + "' target = '_blank' > Teacher Performance Appraisal </a >");
        var checkvalue1 = EPA2.Models.WebService1.SaveNotification("Appraiser", schoolyear, schoolcode, employeeId, noticeType, noticeArea, deadlineDate, subject, ebody, onSuccess, onFailure);
        var checkvalue2 = EPA2.Models.WebService1.SendNotification(toUser, ccUser, "", fromUser, subject, ebody, onSuccess, onFailure);

    }
    function onSuccess(result) {
        // alert(result);
    }
    function onSuccess2(result) {
        var myBody = result
        myBody = myBody.replace("{{PlaceHolder:DeadLineDate}}", deadlineDate);
        myBody = myBody.replace("{{PlaceHolder:TestEmailTo}}", "");
        myBody = myBody.replace("{{PlaceHolder:TestEmailCC}}", "");
        myBody = myBody.replace("{{PlaceHolder:AppraisalYear}}", $("#hfAppraisalYear").val());
        myBody = myBody.replace("{{PlaceHolder:WebSite}}", $("#hfWebSite").val());
        myBody = myBody.replace("{{PlaceHolder:AppraisalCategory}}", $("#hfAppraisalCategory").val());


        $("#myText").val(myBody);
    }
    function onSuccess3(result) {
        $("#TextSubject").val(result);
    }
    function onFailure(result) {
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

