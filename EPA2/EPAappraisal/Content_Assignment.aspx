<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_Assignment.aspx.cs" Inherits="EPA2.EPAappraisal.ContentAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
 
    <style type="text/css">
        body {
            height: 99%;
            width: 99%;
            margin: auto;
        }

        div {
            font-family: Arial;
            font-size: small;
        }

         

        .highlightBoard {
            border: 1px blue solid;
        }

        .defaultBoard {
            border: 1px blue none;
        }


        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey {
            display: none;
            width: 0px;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
        </asp:ScriptManager>
        <div>
            <table>
                <tr>
                    <td style="width:30%">School Year:</td>
                    <td style="width:70%">
                        <asp:Label ID="Labelschoolyear" runat="server" Text="School Year: "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>School:</td>
                    <td>
                        <asp:Label ID="Labelschool" runat="server" Text="School "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>Assignment:</td>
                    <td>
                        <asp:TextBox ID="TextAssignment" runat="server" Text="Assignment" Width="300px" Height="100px" TextMode="MultiLine" > </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" />
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
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/GridView.js"></script>
<script type="text/javascript">
    var IE = document.all ? true : false
    document.onmousemove = getMousepoints;
    var mousex = 0;
    var mousey = 0;
    function getMousepoints() {
        mousex = event.clientX + document.body.scrollLeft;
        mousey = event.clientY + document.body.scrollTop;
        return true;
    }
</script>
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
    function pageLoad(sender, args) {

        $(document).ready(function () {
            MakeStaticHeader("GridView1", 350, 600, 22, false);

            $('td.myAction').click(function (event) {
                try {   // rowNo = $(this).closest('tr').find('td.myRowNo').text();
                    var recoveryComment = $(this).closest('tr').find('td.myComment').text();
                    // var workingText = $("#myText", parent.document).val();
                    var workingCell = $("#hfWorkingCell", parent.document).val();
                    if (workingCell == undefined)
                    { workingCell = "myText"; }
                    $("#" + workingCell, parent.document).val(recoveryComment);
                    //  $("#" + workingCell, parent.document).triggerHandler("change");
                    $("#hfContentChange", parent.document).val("1");
                    parent.updateTextCellAfterContentAction();
                }
                catch (e) {
                }

            });

            $('#GridView1 tr').mouseenter(function (event) {
                newRowNo = $(this).closest('tr').find('td.myRowNo').text();
                if (currentTR != undefined)
                { currentTR.removeClass("highlightBoard"); }
                currentTR = $(this);
                currentTR.addClass("highlightBoard");
            });
        });

    }

    function IECompatibility() {
        var agentStr = navigator.userAgent;
        this.IsIE = false;
        this.IsOn = undefined;  //defined only if IE
        this.Version = undefined;
        this.Compatible = undefined;

        if (agentStr.indexOf("compatible") > -1) {
            this.IsIE = true;
            this.IsOn = true;
            this.Compatible = true;
        }
        else {
            this.Compatible = false;
        }

    }

</script>
