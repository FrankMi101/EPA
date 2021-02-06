<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSSGrid.aspx.cs" Inherits="EPA2.CSSGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSSGrid.css" rel="stylesheet" />
    <link href="Content/TopLink.css" rel="stylesheet" />
    <link href="Content/TopNavList.css" rel="stylesheet" />
    <link href="Content/TopNavListM.css" rel="stylesheet" />
    <link href="Content/DefaultPage.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="container">
        <div class="header">
            <div class="header1">
                <img id="Image3" src="images/boardLogo.gif" alt="TCDSB Logo" border="0" style="width: 160px; height: 80px" />
            </div>
            <div class="header2">Message Area</div>
            <div class="header3">
                <table cellspacing="0" cellpadding="0"  align="right" 
                    border="0" id="TableVersion" runat="server">
                    <tr style="height: 30px;">
                        <td style="text-align: right; vertical-align: top; width: 30px" class="visible-sm visible-md visible-lg">
                            <img height="30" src="images/curve.png" width="50" alt="" />
                        </td>

                        <td class="LinkCell">
                            <asp:LinkButton ID="LinkBtnWorkingOn" runat="server" ToolTip="click on to switch to PPA" >Go PPA</asp:LinkButton>
                            <ul id="navlistLink" >
                                <li>
                                    <img id="LoginUserIcon"   src="images/user.png" width="20" height="20" />
                                    <a href="#" id="LoginUserRole" runat="server">UserRole </a>
                                    <asp:HiddenField ID="hfCurrentUserRole" runat="server" />

                                </li>


                                <li><a href="javascript:logoutApp()" id="Logout" runat="server">Log out </a>

                                </li>

                            </ul>
                        </td>
                    </tr>
                    <tr>

                        <td style="height: 20px; margin-right: 20px; text-align: right; color: #cc0033; font-size: large;"  colspan="2" >

                            <asp:Label ID="lblApplication" runat="server" Text="Teacher Performance Appraisal"></asp:Label>
                            (<a id="appLink" runat="server" href="~/Default.aspx">EPA</a>) 
                                <br />
                            <asp:Label ID="lblTCDSB" runat="server" Text="TCDSB " ForeColor="#CC0033" ToolTip="Show Application Support" Font-Size="small"></asp:Label>
                            <asp:Label ID="lblVersion" runat="server" Text=" (Version 1.0.1 )" ToolTip="Edit Application Support" Font-Size="small"></asp:Label>
                        </td>
                       
                    </tr>

                </table>
            </div>
        </div>

      <%--  <div class="menu">Menu Area</div>--%>

        <div class="content">CONTENT Area</div>

      <%--  <div class="footer">FOOT Area</div>--%>


    </div>
     </form>
</body>
</html>
