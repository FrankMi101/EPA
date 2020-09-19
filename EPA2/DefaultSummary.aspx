<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultSummary.aspx.cs" Inherits="EPA2.DefaultSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%--    <script src="Scripts/bootstrap.min.js"></script>--%>

    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="Content/BubbleHelp.css" rel="stylesheet" />
    <%--    <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Content/DeviceMedia.css" rel="stylesheet" />


    <style>
        .Centraldiv {
            width: 100%;
            margin: auto;
            border: 0px lightblue outset;
            padding: 5px;
            height: 100%;
        }

        body {
            margin: auto;
            width: 100%;
            height: 100%;
            font-family: sans-serif, Arial;
            margin: -1px;
        }

        .TitleArea {
            width: 100%;
            height: 35px;
            font-style: italic;
            font-weight: 800;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        img {
            margin-bottom: 2px;
        }

        .imgHelp {
            height: 25px;
            width: 25px;
        }

  

        #textHelp {
            margin: 5px;
        }

        #HelpEditDIV {
            border: 2px solid salmon;
            height: 200px;
            width: 300px;
            text-align: center;
            -o-border-top-right-bottom-left-radius: 12px;
            -moz-border-radius-toprightbottonleft: 12px;
            -webkit-border-top-right-bottom-left-radius: 12px;
            border-top-right-radius: 12px;
            border-top-left-radius: 12px;
            border-bottom-right-radius: 12px;
            border-bottom-left-radius: 12px;
        }

        #TitleEditDIV {
            padding-top: 5px;
            border: 3px solid salmon;
            height: 500px;
            width: 600px;
            text-align: center;
            -o-border-top-right-bottom-left-radius: 8px;
            -moz-border-radius-toprightbottonleft: 8px;
            -webkit-border-top-right-bottom-left-radius: 8px;
            border-top-right-radius: 8px;
            border-top-left-radius: 8px;
            border-bottom-right-radius: 8px;
            border-bottom-left-radius: 8px;
        }

        #TextHelpEdit {
            margin: 2px;
        }

        #ButtonHelpSave {
            text-align: center;
        }

        .Title1 {
            color: forestgreen;
        }

        .Title2 {
            font-style: italic;
        }

        .Message {
            color: purple;
            font-weight: 500;
        }

        .AreaSubTitle {
            text-align: center;
            font-size: large;
            font-weight: 300;
            width: 100%;
            background: dodgerblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(dodgerblue, lightblue); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(dodgerblue, lightblue); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(dodgerblue, lightblue); /* For Firefox 3.6 to 15 */
            background: linear-gradient(dodgerblue, lightblue); /* Standard syntax */
        }

        #Iframe1, #Iframe2, #Iframe3, #Iframe4 {
            width: 99%;
            height: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>

        </asp:ScriptManager>

        <asp:HiddenField ID="hfCategory" runat="server" />
        <asp:HiddenField ID="hfPageID" runat="server" />
        <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:HiddenField ID="hfArea" runat="server" />
        <asp:HiddenField ID="hfUserLoginRole" runat="server" />
        <asp:HiddenField ID="hfRunningModel" runat="server" />
        <asp:HiddenField ID="hfCode" runat="server" />
        <asp:HiddenField ID="hfParameters" runat="server" />

        <div class="container visible-xs visible-sm visible-md visible-lg"></div>
        <div class="row" style="width: 100%">


            <div class="col-xs-12 col-sm-6 col-md-4  col-lg-4" style="display: inline; float: left; border: 0px solid lightsalmon; margin: -1px">
                <%--   <div style="display: inline; width: 40%; float: left; border: 0px solid lightsalmon; margin: -1px">--%>
                <div class="AreaSubTitle">Appraisal Summary  </div>

                <div class="Centraldiv">
                    <div class="TitleArea">Current Appraisal Status </div>
                    <div id="CurrentAppraisalStatus">
                        <asp:Label ID="title_EPA11" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <b>
                            <asp:Label ID="LabelRole" runat="server" Text="Application Role"></asp:Label>. </b>
                        <img id="img_11" src="images/help2.png" class="imgHelp" /><a href="#">Application Role  </a>
                        <br />

                        <asp:Label ID="title_EPA12" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <b>
                            <asp:Label ID="LabelAppraisalPhase" runat="server" Text="Appraisal Phase"></asp:Label>. </b>
                        <img id="img_12" src="images/help2.png" class="imgHelp" /><a href="#"> Appraisal Phases  </a>
                        <br />

                        <asp:Label ID="title_EPA13" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <b>
                            <asp:Label ID="LabelAppraisalProcess" runat="server" Text="Appraisal Process Status"></asp:Label>. </b>
                        <img id="img_13" src="images/help2.png" class="imgHelp" /><a href="#">Appraisal Process  </a>
                        <br />
                        <br />
                    </div>
                    <div class="TitleArea">Last Working Items </div>
                    <div id="LastWorkingItem">
                        <asp:Label ID="title_EPA21" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <b>
                            <asp:Label ID="LabelWorkingItem" runat="server" Text="Working Item"></asp:Label>
                            of
                    <asp:Label ID="LabelWorkingUserName" runat="server" Text="Working User Name"></asp:Label>. </b>
                        <img id="img_21" src="images/help2.png" class="imgHelp" /><a id="Link_21" runat="server" href="#"> Continue Working on ...  </a>
                        <br />

                        <asp:Label ID="title_EPA22" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <b>
                            <asp:Label ID="LabelWorkingList" runat="server" Text="Last Working List Item"></asp:Label>
                            of
                    <asp:Label ID="LabelWorkingListArea" runat="server" Text="Working List Area"></asp:Label>. </b>
                        <img id="img_22" src="images/help2.png" class="imgHelp" /> <a id="Link_22" runat="server" href="#"> Continue Working on ...  </a>
                        <br />
                        <br />
                    </div>
                    <div class="TitleArea">Possible Working Items </div>
                    <div id="PossibleGoWorkingItem">
                        <asp:Label ID="title_EPA31" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <img id="img_31" src="images/help2.png" class="imgHelp" />
                        <a href="EPAmanage/Loading.aspx?pID=AppraisalStaffList" target="_self">Select a new teacher from school staff list</a>
                        <br />
                        <asp:Label ID="subtitle_EPA31" runat="server" Text="Label" CssClass="Title2"></asp:Label>
                        <br />
                        <asp:Label ID="title_EPA32" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <img id="img_32" src="images/help2.png" class="imgHelp" />
                        <a href="#">My Appraisal Process</a>
                        <br />

                        <asp:Label ID="title_EPA33" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <img id="img_33" src="images/help2.png" class="imgHelp" />
                        <a href="#">School Level Reports</a>
                        <br />

                        <asp:Label ID="title_EPA34" runat="server" Text="Label" CssClass="Title1"></asp:Label>
                        <img id="img_34" src="images/help2.png" class="imgHelp" />
                        <a href="EPAmanage/Loading.aspx?pID=AppraisalNoticeList" target="_self">School Level Appraisal remaider email List</a>
                        <br />
                        <br />
                    </div>

                    <div class="TitleArea">
                        Application Message 
                <img id="img_91" src="images/help2.png" class="imgHelp" />
                    </div>

                    <div id="BoardStatement" runat="server">

                        <asp:Label ID="LabelBoardStatement" runat="server" Text="Board Message" CssClass="Message"></asp:Label>

                    </div>
                    <div>
                        <asp:Label ID="LabelSchoolStatement" runat="server" Text="School Message" CssClass="Message"></asp:Label>
                    </div>
                </div>

            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="display: inline; float: left; border: 1px solid lightsalmon; margin: 0px">
                <div>
                    <div class="AreaSubTitle">School Appraisal Staff Evaluation year</div>
                    <div>
                        <iframe id="Iframe4" name="Iframe4" frameborder="0" scrolling="auto" src="Loading.aspx?pID=Evaluation" runat="server"></iframe>
                    </div>
                </div>
                <div>
                    <div class="AreaSubTitle">Appraisal Notice Dishboard</div>
                    <div>
                        <iframe id="Iframe2" name="Iframe2" frameborder="0" scrolling="auto" src="Loading.aspx?pID=Notice" runat="server"></iframe>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4" style="display: inline; float: left; border: 0px solid lightsalmon; margin: 0px">

                <div>
                    <div class="AreaSubTitle">Annual Learnnig Plan Dashboard</div>
                    <div>
                        <iframe id="Iframe1" name="Iframe1" frameborder="0" scrolling="auto" src="Loading.aspx?pID=ALP" runat="server"></iframe>
                    </div>

                </div>
                <div>
                    <div class="AreaSubTitle">Appraisal Progress Complete Dishboard</div>
                    <div>
                        <iframe id="Iframe3" name="Iframe3" frameborder="0" scrolling="auto" src="Loading.aspx?pID=EPA" runat="server"></iframe>
                    </div>
                </div>

            </div>
        </div>





        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server" TextMode="MultiLine" contenteditable="true" placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="HelpEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextHelpEdit" runat="server" Width="95%" Height="80%" TextMode="MultiLine" contenteditable="true" spellcheck="true"></asp:TextBox>
            <asp:Button ID="ButtonHelpSave" runat="server" Text="Save" />
        </div>
        <div id="TitleEditDIV" class="bubble epahide">
            <asp:TextBox ID="TextTitleEdit" runat="server" Width="99%" Height="40px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Title"></asp:TextBox>
            <asp:TextBox ID="TextSubTitleEdit" runat="server" Width="99%" Height="80px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Sub Title"></asp:TextBox>
            <asp:TextBox ID="TextHelpEditL" runat="server" Width="99%" Height="320px" TextMode="MultiLine" contenteditable="true" spellcheck="true" placeholder="Help Content"></asp:TextBox>
            <asp:Button ID="ButtonTitleSave" runat="server" Text="Save" />
        </div>

        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%" frameborder="0" scrolling="auto" src="iBlankPage.html" runat="server"></iframe>
        </div>

        <div style="display: none">

            <h2>Default Summary Page will show the usr last working item and prossible go working item based on the user role.</h2>
            <br />
            <h2>Form this Page user can quikly and direct go the working item. This page content is dynomic created</h2>
            <ul>
                <li>Admin working item
                    <ul>
                        <li>Cover all User Feature</li>
                        <li>Board comments bank management</li>
                        <li>Board Goal and strategy management</li>
                        <li>Board TPA report</li>
                        <li>Board PPA Report</li>
                        <li>ONSIS Report</li>
                        <li>System setup</li>
                        <li>Help and Document Upload</li>
                        <li>Feedback management</li>
                    </ul>
                </li>
                <li>Superintendetn wiorking item</li>
                <li>Principal working item
                 <ul>
                     <li>School Staff management</li>
                     <li>School Appraisal Staff List</li>
                     <li>School Appraisal Notice List</li>
                     <li>Individual Appraisal
                           <ul>
                               <li>TPA for the teacher </li>
                               <li>PPA for the Vice Principal</li>
                               <li>Personal PPA AGP appraisal </li>
                           </ul>
                     </li>
                     <li>School Comments Bank management</li>
                     <li>Personal Comments Bank manaement</li>
                     <li>School TPA Appraisal report</li>
                     <li>School PPA Appraisal Report</li>
                 </ul>

                </li>

                <li>Vice Principal working item
                     <ul>
                         <li>School Staff management</li>
                         <li>School Appraisal Staff List</li>
                         <li>School Appraisal Notice List</li>
                         <li>Individual Appraisal
                           <ul>
                               <li>TPA for the teacher </li>
                               <li>Personal PPA AGP appraisal </li>
                           </ul>
                         </li>
                         <li>Personal Comments Bank manaement</li>
                         <li>School Appraisal report</li>

                     </ul>

                </li>

                <li>Teacher working item
                    <ul>
                        <li>Personal TPA ALP </li>
                        <li>Appraisal Review Signed off</li>
                        <li>Personal Appraisal Histroy</li>
                    </ul>
                </li>
            </ul>
        </div>

    </form>
