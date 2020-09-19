<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StrategyPage.aspx.cs" Inherits="EPA2.EPAappraisal.StrategyPage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        table {
            width: 99.9%;
        }

        th {
            padding-left: 5px;
            border: 1px solid silver;
            background-color: green;
            color: white;
            font-family: Arial, sans-serif;
            font-size: small;
        }

        table td {
            border: 1px solid silver;
        }

        .myTextEdit {
            margin-top: -2px;
            width: 99%;
            height: 90px;
            background-color: cornsilk;
            /*border:1px solid silver;*/
        }


        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 600;
            font-size: 1.2em;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .myTextLabel {
            width: 99%;
        }

        .pIntial {
            text-align: center;
        }
        
#ContentTitleLeft {
    display: inline;
    float: left;
    width: 75%;
}

#ContentTitleRight {
    display: inline;
    float: right;
    text-align: right;
    width: 25%;
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

        <header style="display: none;">
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgRecovery" src="../images/recover.png" title="Recovery the Text content" id="recovery" runat="server" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />
                </div>
                <div id="ContentTitleRight">
                    Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>

            <%--          <div class="ContentSubTitle" >
                 <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitel">Text Box Sub Title</asp:Label>
            </div>--%>

            <div class="ContentTextarea">
                <table style="border-collapse: collapse; border-spacing: 0; border: 1px">
                    <tr>
                        <th style="width: 15%">
                            <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label>
                        </th>
                        <th style="width: 38%">
                            <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                        <th style="width: 38%">
                            <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                        <th style="width: 9%">
                            <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" CssClass="myTextLabel"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox1G" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextBox1S" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td class="pIntial">
                            <asp:CheckBox ID="CheckBox14" runat="server" CssClass="myCheckBox" OnCheckedChanged="CheckBox_Changed" /></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label21" runat="server" CssClass="myTextLabel"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox2G" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextBox2S" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td class="pIntial">
                            <asp:CheckBox ID="CheckBox24" runat="server" CssClass="myCheckBox" OnCheckedChanged="CheckBox_Changed" /></td>

                    </tr>
                    <tr id="Trow3" runat="server">
                        <td>
                            <asp:Label ID="Label31" runat="server" CssClass="myTextLabel"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox3G" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextBox3S" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td class="pIntial">
                            <asp:CheckBox ID="CheckBox34" runat="server" CssClass="myCheckBox" OnCheckedChanged="CheckBox_Changed" /></td>

                    </tr>
                    <tr id="Trow4" runat="server">
                        <td>
                            <asp:Label ID="Label41" runat="server" CssClass="myTextLabel"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox4G" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextBox4S" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td class="pIntial">
                            <asp:CheckBox ID="CheckBox44" runat="server" CssClass="myCheckBox" OnCheckedChanged="CheckBox_Changed" /></td>

                    </tr>

                    <tr id="Trow5" runat="server">
                        <td>
                            <asp:Label ID="Label51" runat="server" CssClass="myTextLabel"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="TextBox5G" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextBox5S" runat="server" CssClass="myTextEdit" OnTextChanged="TextBox_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td class="pIntial">
                            <asp:CheckBox ID="CheckBox54" runat="server" CssClass="myCheckBox" OnCheckedChanged="CheckBox_Changed" /></td>

                    </tr>
                </table>
            </div>


        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="BtnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="BtnNext_Click" />
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine"  CssClass="HelpTextBox"></asp:TextBox>
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
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%"   src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
             <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfContentChange1" runat="server" />
            <asp:HiddenField ID="hfContentChange2" runat="server" />
            <asp:HiddenField ID="hfContentChange3" runat="server" />
            <asp:HiddenField ID="hfContentChange4" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />
            <asp:HiddenField ID="hfWorkingCell" runat="server" />
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />


        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var appraisalYear;
    var DomainID = "1";
    var CompetencyID = "1";

    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();
        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});



        if ($("#hfSignOff").val() == "Complete") {
            DisableTextEdit();
        }
        else {
            if ($("#hfPageReadonly").val() == "Yes") {
                $('input[type="text"], textarea').attr('readonly', 'readonly');
            }
            else {
                $('input[type="checkbox"], CheckBox').attr('disabled', 'disabled');
            }
        }
        $(".myTextEdit").click(function (event) {
            var tId = $(this)[0].id;
            DomainID = tId.replace("myText", "");
            $("#hfWorkingCell").val(tId);
        });
        $(".myTextEdit").keydown(function (event) {
            CountTextBoxCharactors();
        });
        $(".myTextEdit").change(function (event) {
            if ($("#hfPageReadonly").val() != "Yes") {
                $("#hfContentChange").val("1");
            }
        });

        $(".myCheckBox").change(function (event) {         
                //  $("#hfContentChange" + tID).val("1");
                $("#hfContentChange").val("1");
  
        });
        $(".myTextEdit").on('paste', function (event) {

                $("#hfContentChange").val("1");            
        });

        $("table .labelTitle2").dblclick(function (event) {
            var objId = $(this)[0].id;
            ItemCode = ItemCode + objId.replace("labelTitle", "")
            EditPageItemTitle();
            event.stopPropagation();
        });
    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
        //        $("#rblRateRubric").attr("disabled", "disabled");
        //  $("*[name$='CheckBox']").attr("disabled", "disabled");
        $('input[type="checkbox"], CheckBox').attr('disabled', 'disabled');
    }

</script>
