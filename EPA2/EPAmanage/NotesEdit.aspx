<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotesEdit.aspx.cs" Inherits="EPA2.EPAmanage.NotesEdit" %>

<!DOCTYPE html>
          
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notes Edit</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
     <style>
        body {
            width: 100%;
            height: 100%;
        }

        .columnTitle {
            width: 20%;
            margin-right: -1px;
            display: inline;
        }

        .columnContent {
            width: 30%;
            margin-right: -1px;
            display: inline;
        }

        .tableRow {
            width: 100%;
            display: inline-block;
        }

        .EditItem {
            width: 190px;
            background-color: beige;
        }

        .EditItemT {
            width: 183px;
            background-color: beige;
        }

        .ReadonlyItem {
            width: 182px;
            background-color: whitesmoke;
        }
        
.saveButton {
    width: 120px;
    margin-right: 30px;
}

    .saveButton:hover {
        background-color: coral;
        color: white;
    }
    </style>
    <script>
        function CallShowMessage(action, message) {
            window.alert(action + " " + message);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div>
              <div class="ContentTextarea">
                <asp:TextBox ID="myText" runat="server"   OnTextChanged="MyText_TextChanged" Height="320px" MaxLength="2000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>


              <div style="text-align: center">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />   
            </div>
                        


            

        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfIDs" runat="server" />
                                                              
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="2000" />

            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
             <asp:HiddenField ID="hfApprName" runat="server" />
       </div>
    </form>
</body>
</html>

                                               
<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>

<script type="text/javascript">
    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var phase;
    var category;
    var myKey;
    var currentTR;
    $(document).ready(function () {
        $("#myText").addClass("myEditItem");
    });


</script>
          