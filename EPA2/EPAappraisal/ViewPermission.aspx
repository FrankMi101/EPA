<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPermission.aspx.cs" Inherits="EPA2.EPAappraisal.ViewPermission" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        header {
            display: none;
        }

        #TextBoxDate {
            display: none;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelMessage {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .AppraisaleeSignOff {
            text-align: center;
            vertical-align: middle;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-weight: 700;
            font-size: 1em;
        }

        #SignatureDIV {
            border: 2px solid lightsalmon;
            height: 250px;
            width: 400px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
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

        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                   

                </div>

            </div>
            <div class="AppraisaleeSignOff">
             
                <table style="width: 500px">
                   
                   
                    <tr>
                        <td colspan="4" style="text-align: left; font-style: italic; color: orangered">

                            <asp:RadioButtonList ID="rblViewPermission" runat="server" OnSelectedIndexChanged="rblViewPermission_SelectedIndexChanged">
                                <asp:ListItem Value="NotAllow" Selected="true">Not Allow Appraisee to View Appraisal Content by Default</asp:ListItem>
                                <asp:ListItem Value="Allow">Allow Appraisee View only</asp:ListItem>
                                <asp:ListItem Value="SignOff">Allow Appraisee View and Sign off</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>



            </div>



        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

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
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentdatetime" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentUserName" runat="server" Value="" />

            <asp:HiddenField ID="hfPageReadonly" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var SignOffWho;
    var SignOffImg;
    function pageLoad(sender, args) {
        $(document).ready(function () {
            

            var vHeight = screen.height - 150 - 110 - 70;
            $("section").css("height", vHeight)
            Highlight_LeftMenuSelectNode();
           

            $("#closeActionPOP").click(function (event) {
                $("#ActionPOPDIV").fadeToggle("fast");
            });


            $(".labelTitle").dblclick(function (event) {
                EditPageItemTitle();
            });
            
        });

    }
                  
  
    

</script>
