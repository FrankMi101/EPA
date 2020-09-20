<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncryptionStr.aspx.cs" Inherits="EPA2.EPAsystem.EncryptionStr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr><td>Operation Type:</td><td><asp:DropDownList ID="DropDownList1" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Live</asp:ListItem>
                <asp:ListItem Value="Train">Trainning</asp:ListItem>
                <asp:ListItem Selected="True">Test</asp:ListItem>
                <asp:ListItem Value ="FrankAzure">Azure</asp:ListItem>
                 <asp:ListItem >LDAP</asp:ListItem>
                 <asp:ListItem >ADConnectionString</asp:ListItem>
               <asp:ListItem>Other</asp:ListItem>

            </asp:DropDownList></td><td></td></tr>
             <tr><td> Operation  String:</td><td> <asp:TextBox ID="TextObjStr" Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox> </td><td></td></tr>
             <tr><td>Encryption String:</td><td> <asp:TextBox ID="TextEncrypStr"  Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox> </td><td> <asp:Button ID="ButtonEncryption" runat="server" Text="Encryption" OnClick="ButtonEncryption_Click" /></td></tr>
             <tr><td> Decryption String: </td><td><asp:TextBox ID="TextDecrypStr"  Width="600px" Height="80px" TextMode="MultiLine" runat="server"></asp:TextBox> </td><td><asp:Button ID="ButtonDecryption" runat="server" Text="Decryption" OnClick="ButtonDecryption_Click" /></td></tr>
        </table>
        
    </form>
</body>
</html>
