<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appraisal11_NotExists.aspx.cs" Inherits="EPA2.EPAappraisal.Appraisal11NotExists" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
     
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>

        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitel">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgRecovery" src="../images/recover.png" title ="Recovery the Text content" />
                    <img class="imgSignoff" src="../images/signature.png" title ="Signed Off" />

                </div>
                <div id="ContentTitleRight">Characters limit
                    <input id="textCount" type="text" maxlength="10" size="1"   runat="server" readonly="readonly" />
                    <img class="imgCommentsMenu" src="../images/menu.png" title="Comment menu" />
                </div>
            </div>
            <div class="ContentSubTitle" >
                 <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitel">Text Box Sub Title</asp:Label>
            </div>
            <div class="ContentMessage" >
                 <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Text Box Message</asp:Label>
            </div>
            <div class="ContentTextarea">                        
                <asp:TextBox ID="myText" runat="server" OnTextChanged="MyText_TextChanged" Height="400px" MaxLength="5000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>
         <div style="display: inline; width: 100%; float: left;">
 
                <h3> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>  &nbsp;    Page not Exists in System !  Check the Page Definition .</h3>
                <div>
                    Appraisal Categoey: 
                    <asp:Label ID="Labelcategory" runat="server" Text="Label"></asp:Label>
                    <br />
                    Appraisal Area:
                    <asp:Label ID="LabelArea" runat="server" Text="Label"></asp:Label>
                    <br />
                    Apprasial Code: 
                    <asp:Label ID="LabelCode" runat="server" Text="Label"></asp:Label>
                </div>
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
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>

        <div id="TitleEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextTitleEdit" runat="server" Width="98%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
            <asp:TextBox ID="TextSubTitleEdit" runat="server" Width="98%" Height="80px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Sub Title"></asp:TextBox>
            <asp:TextBox ID="TextHelpEditL" runat="server" Width="98%" Height="320px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Help Content"></asp:TextBox>
            <asp:Button ID="ButtonTitleSave" runat="server" Text="Save" /> <asp:CheckBox ID="chbMessage" runat="server" Text="Message Content" Checked="false" />
        </div>

          <div id="ActionMenuDIV" class="bubble epahide"  >
             <ul>
                <li> <a id="CommentsBank" class="menuLink" href="#">Comments Bank </a></li>
                <li> <a id="SchoolLearningPlan" class="menuLink" href="#">School Learning Plan</a></li>
                <li> <a id="BoardStrategyPlan" class="menuLink" href="#">Board Strategy Plan</a>  </li> 
                <li> <a id="Recovery" class="menuLink" href="#">Content Recover</a>  </li> 
              
            </ul>
        </div>
         <div id="ActionPOPDIV" class="bubble epahide">
              <div class="editTitle" style="display:block; margin-top:5px;">
                  <div id="ActionTitle" style="display:inline; float:left; width:96%"></div>
                  <div  style="display:inline; float:left;"> <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" /> </div>
            </div>
              <iframe id="ActioniFramePage" name="ActioniFramePage" style="height:425px;  width:99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server"/>
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server"  Value="5000" />
      <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
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
    var appraisalYear =
    $(document).ready(function () {
        var vHeight = screen.height - 150 - 110 - 70;
        $("section").css("height", vHeight)
        $(document).ready(function () {
            var vHeight = screen.height - 150 - 110 - 70;
            $("section").css("height", vHeight)
            Highlight_LeftMenuSelectNode();
            if ($("#hfPageReadonly").val() == "Yes") {
                disableTextEdit();
            }
            $("#closeActionPOP").click(function (event) {
                $("#ActionPOPDIV").fadeToggle("fast");
            });
            $(".labelTitle").dblclick(function (event) {
                EditPageItemTitle();
            });

        });

        function disableTextEdit() {
            $('input[type="text"], textarea').attr('readonly', 'readonly');
        }

    });

</script>
