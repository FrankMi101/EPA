<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text4Page2.aspx.cs" Inherits="EPA2.EPAappraisal.Text4Page2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />

    <style>
        table {
            width: 99%;
        }

        th {
             padding-left:5px;
             border: 1px solid silver; 
            background-color: green;
            color: white;
            font-family: Arial, sans-serif;
            font-size: small;
        }

        td {

            width: 25%;
            /*border:1px solid silver;*/
        }

        .myTextEdit {
            width: 99%;
            height: 600px;
            /*border:1px solid silver;*/
            
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 600;
            font-size: 1.2em;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }
   header {
        display:none;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>

        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                  <input id="textCount" type="text" maxlength="10" size="1" runat="server" readonly="readonly" visible="false" />
                </div>
            
            </div>

          

            <div class="ContentTextarea">
                <table  style="border-collapse: collapse; border-spacing: 0; border:1px">
                    <tr>
                        <th>
                            <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label>
                        </th>
                        <th>
                            <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                        <th>
                            <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                        <th>
                            <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitle2">Text Box Title</asp:Label></th>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="myText1" runat="server" CssClass="myTextEdit" OnTextChanged="myText1_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="myText2" runat="server" CssClass="myTextEdit" OnTextChanged="myText2_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="myText3" runat="server" CssClass="myTextEdit" OnTextChanged="myText3_TextChanged" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="myText4" runat="server" CssClass="myTextEdit" OnTextChanged="myText4_TextChanged" TextMode="MultiLine"></asp:TextBox></td>

                    </tr>
                </table>
            </div>


        </section>

  
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
            <asp:HiddenField ID="hfContentChange1" runat="server" />
            <asp:HiddenField ID="hfContentChange2" runat="server" />
            <asp:HiddenField ID="hfContentChange3" runat="server" />
            <asp:HiddenField ID="hfContentChange4" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />
            <asp:HiddenField ID="hfWorkingCell" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var appraisalYear;
    var DomainID = "1";
    var CompetencyID = "1";

    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight) 
        DisableTextEdit();
    });
    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }


</script>
