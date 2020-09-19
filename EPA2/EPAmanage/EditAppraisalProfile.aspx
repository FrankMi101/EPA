<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditAppraisalProfile.aspx.cs" Inherits="EPA2.EPAmanage.EditAppraisalProfile" %>

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
            width: 190px;
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
                    <td style="width: 18%">User ID</td>
                    <td style="width: 32%"> 
                        <asp:TextBox ID="TextUserID" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></td>
                    <td style="width: 18%">Employee ID</td>
                    <td style="width: 32%">
                        <asp:TextBox ID="TextEmployeeID" runat="server" CssClass="ReadonlyItem"> </asp:TextBox></td>
                </tr>

                <tr>
                    <td>Appraisal Status</td>
                    <td>
                        <asp:DropDownList ID="ddlApprStatus" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>Appraisal type</td>
                    <td>
                        <asp:DropDownList ID="ddlApprType" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Appraisal Cycle</td>
                    <td>
                        <asp:DropDownList ID="ddlApprCycle" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>Appraisal Role</td>
                    <td>
                        <asp:DropDownList ID="ddlApprRole" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Appraiser</td>
                    <td>
                        <asp:DropDownList ID="ddlAppraiser" runat="server" CssClass="EditItem" Enabled="false"></asp:DropDownList></td>
                    <td>Mentor</td>
                    <td>
                        <asp:DropDownList ID="ddlMentor" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Evidence Level</td>
                    <td>
                        <asp:DropDownList ID="ddlEvidenceLevel" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                    <td>TimeType</td>
                    <td>
                        <asp:DropDownList ID="ddlTimeType" runat="server" CssClass="EditItem"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Start Date:</td>
                    <td>
                        <input runat="server" type="text" id="DateStart" name="DateStart" size="9" />

                    </td>
                    <td>End date:</td>
                    <td>
                        <input runat="server" type="text" id="DateEnd" name="DateEnd" size="9" />

                    </td>
                </tr>

                <tr>
                    <td>Appraisal School</td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddlSchoolCode" runat="server" CssClass="EditItem" Width="80px"></asp:DropDownList>
                        <asp:DropDownList ID="ddlSchoolName" runat="server" CssClass="EditItem" Width="430px"></asp:DropDownList>
                    </td>

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
            </table>

            <div style="text-align: center">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />

                <asp:Button ID="btnRemove" runat="server" Text="Remove from Appraisal Lsit" Width="200px" CssClass="saveButton" OnClick="BtnRemove_Click" />
               <asp:Button ID="btnCopy" runat="server" Text="Copy to New Phase or School" Width="200px" CssClass="saveButton" OnClick="BtnCopy_Click" />

            </div>
            <div style =" color:darkred">
                <asp:Label ID="LabelForAppraisee" runat="server" Visible="false" Text="* Change school or phase and then click on the Copy to New button. Will creat new appraisal record for appraisee in new school or new phase. "></asp:Label>
                 <asp:Label ID="LabelForAppraiser" runat="server" Visible ="false" Text="* Change school and then click on the Working for Multiple School button. Will add this principal to a new new school."></asp:Label>
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
