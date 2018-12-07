<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading.aspx.cs" Inherits="EPA2.EPAappraisal.Loading" %>


<!DOCTYPE ">
<html>

<head runat="server">
    <title>Loading Page</title>
    <style>
        div {
            height: 84%;
            width: 99%;
            text-align: center;
            margin: -15px;
            padding-top: 15%;
        }
        
#pageLoadingProgress {
    height:100%;
    width:100%;
    position:absolute;
 }
    </style>
 <%--   <script>
        var myProgress = document.getElementById("pageLoadingProgress");
        window.addEventListener("load", function () {
            myProgress.style.display = "none";
        })

    </script>--%>
</head>
<body>
    <div id ="pageLoadingProgress" runat="server">
        <img src="../images/Loading.gif" />
        <a id="PageURL" runat="server" href='#' target="_self">Loading ...... Appraisal</a>

    </div>

    <script type="text/javascript">
        var myHref = document.getElementById("PageURL").getAttribute("href");
        window.location.href = myHref;
    </script>

</body>
</html>
