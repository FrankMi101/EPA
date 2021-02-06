<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppraisalAdjustment.aspx.cs" Inherits="EPA2.EPAmanage.AppraisalAdjustment" %>

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
            
            background-color: beige;
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
         <div>
             <asp:Label ID="LabelMessage" runat="server" Text="Label"></asp:Label>
         </div>
        <div>
            <table style="width: 100%">
                <tr>
                    <td style="width: 15%"></td>
                    <td style="width: 40%">Form</td>
                    <td style="width: 5%"></td>
                    <td style="width: 40%">To</td>
                </tr>

                <tr>
                    <td>School Year</td>
                    <td>
                        <asp:DropDownList ID="ddlSchoolYearFrom" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="ddlSchoolYearTo" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>School</td>
                    <td>
                        <asp:DropDownList ID="ddlSchoolCodeForm" runat="server" Width="70px"></asp:DropDownList>
                        <asp:DropDownList ID="ddlSchoolForm" runat="server" width ="300px" CssClass="EditItem"></asp:DropDownList></td>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="ddlSchoolCodeTo" runat="server" Width="70px"></asp:DropDownList>
                        <asp:DropDownList ID="ddlSchoolTo" runat="server" width ="300px" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Session</td>
                    <td>
                        <asp:DropDownList ID="ddlSessionForm" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="ddlSessionTo" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Work Area</td>
                    <td>
                        <asp:DropDownList ID="ddlWorkAreaFrom" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="ddlWorkAreaTo" runat="server" CssClass="EditItem" Visible="false"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Action:</td>
                    <td>
                        <asp:Button ID="btnSignOff" runat="server" Text="Sign Off" Width="100px" CssClass="saveButton" OnClick="BtnSign_Click" />
                        <asp:Button ID="btnRemove" runat="server" Text="Remove Appraisal" Width="150px" CssClass="saveButton" OnClick="BtnRemove_Click" />

                    </td>
                    <td></td>
                    <td>
                        <asp:Button ID="btnMove" runat="server" Text="Move To" Width="100px" CssClass="saveButton" OnClick="BtnMove_Click" />
                        <asp:Button ID="btnCopy" runat="server" Text="Copy to  " Width="100px" CssClass="saveButton" OnClick="BtnCopy_Click" />

                    </td>
                </tr>



            </table>

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
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/CommonDOM.js"></script>



<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_Help.js"></script>

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

        InitialDatePickerControl()


    });


    function InitialDatePickerControl() {
        var value = new Date().toDateString;
        var minD;
        var maxD;

        JDatePicker.Initial($("#DateStart"), minD, maxD, value);
        JDatePicker.Initial($("#DateEnd"), minD, maxD);
    }

</script>
