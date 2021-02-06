﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading.aspx.cs" Inherits="EPA2.Loading" %>

<!DOCTYPE  ">
<html >

<head runat="server">
    <title>Loading Page</title>
    <style>
        div {
           
            text-align: center;
            margin: auto;
            padding-top: 20%;
        }
    </style>
</head>
<body>
    <div>
        <img src="../images/Loading.gif" />
        <a id="PageURL" runat="server" href='#' target="_self">Loading ......</a>

    </div>

    <script type="text/javascript">
        var myHref = document.getElementById("PageURL").getAttribute("href");
        window.location.href = myHref;
    </script>

</body>
</html>

