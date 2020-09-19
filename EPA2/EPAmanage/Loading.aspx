<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading.aspx.cs" Inherits="EPA2.EPAmanage.Loading" %>


<!DOCTYPE  ">
<html>

<head runat="server">
    <title>Loading Page</title>
    <style>
        div {
            height: 99%;
            width: 99%;
            text-align: center;
            margin: -5px;
            padding-top: 15%;
        }
    </style>
</head>
<body>
    <div>
        <img src="../images/Loading.gif" />
        <a id="PageURL" runat="server" href='#' target="_self">Loading List...... </a>

    </div>

    <script type="text/javascript">
        var myHref = document.getElementById("PageURL").getAttribute("href");
        window.location.href = myHref;
        //function pageLoad(sender, args) {
        //    alert(topSelectedMenuItem);
        //    //if (topSelectedMenuItem != "undefined") $("#" + topSelectedMenuItem, parent.document).addClass("TopSelectItem");

        //}
    </script>

</body>
</html>
