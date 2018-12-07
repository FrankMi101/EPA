<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EPA2.Login" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Teacher Performance Appraisal - Login</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <style type="text/css">
        body {
            width: 100%;
            margin: 0px;
            padding: 0px;
        }

        .CenterPostion {
            width: 100%;
            text-align: center;
        }

        .CenterDIV {
            width: 300px;
            margin: auto;
            border: 2px lightblue outset;
            padding: 30px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .hostbar {
            width: 100%;
            text-align: center;
            color: antiquewhite;
            height: 30px;
            /*background-image: url(images/menubar.png);*/
            display: block;
            float: left;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .appheader {
            height: 100px;
            width: 100%;
            border-top: 2px solid #56c0e9;
        }
   
        A:link {
            text-decoration: none;
            color: purple;
        }

        A:visited {
            text-decoration: none;
            color: #333399;
        }

        A:active {
            text-decoration: none;
            color: #333399;
        }

        A:hover {
            text-decoration: underline;
            color: purple;
        }

        .LinkCell {
            width: 100%;
            height: 18px;
            text-align: right;
            vertical-align: top;
            text-wrap: avoid;
            padding-top: 1px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        ul, li {
            margin-left: 2px;
            padding-left: 2px;
         }

        a:link, a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        li a {
            text-decoration: none;
            color: Blue;
            font-family: Arial, helvetica, Verdana, Sans-Serif;
        }

        ul {
            list-style-type: none;
            display: inline;
        }

        li {
            display: inline;
            position: relative;
            padding: 2px 10px 2px 10px;
        }

        #navlistLink li {
            display: inline;
            list-style-type: none;
            padding-right: 20px;
        }

        ul li:hover {
            border: 1px solid blue;
         }

        .table0 {
            width: 100%;
            text-align: left;
            margin: -3px 0px 0px 0px;
        }
        .textright {
        text-align:right;
        }
         .textleft {
        text-align:left;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="appheader ">
                <div id="LogoCol" style="display: inline; width: 10%; float: left;" class="pull-left visible-sm visible-md visible-lg">
                       <img id="Image3" src="../images/boardlogo.gif" alt="TCDSB Logo" border="0" style="width: 200px; height: 85px" />
                </div>
                <div id="messageCol" style="display: inline; text-align: right; width: 40%; float: left" class="visible-md visible-lg">
                     <asp:Label ID="LabelTrain" Width="106px" runat="server" Height="32px" Visible="False"
                                            Font-Size="Large" ForeColor="#00C000"> Training</asp:Label>
                </div>
                <div id="linkCol" style="display: inline; width: 500px; float: right;">
                       <table class="table0">
                                <tr>
                                  
                                    <td style="width: 40%; text-align: right; vertical-align: top">

                                        <table cellspacing="0" cellpadding="0" width="100%" align="right"
                                            border="0" id="TableVersion" runat="server">
                                            <tr>
                                                <td style="text-align: right; vertical-align: top; width: 30px" class="visible-sm visible-md visible-lg">
                                                    <img height="25" src="../images/curve.png" width="50" alt="" />
                                                </td>

                                                <td class="LinkCell"  >

                                                   
                                                </td>
                                            </tr>
                                               <tr>
                                                   <td colspan="2" style="height: 20px; text-align: right; color: #cc0033; font-size: x-large;"> 
                                                            <asp:Label ID="lblApplication" runat="server" Text="Teacher Performance Appraisal"></asp:Label>
                                                    (<a id="appLink" runat="server" href="~/Default.aspx">EPA</a>)

                                                   </td>
                                               </tr>
                                           
                                            <tr>

                                                <td colspan="2" style="text-align: right"  >
                                                    <asp:Label ID="lblTCDSB" runat="server" Text="TCDSB " ForeColor="#CC0033" ToolTip="Show Application Support"></asp:Label>
                                                    <asp:Label ID="lblVersion" runat="server" SkinID="AppVersion" Text=" (Version 2.6.7 )" ToolTip="Edit Application Support"></asp:Label>

                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                <tr style="height: 25px;">
                                    <td colspan="2" style="text-align: center; vertical-align: top;">

                                        <asp:Label ID="Label1" Height="25px" runat="server" BackColor="Transparent" Width="100%"
                                            Font-Size="X-Small" Font-Names="Arial" ForeColor="purple"> </asp:Label>
                                    </td>
                                </tr>
                            </table>
                </div>
                
            </div>
        </header>
        <div class="hostbar" id="HostName" runat="server"></div>
        <div class="CenterPostion">
            <h3 style="padding-top: 8%;">
                <asp:Label ID="LabelAppName" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;
                 Login Page</h3>
            <div class="CenterDIV">



                <table style="width: 300px; text-align: center; margin: auto">

                    <tr>
                        <td class="textright" style="width:35%">Domain:</td>
                        <td style="width:35%">
                            <asp:TextBox ID="txtDomain" runat="server"  Width="120px"  /></td>
                        <td style="width:30%"> &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="textright">User ID :</td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server"  Text="" Width="120px" /></td>
                        <td class="textleft">
                            <asp:RequiredFieldValidator ID="rfUserName" ControlToValidate="txtUserName" runat="server" ErrorMessage="*" Font-Size="Large"  ForeColor="red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="textright">Password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password"  Width="120px" 
                                runat="server" />
                        </td>
                        <td class="textleft">
                            <asp:RequiredFieldValidator ID="rfPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="*" Font-Size="Large" ForeColor="red"></asp:RequiredFieldValidator></td>

                    </tr>
                    <tr style="display:none" >
                        <td class="textright">Remember me?</td>
                        <td>
                            <asp:CheckBox ID="chkPersist" runat="server" /></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td style=" text-align:left ">

                            <asp:Button ID="Submit1" OnClick="Login_Click" Text="Log On" Width="120px"
                                runat="server" />
                        </td>
                        <td>
                          
                        </td>
                    </tr>
                </table>
            </div>
            <p>
                <asp:Label ID="errorlabel" ForeColor="red" runat="server" Text="Message" Visible="false" />
            </p>
  <asp:HiddenField ID="txtResolution" runat="server" />
        </div>

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

