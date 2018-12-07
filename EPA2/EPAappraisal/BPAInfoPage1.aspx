<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="BPAInfoPage1.aspx.cs" Inherits="EPA2.EPAappraisal.BPAInfoPage1" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JqueryUI/jquery-ui.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <%--    <link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="../Content/DeviceMedia.css" rel="stylesheet" />


    <style>
        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelTitleX {
            font-family: Arial, sans-serif;
            font-size: 1.2em;
        }

        .labelContentX {
            font-family: Arial, sans-serif;
            font-size: 1.0em;
            width: 200px;
            height:40px;
            color: darkblue;
            border-bottom:1px solid black;
        }

        .labelSubTitle {
            font-style: italic;
            font-family: Arial, sans-serif;
            color: #75ab75;
        }

        .ContentSubTitle, .ContentMessage {
            display: none;
        }

        #RubricTable td {
            width: 33.33%;
        }

        .ContentRubric, .ContentCompetency {
            width: 100%;
        }

        #ContentCompetency, #ContentCompetency li {
            margin-left: -20px;
        }

            #ContentCompetency a {
                text-decoration: none;
                color: black;
            }

                #ContentCompetency a:hover {
                    text-decoration: underline;
                    color: purple;
                }

                #ContentCompetency a:visited {
                    color: forestgreen;
                }

        #btnCompetency {
            display: none;
        }

        .WorkingItem {
            color: blue !important;
            font-weight: 600;
            height: 25px;
        }

        .ContentTitleLeft {
            float: left;
            display: block;
            width: 100%;
        }

        .myDomain, .myCompetency {
            display: none;
        }

        .myCommentsText {
            background-color: transparent;
            border: 0;
        }

        body {
            width: 99%;
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

        <header style="display: none">
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div class="ContentTitle">
                <div id="ContentTitleLeft" class="ContentTitleLeft">
                    <asp:Label ID="labelTitle" runat="server" CssClass="labelTitle">Text Box Title</asp:Label>
                    <img class="imgHelp" src="../images/help2.png" title="Help Content" />
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" />

                </div>
                <br /><br />
            </div>
            <br />
            <div class="ContentTitleLeft" style="display: block; width: 100%;">

                <div class="col-xs-12 col-sm-6 col-md-6  col-lg-6" style="display: inline; float: left; border: 0px solid lightsalmon;">
                    <div >
                        <asp:Label ID="labelTitle1" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <asp:Label ID="labelContent1" runat="server" CssClass="labelContentX">Text Box Content</asp:Label>
                    </div>
                  
                    <br />
                    <div >
                        <asp:Label ID="labelTitle2" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <asp:Label ID="labelContent2" runat="server" CssClass="labelContentX">Text Box Content</asp:Label>
                    </div>
                  <br />
                    <div >
                        <asp:Label ID="labelTitle3" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <asp:Label ID="labelContent3" runat="server" CssClass="labelContentX">Text Box Content</asp:Label>
                    </div>
                  <br />
                    <div >
                        <asp:Label ID="labelTitle4" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <asp:Label ID="labelContent4" runat="server" CssClass="labelContentX">Text Box Content</asp:Label>
                    </div>

                </div>
                <div class="col-xs-12 col-sm-6 col-md-6  col-lg-6" style="display: inline; float: left; border: 0px solid lightsalmon;" >
                    <div   >
                        <asp:Label ID="labelTitle5" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <asp:Label ID="labelContent5" runat="server" CssClass="labelContentX">Text Box Content</asp:Label>
                    </div>
                    <div >
                        <asp:Label ID="labelTitle6" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>  <br />
                         <asp:Label ID="labelTitle61" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label> 
                        <input runat="server" type="text" id="DateReviewFrom" name="DateReviewFrom" class="ObservationDate" size="9" />
                         <asp:Label ID="labelTitle62" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label> 
                         <input runat="server" type="text" id="DateReviewTo" name="DateReviewTo" class="ObservationDate" size="9" />
                    </div>

                    <div  >
                        <asp:Label ID="labelTitle7" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                       <input runat="server" type="text" id="DateMid" name="DateMid" class="ObservationDate" size="9" />
                    </div>
                    <div >
                        <asp:Label ID="labelTitle8" runat="server" CssClass="labelTitleX">Text Box Title</asp:Label>
                        <input runat="server" type="text" id="DateFinal" name="DateFinal" class="ObservationDate" size="9" />
                    </div>
                </div>
            </div>

        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="btnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="btnNext_Click" />
            <%--     <asp:Button ID="btnCompetency" runat="server" Text="" OnClick="btnCompetency_Click" />--%>
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine" contenteditable="true"  placeholder="Help Content" CssClass="HelpTextBox"></asp:TextBox>
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

        <div>
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
            <asp:HiddenField ID="hfContentChange" runat="server" />
            <asp:HiddenField ID="hfTextLength" runat="server" Value="500" />
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfRubricText" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />


        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JqueryUI/jquery-ui.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>

<script>

    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID;
    var CompetencyID;
    var currentTR;
    var eventCell;
    $(document).ready(function () {
        var vHeight = window.innerHeight - apprScreenH;
        $("section").css("height", vHeight)
        Highlight_LeftMenuSelectNode();
        //   var minD = new Date($("#hfSchoolyearStartDate").val());
        //    var maxD = new Date($("#hfSchoolyearEndDate").val()); 
        $("#DateReviewFrom").datepicker(
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
        $("#DateReviewTo").datepicker(
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
        $("#DateMid").datepicker(
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
        $("#DateFinal").datepicker(
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




        if ($("#hfPageReadonly").val() == "Yes") {
            DisableTextEdit();
        }


        $("#closeActionPOP").click(function (event) {
            $("#ActionPOPDIV").fadeToggle("fast");
        });
        $(".labelTitle").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });
        $(".labelTitleX").dblclick(function (event) {
            ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
            EditPageItemTitle();
        });

        $("#btnSave").click(function (event) {
            // SaveCompentencyTextContent();
            //   return true;
        });

    });

    function DisableTextEdit() {
        $('input[type="text"], textarea').attr('readonly', 'readonly');
    }



  
    function monthDiff(sDate, eDate) {
        var Months = 0;
        try {
            var sYear = sDate.substr(0, 4);
            var eYear = eDate.substr(0, 4);
            var sMonth = parseInt(sDate.substr(5, 2), 10);
            var eMonth = parseInt(eDate.substr(5, 2), 10);

            if (sYear == eYear) {
                if (eMonth > sMonth)
                { Months = eMonth - sMonth; }
                else
                { Months = 0; }
            }
            else {
                if (eMonth > sMonth)
                { Months = 12 + eMonth - sMonth; }
                else
                { Months = 12 - sMonth + eMonth; }
            }
        }
        catch (e)
        { }
        return Months
    }

</script>
