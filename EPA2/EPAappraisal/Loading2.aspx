﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading2.aspx.cs" Inherits="EPA2.EPAappraisal.Loading2" %>


<!DOCTYPE  ">
<html>

<head runat="server">
    <title>Loading Page</title>
    <style>
        /*div {*/
            /*            height: 84%;
            width: 99%;*/
            /*text-align: center;
            margin: auto;
            padding-top: 15%;
        }*/
        .Container {
        display:flex;
             height: 100%;
            width: 100%;
        }
        .LoadImage {
        margin:auto;
        }
    </style>
</head>
<body>
    <div class="Container">
        <div class ="LoadImage">
            <img src="../images/Loading.gif" />
            <a id="PageURL" runat="server" href='#' target="_self">Loading ...... Appraisal</a>

        </div>
    </div>


    <script type="text/javascript">
        var myHref = document.getElementById("PageURL").getAttribute("href");
        window.location.href = myHref;
    </script>

</body>
</html>
