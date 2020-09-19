<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StatementsSetup.aspx.cs" Inherits="EPA2.EPAsystem.StatementsSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPageSetup.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

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


        .EditPage {
            width: 100%;
            height: 100%;
            margin: auto;
            border: 0px lightblue outset;
            padding: 1px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }



        #LabelAppraisalTitle {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-weight: 800;
        }

        .saveButton {
            margin-right: 30px;
        }

            .saveButton:hover {
                background-color: coral;
                color: white;
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



    </style>
    <script>
        function CallShowMessage(action, message) {
            window.alert(action + " " + message);
        }
    </script>
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
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

                </div>

            </div>

            <div class="ContentTitleLeft" style="display: block; text-align: center">
                <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX" Visible="false">Text Box Title</asp:Label>

            </div>

                   <div class="contentPart">
            <table style="width: 800px">

                <tr>
                    <td>Statement No.
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlNo" runat="server" Width="40px" OnSelectedIndexChanged="ddlNo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </td>
                    <td style="text-align: center">To</td>
                    <td>
                        <asp:DropDownList ID="ddlArea" runat="server"></asp:DropDownList>
                    </td>
                    <td style="text-align: center">of </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                    </td>

                </tr>
                <tr>
                    <td></td>
                    <td>Publish 
                    </td>
                    <td>Start Date:
                    </td>
                    <td>
                        <input runat="server" type="text" id="DateStart" name="DateStart" class="ObservationDate" size="9" />
                    </td>
                    <td style="text-align: right">End Date:
                    </td>
                    <td>
                        <input runat="server" type="text" id="DateEnd" name="DateEnd" class="ObservationDate" size="9" />
                    </td>
                </tr>

                <tr>
                    <td colspan="6">Subject:
                                      <asp:TextBox ID="TextSubject" CssClass="EditItem" runat="server" Width="92%"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td colspan="6">Statement: </td>
                </tr>
                <tr>

                    <td colspan="6">
                        <asp:TextBox ID="myText" runat="server" CssClass="EditItem" Height="400px" MaxLength="1000" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnNew" runat="server" Text="New" Width="80px" CssClass="saveButton" OnClick="btnNew_Click" /></td>
                    <td colspan="2">
                        <asp:Button ID="btnSend" runat="server" Text="Save" Width="120px" CssClass="saveButton" OnClick="btnSend_Click" />
                    </td>
                    <td colspan="3">
                        <asp:Button ID="btndelete" runat="server" Text="Delete" Width="120px" CssClass="saveButton" OnClick="btnDelete_Click" />
                    </td>
                </tr>
            </table>

        </div>
        
        </section>


        <footer>
         
        </footer>


        <div id="HelpDIV" class="bubble epahide">
                      <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>

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
            <asp:HiddenField ID="hfIDs" runat="server" />
            <asp:HiddenField ID="hfSchoolCode" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/CommonDOM.js" type="text/javascript"></script>
 
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script> 


<script>
    
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
  

    $(document).ready(function () {

        InitialDatePickerControl()
     

    });


    function InitialDatePickerControl() {
        var value = new Date().toDateString;
        var minD;
        var maxD;

        JDatePicker.Initial($("#DateStart"), minD, maxD, value);
        JDatePicker.Initial($("#DateEnd"), minD, maxD);
    }
</script>
