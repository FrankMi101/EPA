<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppraisalStaffList.aspx.cs" Inherits="EPA2.EPAmanage.AppraisalStaffList" Async="true" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Perforamnace Appraisal Staff List</title>
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
            height: 100%;
            width: 99%;
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
            /*  width: 100%;*/
            /*   display: block;*/
        }



        .defaultBoard {
            border: 1px blue none;
        }

        #ActionMenuDIV {
            border: 2px lightblue ridge;
            height: 180px;
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
            border-color: yellow
        }

        .imgHelp {
            width: 23px;
            height: 23px;
            margin-top: -10px;
        }

        .label1 {
            font-family: Arial;
            font-size: 13px;
        }

        .Gobutton {
            display: inline;
        }

        #TextSearch {
            margin-bottom: -5px;
        }

        #SearchBar {
            position: absolute;
            top: 250px;
            left: 600px;
        }

        #HelpTextBox {
            width: 100%;
            height: 100%;
        }

        .top5Row {
            border-top: 5px solid darkcyan;
        }

        .HeaderRow {
            background-color: azure;
        }

        #GridView2 tr th {
            border: 1px solid #e1d9d9;
            font-family: Arial, sans-serif;
            font-size: x-small;
            text-align: center;
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

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div style="display: inline;">
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <asp:Label ID="Label3" runat="server" Text="School Year: " CssClass="label1"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Label1" runat="server" Text="Area: " CssClass="label1"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolArea" runat="server" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolArea_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="Label2" runat="server" Text="School" CssClass="label1"></asp:Label>
                    <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolCode_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlSchool" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Searchby" runat="server" Text="Search by" CssClass="label1"></asp:Label>


                    <asp:DropDownList ID="ddlSearchby" runat="server" Width="120px" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
                        <asp:ListItem Value="Teacher" Selected="True"> Teacher</asp:ListItem>
                        <asp:ListItem Value="Phase">Appraisal Phase</asp:ListItem>
                        <asp:ListItem Value="ALP">Annual Learnning Plan</asp:ListItem>
                        <asp:ListItem Value="Process">Appraisal Process</asp:ListItem>
                    </asp:DropDownList>

                    <asp:TextBox ID="TextSearch" runat="server" Height="20px" Width="100px" placeholder="Search by Surname"></asp:TextBox>

                    <asp:DropDownList ID="ddlSearch" runat="server" Width="150px" AutoPostBack="false" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" CssClass="Gobutton" />

                    <div id="SearchBar">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <img src="../images/indicator.gif" alt="" />
                               <%-- <img src="../images/LoadingPage.jpg" alt="" height="50" width="50" />--%>
                                Loading.....
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </div>
                    <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>


        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="DivRoot" style="width: 1200px; overflow:auto ">
                        <div style="overflow: hidden;" id="DivHeaderRow">
                            <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellspacing="1" cellpadding="1">
                            </table>
                        </div>

                        <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                            <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                                <Columns>
                                    <asp:BoundField DataField="RowNo" HeaderText="No." ItemStyle-CssClass="myRowNo">
                                        <ItemStyle Width="2%" />
                                    </asp:BoundField>

                                    <asp:TemplateField HeaderText="Menu" ItemStyle-CssClass="myAction">
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
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Type" ItemStyle-CssClass="myType">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("AppraisalType") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="2%" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="AppraisalStatus" HeaderText="Status" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="2%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalPhase" HeaderText="Appraisal Phase">
                                        <ItemStyle Width="9%" Wrap="false" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="Assignment" HeaderText="Assignment" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="9%" Wrap="True" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Appraiser" HeaderText="Apprailser" ItemStyle-CssClass="myApprailser visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="6%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mentor" HeaderText="Mentor" ItemStyle-CssClass="myMentor visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="6%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Outcome">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("AppraisalOutcome") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" Wrap="true" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CurrentSession" HeaderText="cSession" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="6%" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AppraisalProcess" HeaderText="process" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="6%" Wrap="true" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Appraisal 1" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link6" runat="server" Text='<%# Bind("Appraisal1") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" Wrap="True" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 2" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link7" runat="server" Text='<%# Bind("Appraisal2") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" Wrap="True" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Appraisal 3" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link8" runat="server" Text='<%# Bind("Appraisal3") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" Wrap="True" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Appraisal 4" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Link9" runat="server" Text='<%# Bind("Appraisal4") %>'>  </asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle Width="6%" Wrap="True" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Comments" HeaderText="Comments" ItemStyle-CssClass="visible-sm visible-md visible-lg" HeaderStyle-CssClass="visible-sm visible-md visible-lg">
                                        <ItemStyle Width="6%" Wrap="True" />
                                    </asp:BoundField>

                                    <%--  <asp:BoundField DataField="School_Year" ReadOnly="True"  ItemStyle-CssClass="hfSchoolYear" />
                                    <asp:BoundField DataField="School_Code" ReadOnly="True"  ItemStyle-CssClass="hfSchoolCode" />
                                    <asp:BoundField DataField="Employee_ID" ReadOnly="True"  ItemStyle-CssClass="hfEmployeeID" />--%>
                                    <%--<asp:BoundField DataField="myKey" ReadOnly="True" ItemStyle-CssClass="hfmyKey" >
                                     <ItemStyle Width="1px" />
                                    </asp:BoundField>--%>
                                    <%-- <asp:BoundField DataField="IDs" ReadOnly="True" ItemStyle-CssClass="hfIDs">

                                        <ItemStyle Width="0px" /> 
                                    </asp:BoundField>--%>
                                </Columns>
                                <RowStyle Height="30px" />
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
        <%--  <div style="color: Red; font-size:small; ">
            <asp:Label runat="server" ID="remaind22" Text="* Click on the Apply button to see interview candidate list "> </asp:Label>
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" CssClass="HelpTextBox" BackColor="transparent"></asp:TextBox>
            <%--<asp:Label ID="HelpTextContent1" runat="server" Text="Label"  CssClass="HelpTextBox"></asp:Label>--%>
            <%-- <div id="textHelp"></div>--%>
        </div>

        <div id="ActionMenuDIV" class="bubble epahide">
            <asp:Label runat="server" ID="LabelTeacherName" Text=""> </asp:Label>
            <ul>
                <li id="submenu1"><a class="menuLink" href="javascript:openEditPage3('500','700','./EPAmanage/Loading2.aspx?pID=Notes','Write Appraisal Notes');">Write Appraisal Notes </a></li>
                <li id="submenu2"><a class="menuLink" href="javascript:openEditPage3('500','700','./EPAmanage/Loading2.aspx?pID=Notification','Send Appraisal Notification');">Send Appraisal Notification </a></li>
                <li id="submenu3"><a class="menuLink" href="javascript:openEditPage3('470','650','./EPAmanage/Loading2.aspx?pID=AppraisalProfile','Edit Appraisal Profile');">Edit Appraisal Profile </a></li>
                <li id="submenu4"><a class="menuLink" href="javascript:openEditPage3('470','650','./EPAmanage/Loading2.aspx?pID=EditStaffProfile','Edit Employee Profile');">Edit Employee Profile </a></li>
                <li id="submenu5"><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=ALP99','Print Annual Learning Plan');">Print Annual Learning Plan </a></li>
                <li id="submenu6"><a class="menuLink" href="javascript:openEditPage3('700','900','./EPAmanage/Loading2.aspx?pID=SUM99','Print Summative Report');">Print Summative Report </a></li>

            </ul>
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
            <asp:HiddenField ID="hfUserRole" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfWorkingOn" runat="server" />
        </div>
    </form>
