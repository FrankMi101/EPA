<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDFPageFile.aspx.cs" Inherits="EPA2.EPAappraisal.PDFPageFile" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
    <style>
        .labelMessage {
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
        #iFrameForPDF {
        height:550px;
        border:0px;
        margin:auto;
        padding:0px;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
    

      <%--  <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>--%>
        <section>
           
            <div id="LoadingRow" runat="server" >
                  <img src="../images/Loading.gif" />
                     <a id="PageURL" runat="server" href='#' target="_self">Report Loading ...... </a>
            </div>
              <div id ="iFrameForPDF">
                  <iframe id="PDFiFramePage" name="PDFiFramePage" style="height: 100%; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>

              </div>

        </section>


        <footer>
         </footer>
  
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />

            <asp:HiddenField ID="hfPageReadonly" runat="server" /> 

        </div>
    </form>
</body>
</html>
        