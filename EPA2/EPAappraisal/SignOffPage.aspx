<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignOffPage.aspx.cs" Inherits="EPA2.EPAappraisal.SignOffPage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />

    <style>
        header {
            display: none;
        }

        #TextBoxDate {
            display: none;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelMessage {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .AppraisaleeSignOff {
            text-align: center;
            vertical-align: middle;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-weight: 700;
            font-size: 1em;
        }

        #SignatureDIV {
            border: 2px solid lightsalmon;
            height: 250px;
            width: 400px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .disableMe {
        }
        .imgSetup
        { width:21px;
          height:21px;
          margin-bottom:-3px;
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
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgSignoff" visible="false" runat="server" id="imgSignOff" src="../images/signature.png" title="Sign Off Completed" />
                    <img class="imgSetup" src="../images/setup.png" title="Set up personal Notification perference" />

                </div>

            </div>
            <div class="AppraisaleeSignOff">
                &nbsp;
                <br />
                &nbsp;
              &nbsp; 
                <br />
                &nbsp; 
                <br />
                <table style="width: 700px">
                    <tr id="ExtContentRow" runat="server">
                        <td colspan="4" style="text-align: left;">
                            <asp:Label ID="labelTitleX" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                            <input runat="server" type="text" id="MyDate" name="MyDate" size="9" onchange="MyDateChange();" />
                            <asp:RadioButtonList ID="btnYesNo" runat="server" RepeatDirection="Horizontal" Width="200px" Enabled="false" OnSelectedIndexChanged="btnYesNo_SelectedIndexChange">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hfDigtialSignatureAppraisee" runat="server" />
                            <asp:HiddenField ID="hfSignOffAppraisee" runat="server" />
                            <asp:HiddenField ID="hfNoticeAppraisee" runat="server" />
                        </td>

                        <td>
                            <asp:TextBox ID="TextSignOffNameAppraisee" runat="server" Width="250px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextSignOffDateAppraisee" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <img class="imgSignoff" runat="server" id="imgsignoffAppraisee" src="../images/signature.png" title="Sign Off Signature" /></td>
                        <td>
                            <img class="imgNotice" runat="server" id="imgNoticeAppraisee" src="../images/email.png" title="Email Notification" height="30" width="35" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td>
                            <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td colspan="5">
                            <asp:Label ID="labelMessage1" runat="server" CssClass="labelMessage">Text Box message </asp:Label></td>
                    </tr>
                    <tr id="urlDemandAppraiseeRow" runat="server">
                        <td colspan="5"><a runat="server" class="DemandUndoSignOff" id="urlDemandUndoSignOffAppraisee" href="#" title="click this link to response your appraiser demand undo sign off. ">Your Appraiser asks for Undo Sign Off  </a></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField ID="hfDigtialSignatureAppraiser" runat="server" />
                            <asp:HiddenField ID="hfSignOffAppraiser" runat="server" />
                            <asp:HiddenField ID="hfNoticeAppraiser" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextSignOffNameAppraiser" runat="server" Width="250px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextSignOffDateAppraiser" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <img class="imgSignoff" runat="server" id="imgsignoffAppraiser" src="../images/signature.png" title="Sign Off Signature" /></td>
                        <td>
                            <img class="imgNotice" runat="server" id="imgNoticeAppraiser" src="../images/email.png" title="Email Notification" height="30" width="35" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td>
                            <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:Label ID="labelMessage3" runat="server" CssClass="labelMessage">Text Box message </asp:Label></td>
                    </tr>
                    <tr id="urlDemandAppraiserRow" runat="server">
                        <td colspan="5"><a runat="server" class="DemandUndoSignOff" id="urlDemandUndoSignOffAppraiser" href="#" title="click this link to response your appraisee demand undo sign off. ">Your Appraisee asks for Undo Sign Off  </a></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr />

                        </td>
                    </tr>
                    <tr id="ExtContentRow2" runat="server">
                        <td>
                            <asp:HiddenField ID="hfDigtialSignatureSupervisory" runat="server" />
                            <asp:HiddenField ID="hfSignOffSupervisory" runat="server" />
                            <asp:HiddenField ID="hfNoticeSupervisory" runat="server" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextSignOffNameSupervisory" runat="server" Width="250px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="TextSignOffDateSupervisory" runat="server" Width="150px" ReadOnly="true"></asp:TextBox></td>
                        <td>
                            <img class="imgSignoff" runat="server" id="imgsignoffSupervisory" src="../images/signature.png" title="Sign Off Signature" /></td>
                        <td>
                            <img class="imgNotice" runat="server" id="imgNoticeSupervisory" src="../images/email.png" title="Email Notification" height="30" width="35" /></td>
                    </tr>
                    <tr id="ExtContentRow3" runat="server">
                        <td></td>
                        <td>
                            <asp:Label ID="labelTitle5" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td>
                            <asp:Label ID="labelTitle6" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr id="ExtContentRow4" runat="server">
                        <td colspan="5">
                            <asp:Label ID="labelMessage5" runat="server" CssClass="labelMessage">Text Box message </asp:Label></td>
                    </tr>
                    <tr id="ExtContentRow5" runat="server">
                        <td colspan="5">
                            <asp:CheckBox ID="CheckBoxEnforce" runat="server" ForeColor="Red" Text="Supervisory Enforce Sign Off" />
                            <hr />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: left; font-style: italic; color: orangered">

                            <asp:RadioButtonList ID="rblViewPermission" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblViewPermission_SelectedIndexChanged">
                                <asp:ListItem Value="NotAllow" Selected="true">Not Allow Appraisee to View Appraisal Content by Default</asp:ListItem>
                                <asp:ListItem Value="Allow">Allow Appraisee View Only</asp:ListItem>
                                <asp:ListItem Value="SignOff">Allow Appraisee View and Sign off</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:HiddenField ID="hfNoticePermission" runat="server" />
                            <img height="30" width="35" class="imgNotice" runat="server" id="imgNoticePermission" src="../images/email.png" title="Email Notification" /></td>
                    </tr>
                </table>



            </div>



        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 95%"></div>
                <div style="display: inline; width: 5%; float: right;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>

        <div id="SignatureDIV" class="bubble epahide">
            <table style="width: 300px; text-align: center; margin: auto">

                <tr>
                    <td colspan="3">
                        <h4>
                            <asp:Label ID="LabelSignOffTitle" runat="server" Text="Sign Off - Verify User"></asp:Label>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td>Domain:</td>
                    <td>
                        <asp:TextBox ID="txtDomain" runat="server" Width="120px" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>User ID :</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" Width="120px" Text="mif" ReadOnly="true" /></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" Width="120px"
                            runat="server" />
                    </td>
                    <td></td>

                </tr>
                <tr>
                    <td></td>
                    <td>

                        <asp:Button ID="btnVerifyUser" Text="Log On" Width="100px"
                            runat="server" />
                    </td>
                    <td>
                        <asp:HiddenField ID="hfDigitalSignatureReady" runat="server" Value="No" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Label ID="errorlabel" ForeColor="red" runat="server" Text="" />

                        <div style="text-align: left; display: none;" id="SignOffDIV">
                            Date:
                            <asp:Label ID="LabelSginOffDate" runat="server" Text="Sign off Date" />
                            <br />
                            Name:  
                            <asp:Label ID="LabelSignOffName" runat="server" Text="Sign off Name" />
                            <br />
                            <asp:Button ID="btnSignOff" OnClick="SignOff_Click" Text="Sign Off" Width="200px" runat="server" />
                            <br />
                            <asp:CheckBox ID="chbCreateDS" runat="server" Checked="true" Text="Must Create Digital Signature at first time running feature" ForeColor="red" Enabled="false" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>



        <div>
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserRole" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="5000" />
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentdatetime" runat="server" Value="" />
            <asp:HiddenField ID="hfCurrentUserName" runat="server" Value="" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />
            <asp:HiddenField ID="hfAppraiserID" runat="server" />
            <asp:HiddenField ID="hfSignOffAction" runat="server" />
            <asp:HiddenField ID="hfNoticeAction" runat="server" />
            <asp:HiddenField ID="hfSignOffComplete" runat="server" />
            <asp:HiddenField ID="hfNoticeAuto" runat="server" />


            <asp:HiddenField ID="hfPageReadonly" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>

<%--<script>
    function CallShowMessage(action, result)
    {
        window.alert( action + result);
    }
</script>--%>
<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var SignOffWho;
    var SignOffImg;
    function pageLoad(sender, args) {

        $(document).ready(function () {
            $("#MyDate").datepicker(
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

            var vHeight = window.innerHeight - apprScreenH;
            $("section").css("height", vHeight)
            Highlight_LeftMenuSelectNode();
            if ($("#hfPageReadonly").val() == "Yes") {
                DisableTextEdit();
            }

            $("#closeActionPOP").click(function (event) {
                $("#ActionPOPDIV").fadeToggle("fast");
            });


            //$('#myText').bind('paste', function (event) {
            //    alert('pasting!')
            //    $("#hfContentChange").val("1");
            //});
            $(".labelTitle").dblclick(function (event) {
                ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
                EditPageItemTitle();
            });
            $(".labelTitleX").dblclick(function (event) {
                ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
                EditPageItemTitle();
            });
            $(".labelMessage").dblclick(function (event) {
                ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelMessage", "");
                EditPageItemTitle();
            });
            $(".imgSetup").click(function (event) {
                try {                    
                    $("#ActionTitle").text("Set up personal notification perference");  
                       var action = "NoticeSetup";
                            var vTop = event.currentTarget.offsetTop;
                            var vLeft = event.currentTarget.offsetLeft;
                            var goPage = "ActionNotificationPerference.aspx?aRole=" + SignOffWho + "&action=" + action + "&category=" + CategoryID + "&areaID=" + AreaID + "&itemCode=" + ItemCode;
                            $("#ActioniFramePage").attr('src', goPage);
                            $("#ActionPOPDIV").css({
                                top: vTop + 50,
                                left: 10,
                                height: 500,
                                width: 700
                            })
                            $("#ActionPOPDIV").fadeToggle("fast");                
                } catch (ex)
                { window.alert("Notice failed."); }
            });

            $(".imgSignoff").click(function (event) {
                try {
                    SignOffWho = $(this)[0].id.replace("imgsignoff", "");
                    if (openSignature(SignOffWho) == "Y") {
                        if ($("#hfSignOffComplete").val() == "Complete") {
                            window.alert("Sign Off Process has been completed. \n\n If you need to change appraisal content, please request both Appraisee and Appraiser undo sign off!");
                            $("#LabelSignOffTitle").text("Demand Undo Sign Off  - Verify User");
                            $("#btnSignOff").val("Demand Undo Sign Off");
                            $("hfSignOffAction").val("Demand Undo Sign Off");
                        }
                        else {
                            ItemCode = $("#hfCode").val();// + $(this)[0].id.replace("imgsignoff", "");
                            SignOffImg = $(this)[0].id;

                        }
                        var vTop = event.currentTarget.offsetTop;
                        var vLeft = event.currentTarget.offsetLeft;
                        $("#SignatureDIV").css({
                            top: vTop + 50,
                            left: 50
                        })

                        $("#SignatureDIV").fadeToggle("fast");


                    }
                } catch (ex)
                { window.alert("Notice failed."); }

            });
            $(".DemandUndoSignOff").click(function (event) {
                try {
                    SignOffWho = $(this)[0].id.replace("urlDemandUndoSignOff", "");
                    if (openSignature(SignOffWho) == "Y") {
                        if ($("#hfSignOffComplete").val() == "Complete") {
                            $("#LabelSignOffTitle").text("Authorize to Undo Sign Off  - Verify User");
                            $("#btnSignOff").val("Authorize Undo Sign Off");
                            $("hfSignOffAction").val("Authorize Undo Sign Off");
                        }
                        else {
                            ItemCode = $("#hfCode").val();//+ $(this)[0].id.replace("urlDemandUndoSignOff", "");
                            SignOffImg = $(this)[0].id;

                        }
                        var vTop = event.currentTarget.offsetTop;
                        var vLeft = event.currentTarget.offsetLeft;
                        $("#SignatureDIV").css({
                            top: vTop + 50,
                            left: 50
                        })

                        $("#SignatureDIV").fadeToggle("fast");


                    }
                } catch (ex)
                { window.alert("Notice failed."); }

            });
            $(".imgNotice").click(function (event) {
                try {
                    SignOffWho = $(this)[0].id.replace("imgNotice", "");
                    $("#ActionTitle").text("Signature Email Notification");
                    // ItemCode = $("#hfCode").val() + $(this)[0].id.replace("imgsignoff", "");
                    var allowVal = $("input[name='rblViewPermission']:checked").val();
                    if (openNotice(SignOffWho) == "Y") {
                        var signoffDate = getSignOffDate($(this)[0].id);
                        if (signoffDate == "" && $("#hfNoticeAction").val() == "Sign Off") {
                            window.alert("Please Signature First!");
                        }
                        else {
                            SignOffImg = $(this)[0].id;
                            var action = "SignOff";
                            if ($("#hfNoticeAction").val() == "Undo Sign Off") {
                                action = "UndoSignOff";
                            }
                            if ($("#hfNoticeAction").val() == "Demand Undo Sign Off") {
                                action = "DemandUndoSignOff";
                            }
                            if ($("#hfNoticeAction").val() == "Authorize Undo Sign Off") {
                                action = "AuthorizeUndoSignOff";
                            }
                            if (SignOffImg == "imgNoticePermission")
                            { action = "AppraisalAction"; }
                            var vTop = event.currentTarget.offsetTop;
                            var vLeft = event.currentTarget.offsetLeft;
                            var goPage = "ActionNotification.aspx?aRole=" + SignOffWho + "&action=" + action + "&category=" + CategoryID + "&areaID=" + AreaID + "&itemCode=" + ItemCode + "&permission=" + allowVal + "&signOffDate=" + signoffDate;
                            $("#ActioniFramePage").attr('src', goPage);

                            $("#ActionPOPDIV").css({
                                top: vTop + 50,
                                left: 10,
                                height: 400,
                                width: 600
                            })
                            $("#ActionPOPDIV").fadeToggle("fast");
                        }
                    }
                } catch (ex)
                { window.alert("Notice failed."); }
            });

            $("#btnVerifyUser").click(function (event) {
                var domain = $("#txtDomain").val();
                var userid = $("#txtUserName").val();
                var password = $("#txtPassword").val();
                var check = EPA2.Models.WebService1.VerifyUser("Check", domain, userid, password, onSuccess0, onFailure0);
                return false;
            });
            $("#btnSignOff").click(function (event) {
                try {
                    SignOffImg = $(this)[0].id;
                    $("#SignatureDIV").fadeToggle("fast");
                    if ($("#btnSignOff")[0].value == "Undo Sign Off") {
                        $("#" + SignOffImg)[0].src = "../images/signature.png";
                        if (SignOffWho == "Appraisee") {
                            $("#TextSignOffNameAppraisee").val("");
                            $("#TextSignOffDateAppraisee").val("");
                        }
                        if (SignOffWho == "Appraiser") {
                            $("#TextSignOffNameAppraiser").val("");
                            $("#TextSignOffDateAppraiser").val("");
                        }
                        if (SignOffWho == "Supervisory") {
                            $("#TextSignOffNameSupervisory").val("");
                            $("#TextSignOffDateSupervisory").val("");
                        }
                    }
                    else {
                        $("#" + SignOffImg)[0].src = "../images/signatureDone.png";
                        if (SignOffWho == "Appraisee") {
                            $("#TextSignOffNameAppraisee").val($("#hfCurrentUserName").val());
                            $("#TextSignOffDateAppraisee").val($("#hfCurrentdatetime").val());
                        }
                        if (SignOffWho == "Appraiser") {
                            $("#TextSignOffNameAppraiser").val($("#hfCurrentUserName").val());
                            $("#TextSignOffDateAppraiser").val($("#hfCurrentdatetime").val());
                        }
                        if (SignOffWho == "Supervisory") {
                            $("#TextSignOffNameSupervisory").val($("#hfCurrentUserName").val());
                            $("#TextSignOffDateSupervisory").val($("#hfCurrentdatetime").val());
                        }
                    }
                }
                catch (ex)
                { window.alert("Sign off failed."); }
            });
        });

    }
    function openSignature(imgclickWho) {
        var openSginature = "N";
        var actionRole = $("#hfAppraisalActionRole").val();
        var userRole = $("#hfUserRole").val();
        var signature = $("#TextSignOffName" + imgclickWho).val();

        switch (imgclickWho) {
            case "Appraisee":
                if (actionRole == "Appraisee") {
                    var allowVal = $("input[name='rblViewPermission']:checked").val();
                    if (allowVal == "SignOff") {
                        openSginature = "Y";
                    }
                }
                break;
            case "Permission":
            case "Appraiser":
                if (actionRole == "Appraiser") {
                    if ($("#hfAppraiserID").val() == $("#hfUserID").val()) {
                        openSginature = "Y";
                    }
                    else {
                        if ($("#hfUserLoginRole").val() == "Admin")
                        { openSginature = "Y"; }
                    }
                }
                break;
            case "Supervisory":
                if (actionRole == "Supervisory") {
                    openSginature = "Y";
                }
                break;
            default:
                openSginature = "N";
                break;
        }

        return openSginature;
    }
    function openNotice(imgclickWho) {
        var openNotice = "N";
        var actionRole = $("#hfAppraisalActionRole").val();
        var userRole = $("#hfUserRole").val();
        var signature = $("#TextSignOffName" + imgclickWho).val();

        switch (imgclickWho) {
            case "Appraisee":
                if (actionRole == "Appraisee") {
                    openNotice = "Y";
                }
                break;
            case "Permission":
                if (actionRole == "Appraiser") {
                    openNotice = "Y";
                }
                break;
            case "Appraiser":
                if (actionRole == "Appraiser") {
                    openNotice = "Y";
                }
                break;
            case "Supervisory":
                if (actionRole == "Supervisory") {
                    openNotice = "Y";
                }
                break;
            default:
                openNotice = "N";
                break;
        }

        return openNotice;
    }

    function getSignOffDate(eventID) {
        var rVal = "";
        var objDateID = eventID.replace("imgNotice", "TextSignOffDate")
        rVal = $("#" + objDateID).val();
        return rVal;
    }
    function onFailure0(result) {
        $("#errorlabel").val("Verify failed!");
        window.alert(result);
    }
    function onSuccess0(result) {
        if (result == "Pass") {
            $("#LabelSginOffDate").text($("#hfCurrentdatetime").val());
            $("#LabelSignOffName").text($("#hfCurrentUserName").val());

            $('#SignOffDIV').show();  //   .fadeToggle("fast");
            //   $("#SignOffDIV").css("display", "none");
            //   $("#SignOffDIV").css("display", "block");

        }
        else {
            $("#errorlabel").val("Verify failed!");
        }
    }


    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }
    function MyDateChange() {
        var dateval = $("#MyDate").val();
        var val = EPA2.Models.WebService1.SaveAppraisalNotes("Date", UserID, CategoryID, AreaID, ItemCode, dateval, onSuccessD, onFailure0);

    }
    function onSuccessD(result) {
        alert(result);
    }

</script>
