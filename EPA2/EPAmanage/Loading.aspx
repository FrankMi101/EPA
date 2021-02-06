<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loading.aspx.cs" Inherits="EPA2.EPAmanage.Loading" %>


<!DOCTYPE  ">
<html>

<head runat="server">
    <title>Loading Page</title>
    <style>
       .Container {
            display: flex;
            height: 100%;
            width: 100%;
        }

        .LoadImage1 {
            margin: auto;
        }
        .LoadImage {
            display: flex;
            height: 100%;
            width: 100%;
            justify-content:center;
            align-items:center;
           /* margin: auto;*/
        }
    </style>
</head>
<body>
  <%-- <div class="Container">  </div>--%>
        <div class ="LoadImage">
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
