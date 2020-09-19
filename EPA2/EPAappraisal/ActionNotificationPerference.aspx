<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActionNotificationPerference.aspx.cs" Inherits="EPA2.EPAappraisal.ActionNotificationPerference" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        html, body {
            width: 99.5%;
            height: 99.5%;
            margin: auto;
        }
        .EditItem {
            width: 100%;
            background-color: cornsilk;
        }

        #LabelAppraisalTitle {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-weight: 800;
        }
       
.saveButton {
    width: 120px;
    margin-right: 30px;
}

    .saveButton:hover {
        background-color: coral;
        color: white;
    }
    </style>
 <script>
        function CallShowMessage(action, message) {
            window.alert(action + " " + message);
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />
            </Services>
        </asp:ScriptManager>


        <div class="contentPart">
            <table style="width: 99.5%">
                <tr>
                    <td>Notice Type</td>
                    <td colspan="3"> <asp:Label ID="LabelNoticeType" runat="server" Text="Notice Type"></asp:Label></td>

                </tr>
                <tr>
                    <td colspan="2">  
                        <asp:CheckBox ID="chbAuto" Text="Auto Send Notice" runat="server" />
                        </td>
                    <td style="width: 3%; text-align:right"> </td>
                    <td style="width: 65%">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true">
                            <asp:ListItem Selected="true" Value="System">System Template <img id="System" class="imgHelp" src="../images/help2.png" title="Help Content" /></asp:ListItem>
                            <asp:ListItem Value="Personal">Personal Template <img  id="Personal" class="imgHelp" src="../images/help2.png" title="Help Content" /></asp:ListItem>
                        </asp:RadioButtonList>
                         </td>
                </tr>
                
                <tr>
                    <td style="width: 18%">  Notice Subject:</td>
                    <td colspan="3">
                                      <asp:TextBox ID="TextSubject" CssClass="EditItem" runat="server"></asp:TextBox>
                              </td>
                </tr>
                <tr>
                    <td>Notice Comments</td>
                    <td colspan="3">
                        <asp:TextBox ID="myText" runat="server" CssClass="EditItem" Height="260px" MaxLength="1000" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="80px" CssClass="saveButton" OnClick="BtnSave_Click" />
                      </td>
                </tr>
                <tr>
                    <td></td>
                   <td colspan="3" style="color:red">* {{PlaceHolder: xxxxxxxxxx}}  is system reserved. do not change , you can move it in different place or complate delete.</td>
                </tr>
            </table>

        </div>

        <%--<div id="PopUpDIV" class="bubble epahide"></div>
        <div id="EditDIV" runat="server" class="bubble epahide">
            <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>--%>
         <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 95%"></div>
                <div style="display: inline; width: 5%; float: right;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" src="iBlankPage.html" runat="server"></iframe>
        </div>

        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />

            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfActionRole" runat="server" />
            <asp:HiddenField ID="hfAction" runat="server" />
            <asp:HiddenField ID="hfNoticeType" runat="server" />
            <asp:HiddenField ID="hfApprName" runat="server" /> 

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_Help.js"></script>

<script>
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfAction").val();
  
    $(document).ready(function () {

        $("#DeadLineDate").datepicker(
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
         $("#DeadLineDate").change(function (event) {
            try
            {
                var deadline = $("#DeadLineDate").val();
                var myText = $("#myText").val();
                myText = myText.replace("{{DeadLineDate}}", deadline);
                $("#myText").val(myText);
            }
            catch(e)   
            {
            }
        });   
    });

    function onSuccessHelp(result) {
        // $("#textHelp").text(result);

        var helpBox = $(".HelpTextBox");
        try {
            $("#HelpTextContent").val(result);
        }
        catch (ex) {
            var se = "";
        }
        try { $("#textHelp").html(result); }
        catch (ex) { var ex = ""; }


        helpBox.css({
            width: "99%"
        });
        var n = result.length;

        var vHeight;
        var vWidth;

        if (n > 1250) vWidth = 550;
        else if (n > 1000) vWidth = 500;
        else if (n > 750) vWidth = 450;
        else if (n > 500) vWidth = 400;
        else if (n > 250) vWidth = 350;
        else vWidth = 300;

        vHeight = vWidth - 100;
        if (vTop + vHeight > sHeight)
            vTop = vTop - vHeight - 20;
        if (vLeft - vWidth > 10)
            vLeft = vLeft - vWidth;
        else if (vLeft + vWidth > sWidth)
            vLeft = vLeft - vWidth / 2;
        else
            vLeft = vLeft + 25;
        // alert(vWidth);
        helpDiv.css({
            top: 60,
            left: vLeft,
            height: vHeight,
            width: vWidth
        });

        helpDiv.fadeToggle("fast");

    }
</script>
