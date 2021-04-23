<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EPA2.Login" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Teacher Performance Appraisal - Login</title>
    <%--    <link href="../Content/bootstrap.min.css" rel="stylesheet" />--%>
    <%--  <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>--%>

    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
            margin:auto;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(12, 1fr);
            grid-template-rows: 90px 50px auto;
        }

        .header {
            grid-column: 1/-1;
            display: grid;
            grid-template-columns: 160px auto 450px;
            border-top: 2px solid #56c0e9;
        }

        .menu {
            grid-column: 1/-1;
        }

        .content { 
            grid-column: 1/-1;  
            display:grid;
              align-self:center;
        }
    
        .hostbar {
            text-align: center;
            color: antiquewhite;
            /*background-image: url(images/menubar.png);*/
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .CenterDIV {
            width: 300px;
            margin: auto;
            margin-top:100px;
            border: 2px lightblue outset;
            padding: 30px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
             color: darkred;
        }




        .LinkCell {
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }




        .table0 {
            width: 100%;
            text-align: left;
            margin: -3px 0px 0px 0px;
        }

        .textright {
            text-align: right;
        }

        .textleft {
            text-align: left;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header"  >

                <div id="LogoCol"  >
                    <img id="Image3" src="../images/boardlogo.gif" alt="TCDSB Logo" border="0" style="width: 160px; height: 80px" />
                </div>
                <div id="messageCol"  >
                    <asp:Label ID="LabelTrain" Width="106px" runat="server" Height="32px" Visible="False"
                        Font-Size="Large" ForeColor="#00C000"> Training</asp:Label>
                </div>
                <div id="linkCol"  >
                    <table class="table0">
                        <tr>

                            <td  >

                                <table cellspacing="0" cellpadding="0" width="100%" align="right"
                                    border="0" id="TableVersion" runat="server">
                                    <tr>
                                        <td style="text-align: right; vertical-align: top; width: 30px" class="visible-sm visible-md visible-lg">
                                            <img height="25" src="../images/curve.png" width="50" alt="" />
                                        </td>

                                        <td class="LinkCell"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="height: 20px; text-align: right; color: darkred; font-size: x-large;">
                                            <asp:Label ID="lblApplication" runat="server" Text="Teacher Performance Appraisal"></asp:Label>
                                            (<a id="appLink" runat="server" href="~/Default.aspx">EPA</a>)

                                        </td>
                                    </tr>

                                    <tr>

                                        <td colspan="2" style="text-align: right">
                                            <asp:Label ID="lblTCDSB" runat="server" Text="TCDSB " ForeColor="darkred" ToolTip="Show Application Support"></asp:Label>
                                            <asp:Label ID="lblVersion" runat="server" SkinID="AppVersion" Text=" (Version 2.6.7 )" ToolTip="Edit Application Support"></asp:Label>

                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr >
                            <td  >

                                <asp:Label ID="Label1" Height="25px" runat="server" BackColor="Transparent" Width="100%"
                                    Font-Size="X-Small" Font-Names="Arial" ForeColor="purple"> </asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>


            </div>
            <div class="menu"  >
                <div class="hostbar" id="HostName" runat="server">
                </div>

            </div>
            <div class="content"  >
                <div class="CenterDIV">

                    <h3>
                        <asp:Label ID="LabelAppName" runat="server" Text="Label"  Visible="false"></asp:Label></h3>

                    <table style="width: 300px; text-align: center; margin: auto">

                        <tr>
                            <td class="textright" style="width: 35%">Domain:</td>
                            <td style="width: 35%">
                                <asp:TextBox ID="txtDomain" runat="server" Width="120px" /></td>
                            <td style="width: 30%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="textright">User ID :</td>
                            <td>
                                <asp:TextBox ID="txtUserName" runat="server" Text="" Width="120px" /></td>
                            <td class="textleft">
                                <asp:RequiredFieldValidator ID="rfUserName" ControlToValidate="txtUserName" runat="server" ErrorMessage="*" Font-Size="Large" ForeColor="red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="textright">Password:</td>
                            <td>
                                <asp:TextBox ID="txtPassword" TextMode="Password" Width="120px"
                                    runat="server" />
                            </td>
                            <td class="textleft">
                                <asp:RequiredFieldValidator ID="rfPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="*" Font-Size="Large" ForeColor="red"></asp:RequiredFieldValidator></td>

                        </tr>
                        <tr style="display: none">
                            <td class="textright">Remember me?</td>
                            <td>
                                <asp:CheckBox ID="chkPersist" runat="server" /></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td style="text-align: left">

                                <asp:Button ID="Submit1" OnClick="Login_Click" Text="Log On" Width="128px" ForeColor="darkred"
                                    runat="server" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <p>
                    <asp:Label ID="errorlabel" ForeColor="red" runat="server" Text="Message" Visible="false" />
                </p>
            </div>
        </div>

        <asp:HiddenField ID="txtResolution" runat="server" />

    </form>
</body>
</html>
<script src="../Scripts/jquery-3.2.1.min.js"></script>

<script>
    $(document).ready(function () {
        var screenWidth = screen.width;
        var screenHeight = screen.height;
        $("#txtResolution").val(screenWidth + "x" + screenHeight);

    });
    //function pageLoad(sender, args) {   }

</script>

