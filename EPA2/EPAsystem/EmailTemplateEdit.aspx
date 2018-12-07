<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmailTemplateEdit.aspx.cs" Inherits="EPA2.EPAsystem.EmailTemplateEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />
    <style>
        html, body {
            width: 99.5%;
            height: 99.5%;
            margin: auto;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: small;
        }


        .topMessage {
            background-color: transparent;
            color: yellow;
            font-weight: 500;
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
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">


        <div class="contentPart">
            <table style="width: 800px; border: 1px solid silver">
                <tr>
                    <td>Notice Type</td>
                    <td >
                         <asp:DropDownList ID="ddlNoticeType" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="ddlNoticeType_SelectedIndexChanged"></asp:DropDownList>
                        Appraisal Area
                         <asp:DropDownList ID="ddlArea" runat="server" AutoPostBack="true" Width="300px" OnSelectedIndexChanged="ddlArea_SelectedIndexChanged"></asp:DropDownList>

                    </td>

                </tr>

                <tr>
                    <td>Notice</td>
                    <td>From:<asp:DropDownList ID="ddlFrom" runat="server"   Width="120px" >
                        <asp:ListItem Selected="true">Appraiser</asp:ListItem>
                        <asp:ListItem>Appraisee</asp:ListItem>
                        <asp:ListItem>Supervisory</asp:ListItem>
                        <asp:ListItem>AppAdmin</asp:ListItem>
                    </asp:DropDownList>
                        To:   
                        <asp:DropDownList ID="ddlTo" runat="server"  Width="120px" >
                            <asp:ListItem Selected="true">Appraisee</asp:ListItem>
                            <asp:ListItem>Appraiser</asp:ListItem>
                        </asp:DropDownList>
                        Purpose: 
                        <asp:DropDownList ID="ddlPurpose" runat="server"  Width="120px" >
                            <asp:ListItem>Remind</asp:ListItem>
                            <asp:ListItem Selected="true">Notice</asp:ListItem>
                        </asp:DropDownList>
                         &nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;   <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" Width="100px" CssClass="saveButton" OnClick="btnRetrieve_Click" /> 
                    </td>
                </tr>

                <tr>
                    <td>Notice Subject:</td>
                    <td style="width: 90%">
                        <asp:TextBox ID="TextSubject" CssClass="EditItem" runat="server" Width="99%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Notice Email Template</td>
                    <td>
                        <asp:TextBox ID="myText" runat="server" CssClass="EditItem" Height="300px" MaxLength="1000" TextMode="MultiLine" Width="99%"></asp:TextBox>
                    </td>
                </tr>
                <tr><td></td><td  >
                    <div style="color:red">
                        * {{xxxxx}} is place holder. Do not change, and system will replace the content accordingly. 
                    </div>
                    </td></tr>
                <tr>
                    <td>Notice Purpose</td>
                    <td>
                        <asp:TextBox ID="myPurpose" runat="server" Height="60px" MaxLength="250" TextMode="MultiLine" Width="99%" Enabled="false" OnTextChanged="myPurpose_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>


                        <asp:Button ID="btnSave" runat="server" Text="Save as Template" Width="200px" CssClass="saveButton" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>

        </div>



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
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>

<script>

    $(document).ready(function () {


    });



</script>
