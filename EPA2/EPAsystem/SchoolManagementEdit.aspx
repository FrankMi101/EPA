<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolManagementEdit.aspx.cs" Inherits="EPA2.EPAsystem.SchoolManagementEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Appraisal Profile Edit</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        body {
            width: 100%;
            height: 100%;
        }

        .columnTitle {
            width: 20%;
            margin-right: -1px;
            display: inline;
            color: #b7efaf;
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
            width: 100%;
            background-color: beige;
        }

        .ReadonlyItem {
            width: 182px;
            background-color: whitesmoke;
        }
    </style>
      
<script type="text/javascript">
    function CallShowMessage(action, message) {
        window.alert(action + " " + message);
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div class="tableRow">
             <div class="columnTitle">User ID</div>
             <div class="columnContent"><asp:TextBox ID="TextBox1" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></div>
             <div class="columnTitle">Employee ID</div>
             <div class="columnContent"><asp:TextBox ID="TextBox2" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></div>
        </div>
        <div class="tableRow">
             <div class="columnTitle">Appraisal Status </div>
             <div class="columnContent"><asp:DropDownList ID="DropDownList2" runat="server" CssClass="EditItem"></asp:DropDownList></div>
             <div class="columnTitle">Appraisal type</div>
             <div class="columnContent"> <asp:DropDownList ID="DropDownList1" runat="server" CssClass="EditItem"></asp:DropDownList></div>
        </div>--%>
        <div>
            <table style="width: 100%">
                <tr>
                    <td>School Code</td>
                    <td>
                        <asp:TextBox ID="TextSchoolCode" runat="server" CssClass="EditItem" Width="80px" > </asp:TextBox></td>
                    <td>Type</td>
                    <td>
                         <asp:DropDownList ID="ddlSchoolType" runat="server" CssClass="EditItem"></asp:DropDownList>
                    </td>
                    

                </tr>
                <tr>
                    <td>School Name</td>
                    <td colspan="3">
                        <asp:TextBox ID="TextSchoolName" runat="server" CssClass="EditItem"> </asp:TextBox></td>

                </tr>
                <tr>
                    <td style="width: 15%">Principal</td>
                    <td style="width: 20%">
                        <asp:DropDownList ID="ddlPrincipal" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td style="width: 10%">Panel</td>
                    <td style="width: 55%">
                        <asp:DropDownList ID="ddlPanel" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    
                </tr>

                <tr>
                    <td>School Area</td>
                    <td>
                        <asp:DropDownList ID="ddlSchoolArea" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>School District</td>
                    <td  >
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    
                </tr>
                <tr>
                    <td>Active</td>
                    <td>
                        <asp:CheckBox ID="chbActive" runat="server" />
                    </td>
                    <td></td>
                    <td> TPA
                        <asp:CheckBox ID="chbTPA" runat="server" />
                          PPA  <asp:CheckBox ID="chbPPA" runat="server" />
                    </td>
                     
                </tr>


                <tr>
                    <td>Comments</td>
                    <td colspan="3">
                        <asp:TextBox ID="TextComments" runat="server" CssClass="EditItem" Height="60px" TextMode="MultiLine"></asp:TextBox></td>

                </tr>
            </table>

            <div style="text-align: center">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />

                <asp:Button ID="btnRemove" runat="server" Text="Delete" CssClass="saveButton" OnClick="btnRemove_Click" />

            </div>

        </div>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfIDs" runat="server" />
        </div>
    </form>
</body>
</html>


<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

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


        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
    });


    function CallShowMessage(action, message) {
        window.alert(action + " " + message);
    }

</script>
