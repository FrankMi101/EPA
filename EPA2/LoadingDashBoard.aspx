<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadingDashBoard.aspx.cs" Inherits="EPA2.LoadingDashBoard" %>

<!DOCTYPE  ">
<html >

<head runat="server">
    <title>Loading Page</title>
    <style>
        div {
            height: 100px;
            width:100px;
            text-align: center;
            margin: auto;
  

        }
    </style>
</head>
<body>
    <div>
        <img src="../images/Loading.gif" />
        <a id="PageURL" runat="server" href='#' target="_self">Loading ......</a>

    </div>

     <%--  <script type="text/javascript">
        var myHref = document.getElementById("PageURL").getAttribute("href");
        window.location.href = myHref;
     </script>--%>

</body>
</html>

