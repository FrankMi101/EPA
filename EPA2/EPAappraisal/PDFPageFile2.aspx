<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PDFPageFile2.aspx.cs" Inherits="EPA2.EPAappraisal.PdfPageFile2" %>

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
        
            div {
            height: 100%;
            width: 100%;
            text-align: center;
            margin:auto;
            padding-top: 5%;
            border:0px;
        }
    </style>

     
      

</head>
<body>
    <form id="form2" runat="server">
    

        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section >
                      
            <div id="ContentMessageNotReady"  runat="server" class  ="ContentMessage"  >       
                <asp:Label ID="labelMessage" runat="server" CssClass="labelMessage" ForeColor="red"> There is no {{ReportName}} PDF Report in Reports Server </asp:Label>
            </div>
           

        </section>


        <footer>
         </footer>
  
       

    </form>
</body>
</html>
       