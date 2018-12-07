<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="EPA2.EPAmanage.Feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link href="../Content/BubbleHelp.css" rel="stylesheet" />
     <style>
        html, body {
            width: 99.5%;
            height: 99.5%;
            margin:auto;
           
        }

        .appheader {
            margin: auto;
            height: 80px;
            width: 100%;
            display: block;
            float: left;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

        .TopMessagebar {
            height: 30px;
            width: 100%;
            border-bottom: 2px solid lightsalmon;
            /*background-image: url(images/menubar.png);*/
            display: block;
            float: left;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        .topMessage {
            background-color: transparent;
            color: yellow;
            font-weight: 500;
        }

         .EditItem {
         width:100%;
         background-color:cornsilk  ;
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

       
    </style>
       <script>
        function CallShowMessage(action, message) {
            window.alert(action + " " + message);
        }
    </script>
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">
        <div class="appheader">
            <div style="display: inline; width: 97%;">
                <asp:Label ID="LabelAppraisalTitle" runat="server" Text="Application Feedback" Height="30px"></asp:Label>
            </div>
            <div style="display: inline; float: right; width: 3%; text-align: left;">
                <img id="closeMe" src="../images/close.png" style="height: 28px; width: 28px;" />
            </div>
            <br />
            <div style="display: inline; float: left; width: 45%; text-align: left;">
                <asp:Label ID="LabelGreetingUser" runat="server" Text="Welcome User" Height="25px"></asp:Label>
            </div>
            <div style="display: inline; float: right; width: 50%; text-align: right;">
            </div>


        </div>

        <%--<div class="TopMessagebar">
            <div style="float: left; display: inline; padding-top: 5px; text-align: center; width: 95%">

                <asp:Label ID="LabelEmployeeName" runat="server" Text="" Width="500px" Font-Bold="true" ForeColor="yellow"></asp:Label>
            </div>

        </div>--%>

        <div class="contentPart">
            <table style="width:99.5%; border:1px">
                <tr>
                    
                    <td>Purpose of:</td>
                     <td>
                         <asp:DropDownList ID="DropDownListPurpose" runat="server" Width="100%">
                             <asp:ListItem>Glitches</asp:ListItem>
                             <asp:ListItem>Suggestion</asp:ListItem>
                             <asp:ListItem>Requirement</asp:ListItem>
                         </asp:DropDownList>
                     </td><td style="width:12%; text-align:right ">About:</td>
                    <td>
                        <asp:TextBox ID="TextTopic" CssClass="EditItem" runat="server"></asp:TextBox></td>
                    </tr>
                <tr>
                    <td style="width:12%">Section:</td>
                    <td style="width:28%">
                        <asp:TextBox ID="TextSection" CssClass="EditItem" runat="server"></asp:TextBox></td>
                    <td style="width:12%; text-align:right ">Page:</td>
                    <td style="width:48%">
                        <asp:TextBox ID="TextPage" CssClass="EditItem" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>User Role:</td>
                    <td>
                        <asp:TextBox ID="TextRole" CssClass="EditItem" runat="server" Enabled="false"></asp:TextBox></td>
                    <td style="width:12%; text-align:right ">User Name:</td>
                    <td>
                        <asp:TextBox ID="TextName" CssClass="EditItem" runat="server" Enabled="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>FeedBack</td>
                    <td colspan="3">
                        <asp:TextBox ID="myText" runat="server" CssClass="EditItem"  Height="320px" MaxLength="1000" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr><td></td>
                    <td colspan="3" >
                         <asp:Button ID="btnSave" runat="server" Text="Add User" CssClass="saveButton" OnClick="btnSave_Click" Visible="false" />  
                          <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="saveButton" OnClick="btnSend_Click" />  
                    </td>
                </tr>
            </table>

        </div>

        <%--<div id="PopUpDIV" class="bubble epahide"></div>
        <div id="EditDIV" runat="server" class="bubble epahide">
            <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>--%>


        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>

<script>

    $(document).ready(function () {
        
        $(".appheader #closeMe").click(function (event) {
            try {
                $("#ActionPOPDIV", parent.document).fadeToggle("fast");
               // $("#PopUpDIV", parent.document).fadeToggle("fast");
            }
            catch (e)
            { }
            try {
                $("#ActionPOPDIV").fadeToggle("fast");
              //  $("#PopUpDIV").fadeToggle("fast");
            }
            catch (e)
            { }
        });

    });


</script>
