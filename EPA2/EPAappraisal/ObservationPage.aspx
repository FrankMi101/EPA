<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="ObservationPage.aspx.cs" Inherits="EPA2.EPAappraisal.ObservationPage" %>

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
        width:99%;
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
        .myObservation
        {
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
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
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" />

                </div>

            </div>

            <div class="ContentTitleLeft" style="display: block; text-align: center">
                <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                <input runat="server" type="text" id="dateObservation" name="Observation" size="9" />
            </div>
            <br />
            <div class="ContentTitleLeft" style="display: block;">
                <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
            </div>
            <br />
            <div class="ContentCompetencyList" runat="server">
                <div id="DivRoot" style="width: 100%;">
                   <%-- <div style="overflow: hidden;" id="DivHeaderRow">
                        <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                        </table>
                    </div>--%>

                    <div style="overflow: scroll; width: 100%; height: 300px" id="DivMainContent">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="listRowNo">
                                    <ItemStyle Width="2%" />
                                </asp:BoundField>


                                <asp:BoundField DataField="CompetencyName" HeaderText="Competencies" ItemStyle-CssClass="myCompetencyName">
                                    <ItemStyle Width="50%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Obeservation" ItemStyle-CssClass="myObservation">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSelect" Checked='<%# Convert.ToBoolean(Eval("SelectedC"))%>' runat="server" CssClass="myCheck"></asp:CheckBox>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" Wrap="False" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Obeservation Notes">
                                    <ItemStyle Width="45%" Wrap="True" />
                                    <ItemTemplate>
                                        <%--<asp:Label ID="editText" runat="server" Text='<%# Eval("Comments") %>' CssClass="myCommentsText" Width="100%" TextMode="MultiLine">  </asp:Label>--%>
                                        <asp:TextBox ID="editText" runat="server" Text='<%# Eval("Comments") %>' CssClass="myCommentsText" Width="100%" TextMode="MultiLine" ReadOnly="true">  </asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <%--<asp:BoundField DataField="Comments" HeaderText="Comments"  ControlStyle-CssClass="myCommentsText">
                                    <ItemStyle Width="45%" />
                                </asp:BoundField>--%>

                                <asp:BoundField DataField="DomainID" ItemStyle-CssClass  ="myDomain"></asp:BoundField>
                                <asp:BoundField DataField="CompetencyID" ItemStyle-CssClass="myCompetency"></asp:BoundField>

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
            <br />
            <div class="ContentTitleLeft">
                <div style="display: inline; float: left">
                    <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                </div>

                <div id="ContentTitleRight" style="display: inline; width:300px; float: right">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" runat="server" id="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>

            <div class="ContentTextarea">
                <asp:TextBox ID="myText" runat="server" OnTextChanged="myText_TextChanged" Height="150px" MaxLength="1000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
            <%--     <asp:Button ID="btnCompetency" runat="server" Text="" OnClick="btnCompetency_Click" />--%>
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
              <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="ActionMenuDIV" class="bubble epahide">
            <ul>
                <li><a id="CommentsBank" class="menuLink" href="#">Comments Bank </a></li>
                <li><a id="SchoolLearningPlan" class="menuLink" href="#">School Learning Plan</a></li>
                <li><a id="BoardStrategyPlan" class="menuLink" href="#">Board Strategy Plan</a>  </li>
                <li><a id="Recovery" class="menuLink" href="#">Content Recover</a>  </li>

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
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="500" />
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfRubricText" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />


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
    var DomainID;
    var CompetencyID;
    var currentTR;
    var eventCell;
    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();
        //   var minD = new Date($("#hfSchoolyearStartDate").val());
        //    var maxD = new Date($("#hfSchoolyearEndDate").val()); 
        if ($("#hfUserLoginRole").val() != "Teacher")
        {   $("#dateObservation").datepicker(
               {
                   dateFormat: 'yy/mm/dd',
                   showOn: "button",
                   buttonImage: "../images/calendar.gif",
                   buttonImageOnly: true,
                   changeMonth: true,
                   changeYear: true,
                   //minDate: minD,
                   //maxDate: maxD,
                   val: new Date().toDateString
               });
        }
      
        $("#GridView1 th").each(function () {
            var headText = $(this).text();
            if (headText.length == 1) {
                $(this).addClass("myDomain");
            }
        })

        $("#GridView1 tr").each(function () {
            try {
               // var domain = $(this).find('td.myCompetency').text();
                var domain = $(this).find('td.myCompetency').text();
                var editTextColumn = $(this).find('td > .myCommentsText');

                if (domain == "0") {
                    //$(this).find('td.myCompetencyName').css("color", "#75ab75");
                    $(this).find('td.myCompetencyName').css("font-size", "1.1em");
                    // $(this).find('td.myCompetencyName').css("font-weight", "500");
                    $(this).find('td.myObservation').attr('disabled', true);
                    $(this).find('td.myCommentsText').attr('disabled', true);
                }
                if ($("#hfSignOff").val() == "Complete")
                {
                    $(this).find('td.myObservation').attr('disabled', true);
                    $(this).find('td.myCommentsText').attr('disabled', true);
                    $(this).find('td.myCheck').attr('disabled', true);  
                }
                else
                {
                    var observationcheck = $(this).find('td > .myCheck');
                    if (observationcheck[0].childNodes[0].checked) {
                        editTextColumn[0].readOnly = false;
                    }
                }
            }
            catch (ex)
            { }
        })

        $('td > .myCheck').click(function (event) {
            eventCell = $(this);
            var DomainID = $(this).closest('tr').find('td.myDomain').text();
            var CompetencyID = $(this).closest('tr').find('td.myCompetency').text();
            var checkValu = (eventCell[0].childNodes['0'].checked ? "1" : "0");
            var checkvalue = EPA2.Models.WebService1.SaveObseverationSelect("Check", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, checkValu, "", onSuccessOBS, onFailure);
            var mytextColumn = $(this).closest('tr').find('td > .myCommentsText');
            if (checkValu == "1") {
                mytextColumn[0].readOnly = false;
            }
            else {
                mytextColumn[0].readOnly = true;
            }
        });
        $('td > .myCommentsText').change(function (event) {
            var eventCell = $(this);
            var DomainID = $(this).closest('tr').find('td.myDomain').text();
            var CompetencyID = $(this).closest('tr').find('td.myCompetency').text();
            var checkValu = "0";
            var value = eventCell[0].value;
            var checkvalue = EPA2.Models.WebService1.SaveObseverationSelect("Comment", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, checkValu, value, onSuccessOBS, onFailure);
        });

        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }
        else { $("#myText").addClass("myEditItem"); }

        $('.cList').each(function () {
            if ($(this)[0].id == workingItem) {
                $(this).addClass("WorkingItem");
                workingItem = $(this);

            }
        });


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

    function DisableTextEdit() {
        if ($("#hfSignOff").val() == "Complete") {
            $('input[type="text"], textarea').attr('readonly', 'readonly');
            $('input[type="text"], textarea').removeClass("myEditItem");
            $('input[type="text"], textarea').addClass("myEditItemDisable");
        }
        else { }
    }
    function onSuccessOBS(result) {
        // alert(result);
    }
</script>
