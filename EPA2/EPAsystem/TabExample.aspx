<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TabExample.aspx.cs" Inherits="EPA2.EPAsystem.TabExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge" />--%>
    <link href="../Content/TabMenu.css" rel="stylesheet" /> 
</head>
<body>
    <form id="form1" runat="server">

        <table>
            <tr>
                <td colspan="2">
                    <div>

                        <div class="Horizontal_Tab" id="GradeTab" runat="server"></div>
                        <asp:HiddenField ID="hfSelectedTab" runat="server" />
                        <asp:HiddenField ID="hfSelectedTabL" runat="server" />

                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="Horizontal_Tab">
                        <ul>
                            <li><a id="Page1" class="aLinkTabHS" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page1 Horizontal Tab"
                                target="myContentPage" style="min-width: 155px;">My Test Page 1  </a></li>
                            <li><a id="Page2" class="aLinkTabH" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page2 Horizontal Tab"
                                target="myContentPage" style="min-width: 155px;">My Test Page 2 </a></li>
                            <li><a id="Page3" class="aLinkTabH" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page3 Horizontal Tab"
                                target="myContentPage" style="min-width: 155px;">My Test Page 3 </a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width:10%">
                    <div class="Vertical_Tab">
                        <ul>
                            <li><a id="Page4" class="aLinkTabS" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page4 Vertical Tab"
                                target="myContentPage" style="min-height: 180px;"><span class="spanTab" id="Span_Page4" runat="server">My Test Page 4</span> </a></li>
                            <li><a id="Page5" class="aLinkTab" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page5 Vertical Tab"
                                target="myContentPage" style="min-height: 140px;"><span class="spanTab" id="Span_Page5" runat="server">My Test Page 5</span> </a></li>
                            <li><a id="Page6" class="aLinkTab" runat="server" href="Loading.aspx?pID=TestPage.aspx?pID=Page6 Vertical Tab"
                                target="myContentPage" style="min-height: 120px;"><span class="spanTab" id="Span_Page6" runat="server">My Test Page 6</span> </a></li>
                        </ul>
                    </div>
                </td>

                <td style="width:90%">
                    <div class="PageContent">
                        <iframe id="iframeContentPage" name="myContentPage" src="Loading.aspx?pID=TestPage.aspx?pID=Page1 Vertical Tab"></iframe>
                    </div>
                </td>
            </tr>

        </table>






    </form>
</body>
</html>

<script src="../Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="../Scripts/TabMenu.js"></script>
<script type="text/javascript">
    var preaLinkID = "Page1";  /* default open page a link ID */
    var preTitle = "Mark Setup > Create Category >";  /* parent Page Navigate title */
</script>