</body>
</html>

<script src="Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script type="text/javascript">

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeid;
    var sessionid;
    var phase;
    var category;
    $(document).ready(function () {
        //var vHeight = screen.height - 260;// window.screenY
        //var vWidth = screen.width;
        //$("body").css({
        //    height: vHeight,
        //    width: vWidth
        //})

        $(".imgHelp1").mouseenter(function (event) {

            //ItemCode = $(this)[0].id.replace("img_", "");
            //***************  Web service Call ******************************************************
            var helptext = EPA2.Models.WebService1.GetHelpContent("Read", UserID, CategoryID, AreaID, ItemCode, "Help", onSuccess, onFailure);
            var vTop = event.currentTarget.offsetTop;
            var vLeft = event.currentTarget.offsetLeft;
            var sHeight = window.innerHeight;
            var xPosition = 300;
            var yPosition = 100;
            if (vLeft - xPosition < 0)
            { xPosition = vLeft; }
            if (screen.width < 480) {
                yPosition = 10;
                xPosition = 5;
            }
            else {
                if (vTop + yPosition > sHeight) {
                    yPosition = vTop - yPosition - 20;
                }
            }

            $("#HelpDIV").css({
                top: vTop + yPosition,
                left: vLeft - xPosition + 5,
            })
            $("#HelpDIV").fadeToggle("fast");
        });

        $(".imgHelp1").mouseleave(function (event) {
            if ($("#HelpDIV").css('display') === "block") {
                $("#HelpDIV").fadeToggle("fast");
            }
        });

        $(".Title1").dblclick(function (event) {
            ItemCode = $(this)[0].id.replace("title_", "");
            //            EditPageItemTitle();
            if ($("#hfUserLoginRole").val() === "Admin") {
                EditPageItemTitle2();

            }

        });


        function onFailure(result) {
            window.alert(result);
        }
        function onSuccess(result) {
            $("#textHelp").text(result);
        }
        function onSuccess2(result) {
            $("#TextHelpEdit").text(result);
        }
        function onSuccess21(result) {
            $("#TextHelpEditL").val(result);
        }
        function onSuccess22(result) {
            $("#TextTitleEdit").val(result);
        }
        function onSuccess23(result) {
            $("#TextSubTitleEdit").val(result);
        }
        function onSuccess3(result) {
            window.alert("Help Content Save " + result);
        }
        function onSuccess4(result) { }

        $("#ButtonHelpSave").click(function (event) {
            var value = $("#TextHelpEdit").val();
            var helptext = EPA2.Models.WebService1.SaveHelpContent("Save", UserID, CategoryID, AreaID, ItemCode, value, onSuccess3, onFailure);
            $("#HelpEditDIV").fadeToggle("fast");
        });

        $("#ButtonTitleSave").click(function (event) {
            var value = $("#TextHelpEditL").val();
            var helptext = EPA2.Models.WebService1.SaveHelpContent("Save", UserID, CategoryID, AreaID, ItemCode, value, onSuccess4, onFailure);
            var title = $("#TextTitleEdit").val();
            var subTitle = $("#TextSubTitleEdit").val();
            var titletext = EPA2.Models.WebService1.SaveTitleContent("Save", UserID, CategoryID, AreaID, ItemCode, title, subTitle, onSuccess3, onFailure);
            $("#TitleEditDIV").fadeToggle("fast");
        });

    });
    $("#closeActionPOP").click(function (event) {
        $("#ActionPOPDIV").fadeToggle("fast");
    });

    function EditPageItemTitle2() {
        if ($("#hfRunningModel").val() === "Design") {
            if ($("#ActionPOPDIV").css('display') === "block")             //TitleEditDIV
            {
                $("#ActionPOPDIV").fadeToggle("fast");
            }
            else {
                var pTitle = "Title and Help Conetent Edit";
                $("#ActioniFramePage").css({
                    height: 490
                })
                goPage = "EPAappraisal/Loading3.aspx?pID=HelpContent" + "&type=" + CategoryID + "&aID=" + AreaID + "&iCode=" + ItemCode;
                $("#ActioniFramePage").attr('src', goPage);
                $("#ActionTitle").html(pTitle);
                $("#ActionPOPDIV").css({
                    top: 50,
                    left: 5,
                    height: 520,
                    width: 700
                })
                $("#ActionPOPDIV").fadeToggle("fast");
            }
        }
    }
    function OpenALPTop(employeeID, schoolYear, schoolCode, apprType, apprPhase, teacherName,apprarea,itemCode) {
        teachername = teacherName;
        schoolyear = schoolYear;
        schoolcode = schoolCode;
        employeeid = employeeID;
        category = apprType;
        phase = apprPhase;
        var goPage = "EPAappraisal/Loading.aspx?pID=Appraisal"; //&yID=" + schoolYear + "&dID=" + schoolCode + "&eID=" + employeeID + "&phase=" + apprPhase;
        var vHeight = screen.height - 210;
        var vWidth = screen.width - 25;// - 500;
        var pTitle = "Appraisal Annual Learnning Plan";
        openEditPage2(vHeight, vWidth, goPage, pTitle);
    }
    function OpenAppraisalTop(employeeID, schoolYear, schoolCode, apprType, apprPhase, teacherName, apprarea, itemCode) {
        teachername = teacherName;
        schoolyear = schoolYear;
        schoolcode = schoolCode;
        employeeid = employeeID;
        category = apprType;
        phase = apprPhase;
        var goPage = "EPAappraisal/Loading.aspx?pID=Appraisal"; //&yID=" + schoolYear + "&dID=" + schoolCode + "&eID=" + employeeID + "&phase=" + apprPhase;
        var vHeight = screen.height - 210;
        var vWidth = screen.width - 25;// - 500;
        var pTitle = "Appraisal";
        openEditPage2(vHeight, vWidth, goPage, pTitle);
    }

</script>
