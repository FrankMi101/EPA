<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStaffProfile.aspx.cs" Inherits="EPA2.EPAmanage.EditStaffProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Profile Edit</title>
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
            <table style="width: 100%">
                <tr>
                    <td style="width: 18%">User ID</td>
                    <td style="width: 32%">
                        <asp:TextBox ID="TextUserID" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></td>
                    <td style="width: 18%">Employee ID</td>
                    <td style="width: 32%">
                        <asp:TextBox ID="TextEmployeeID" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td>
                        <asp:TextBox ID="TextFirstName" runat="server" CssClass="EditItemT"> </asp:TextBox></td>
                    <td>Last Name</td>
                    <td>
                        <asp:TextBox ID="TextLastName" runat="server" CssClass="EditItemT"> </asp:TextBox></td>
                </tr>
                <tr>
                    <td>Employee Status</td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>Position Type</td>
                    <td>
                        <asp:DropDownList ID="ddlPostionType" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Position

                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="TextPosition" runat="server" CssClass="EditItem" Width="508px"> </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td>
                        <input runat="server" type="text" id="dateStart" name="dateStart" class="EditItemT" size="9"  style="width:90px" />
                    </td>
                    <td>End Date</td>
                    <td>
                        <input runat="server" type="text" id="dateEnd" name="dateEnd" class="EditItemT" size="9"  style="width:90px" />
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="TextEmail" runat="server" CssClass="EditItemT"> </asp:TextBox></td>
                </tr>
                <tr>
                    <td>Appraisal Staff</td>
                    <td>
                        <asp:CheckBox ID="chbAppraisal" runat="server" Text="staff in the Appraisal List" />
                    </td>
                    <td>TimeType</td>
                    <td>
                        <asp:DropDownList ID="ddlTimeType" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>

                <tr>
                    <td>SAP School</td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddlSchoolCodeSAP" runat="server" CssClass="ReadonlyItem" Width="80px" Enabled="false"></asp:DropDownList>
                        <asp:DropDownList ID="ddlSchoolNameSAP" runat="server" CssClass="ReadonlyItem" Width="430px" Enabled="false"></asp:DropDownList></td>

                </tr>
                <tr>
                    <td>Assignment</td>
                    <td colspan="3">
                        <asp:TextBox ID="TextAssignment" runat="server" CssClass="EditItem" Width="508px"> </asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>Comments</td>
                    <td colspan="3">
                        <asp:TextBox ID="TextComments" runat="server" CssClass="EditItem" Width="508px" Height="40px" TextMode="MultiLine"></asp:TextBox></td>

                </tr>
                <tr>
                    <td></td><td colspan="3">

                    <div style="text-align: center">
                  <asp:Button ID="btnAddNew" runat="server" Text="Add New" CssClass="saveButton" OnClick="btnNew_Click" />   
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />   
                   <asp:Button ID="btnAddTo" runat="server" Text="Add to Appraisal List" Width="150px" CssClass="saveButton" OnClick="btnAddTo_Click" />
            </div>
                             </td></tr>
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
        $("#dateStart").datepicker(
            {
                dateFormat: 'yy/mm/dd',
                showOn: "button",
                buttonImage: "../images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                //minDate: minD,
                //maxDate: maxD,
                val: new Date().toDateString
            });
        $("#dateEnd").datepicker(
              {
                  dateFormat: 'yy/mm/dd',
                  showOn: "button",
                  buttonImage: "../images/calendar.gif",
                  buttonImageOnly: true,
                  changeMonth: true,
                  changeYear: true,
                  //minDate: minD,
                  //maxDate: maxD,
                  val: new Date().toDateString
              });
        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
    });


</script>
