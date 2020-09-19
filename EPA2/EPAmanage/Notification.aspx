<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="EPA2.EPAmanage.Notification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Forms Authentication - Login</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<%--    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />--%>
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />
    <style>
        html, body {
            width: 99.5%;
            height: 99.5%;
            margin: auto;
        }

        .appheader {
            margin: auto;
            height: 80px;
            width: 100%;
            display: block;
            float: left;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

        .TopMessagebar {
            height: 30px;
            width: 100%;
            border-bottom: 2px solid lightsalmon;
            /*background-image: url(images/menubar.png);*/
            display: block;
            float: left;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        .topMessage {
            background-color: transparent;
            color: yellow;
            font-weight: 500;
        }

        .EditItem {
            width: 100%;
            background-color: cornsilk;
        }


        .EditPage {
            width: 100%;
            height: 100%;
            margin: auto;
            border: 0px lightblue outset;
            padding: 1px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }



        #LabelAppraisalTitle {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-weight: 800;
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
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form2" runat="server">


        <div class="contentPart">
            <table style="width: 99.5%">
                <tr>
                    <td>Notice Type</td>
                    <td colspan="3">

                        <asp:RadioButtonList ID="rblNoticeType" runat="server" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="rblNoticeType_SelectedIndexChanged">
                            <asp:ListItem  Value="ALP" Selected="true" >Annual Learning Plan</asp:ListItem>
                            <asp:ListItem  Value="EPA">Performance Appraisal</asp:ListItem>
                            <asp:ListItem  Value="OBS">Classroom Observation</asp:ListItem>
                        </asp:RadioButtonList></td>

                </tr>
                <tr>
                    <td style="width: 16%">Appraisal Year:</td>
                    <td style="width: 20%">
                        <asp:TextBox ID="TextAppraisalYear" CssClass="EditItem" Enabled="false" runat="server"></asp:TextBox></td>
                    <td style="width: 22%; text-align:right">Appraisal Session:</td>
                    <td style="width: 42%">
                        <asp:TextBox ID="TextAppraisalSession" CssClass="EditItem" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Current Status:</td>
                    <td>
                        <asp:TextBox ID="TextCurrentCycle" CssClass="EditItem" runat="server" Enabled="false"></asp:TextBox></td>
                    <td style="text-align:right" >   

                                    <asp:Label ID="LableDeadLine" runat="server" Text="Due Date:"></asp:Label>
                    </td>
                    <td> <input runat="server" type="text" id="DeadLineDate" name="DeadLineDate" class="ObservationDate" size="9" />
                        </td>
                </tr>
                 
                <tr>
                    <td>Notice Subject:</td> <td colspan="3">
                                      <asp:TextBox ID="TextSubject" CssClass="EditItem" runat="server"></asp:TextBox>
                              </td>
                </tr>
                <tr>
                    <td>Notice Comments</td>
                    <td colspan="3">
                        <asp:TextBox ID="myText" runat="server" CssClass="EditItem" Height="200px" MaxLength="1000" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <asp:Button ID="btnSend" runat="server" Text="Send" Width="80px" CssClass="saveButton" OnClick="btnSend_Click" />
                        <asp:CheckBox ID="chbICalendar" runat="server" Text="Add meeting in Calendar" Visible="false" />
                        <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Last Notice" Width="160px" CssClass="saveButton" OnClick="btnRetrieve_Click" />
                         <asp:Button ID="btnAppointment" runat="server" Text="Add meeting Request in Calendar" Width="200px" CssClass="saveButton" OnClick="btnAppointment_Click" Visible="false" />
                     </td>
                </tr>
            </table>

        </div>

        <%--<div id="PopUpDIV" class="bubble epahide"></div>
        <div id="EditDIV" runat="server" class="bubble epahide">
            <iframe class="EditPage" id="editiFrame" name="editiFrame" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>--%>


        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="txtResolution" runat="server" />

            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfApprName" runat="server" />
            <asp:HiddenField ID="hfWebSite" runat="server" />
         
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>

<script>

    $(document).ready(function () {

        $("#DeadLineDate").datepicker(
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

        
        $("#DeadLineDate").change(function (event) {
            try
            {
                var deadline = $("#DeadLineDate").val();
                var myText = $("#myText").val();
                myText = myText.replace("{{PlaceHolder:DeadLineDate}}", deadline);
              //  myText = myText.replace("{{PlaceHolder: WebSite}}", $("#hfWebSite").val());
                $("#myText").val(myText);
            }
            catch(e)   
            {
            }
        });
        

        
    });



</script>