</body>
</html>
<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>
<script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>

<script type="text/javascript">
    var UserID = $("#hfUserID").val();
    var CategoryID = "TPA";
    var AreaID = "ManageList";
    var ItemCode = $("#hfCode").val();;

    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var sessionid;
    var phase;
    var category;
    var myKey;
    var myIDs;
  //  var currentTR;
    currentListPage = "StaffList";
    function pageLoad(sender, args) {
        var vHeight = window.innerHeight - 50;
        $("#Label4").text(vHeight);
        MakeStaticHeader("GridView1", vHeight, 1300, 20, false);

        $(document).ready(function () {
            ChangeHeaderSchoolName();
            // $("#ddlSearch").hide();
            var rowIndex = 1;
            //$("#GridView1 tr").each(function () {
            //    try {
            //        //var row = $(this).find('td.myType').text();
            //        //if (row != "PPA") {
            //        //    $(this).addClass("top5Row");
            //        //    return false;
            //        //}
            //        //if (rowIndex == 1)
            //        //    $(this).addClass("FixedHeader");
            //        //rowindex = rowindex + 1;
            //    }
            //    catch (ex) {
            //        throw new Error(" Gridview TR action");
            //    }
            //});

            $("#GridView1 tr").mouseenter(function (event) {
                if (currentTR != undefined) { currentTR.removeClass("highlightRow"); }
                currentTR = $(this);
                //  $(this).addClass("highlightBoard");
                currentTR.addClass("highlightRow");
            });

            //$("#ddlSearchby").change(function (e) {
            //    var searchby = $("#ddlSearchby").val();
            //    if (searchby == "Teacher") {
            //        $("#TextSearch").show();
            //        $("#ddlSearch").hide();
            //    }
            //    else {
            //        $("#TextSearch").hide();
            //        $("#ddlSearch").show();
            //        var BasePara = {
            //            Operate: searchby,
            //            UserID: UserID,
            //            Para1: "",
            //            Para2: "",
            //            Para3: ""
            //        };
            //        var myList = EPA2.Models.WebService1.GetNameCodeListValue("Get", BasePara, onSuccessMenu, onFailure);
            //    }

            //});

        });
    }
    function ChangeHeaderSchoolName() {
        var schoolcode = $("#ddlSchool").val();
        var schoolName = $("#ddlSchool option:selected").text();
        $("#LabelSchool", parent.document).text(schoolName);
        $("#LabelSchoolCode", parent.document).text(schoolcode);
        $("#LabelSchoolYear", parent.document).text($("#ddlSchoolYear").val());
    }
    function BuildSearchValueDDLList(objData) {
        $("#ddlSearch").html("");
        var list = "";
        for (x in objData) {
            list += "<option value ='" + objData[x].Code + "'>" + objData[x].Name + "</option>";
        }
        $("#ddlSearch").html(list);
        $("#ddlSearch").show();

    }

    function onSuccessMenu(result) {
        BuildSearchValueDDLList(result);
    }

    function onFailure() {
        alert("Get DDL List Failed!");
    }
</script>

