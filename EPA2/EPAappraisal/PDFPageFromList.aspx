﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDFPageFromList.aspx.cs" Inherits="EPA2.EPAappraisal.PdfPageFromList" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        body, form {
            height: 100%;
            width: 99.5%;
            
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .labelMessage {
            color: red;
            font-family: Arial, sans-serif;
            font-weight: 700;
            font-size: 1.2em;
        }

        header {
            display: none;
        }
    </style>


</head>
<body>
    <form id="form2" runat="server">


        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section style="height: 100%;">
              <div id="ContentTitleLeft">
                <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" style="display:none;" />
            </div>
            <div id="ContentMessageNotReady" runat="server" class="ContentMessage">
                <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage">Report is not ready</asp:Label>
            </div>
            <div id="iFrameForPDF" style="height: 600px">
                <iframe id="PDFiFramePage" name="PDFiFramePage" style="height: 100%; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>

            </div>

        </section>

         <footer style =" display:none;">
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton"   />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton"   />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton"  />
        </footer>

        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.png" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>
        <div>
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />


        </div>
    </form>
</body>
</html>
                                               
 

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>

<script>
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    $(document).ready(function () {

     

        //$("#closeActionPOP").click(function (event) {
        //    $("#ActionPOPDIV").fadeToggle("fast");
        //});
        //$(".labelTitle").dblclick(function (event) {
        //    EditPageItemTitle();
        //});
    });

</script>
