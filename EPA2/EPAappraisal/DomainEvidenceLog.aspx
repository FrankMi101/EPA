<%@ Page Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="DomainEvidenceLog.aspx.cs" Inherits="EPA2.EPAappraisal.DomainEvidenceLog" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Evidence Log check</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/ContentPage.css" rel="stylesheet" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Content/TabMenu.css" rel="stylesheet" />

    <style>
        body {
            height: 99.5%;
            width: 99.5%;
            font-size: x-small;
        }

        div {
            font-family: Arial;
            font-size: small;
        }


        .DataContentTile {
            font-family: Arial;
            font-size: small;
            font-weight: 300;
            color: blue;
            table-layout: auto;
            display: block;
            height: 99%;
        }



        .SubstituedCell {
            color: red;
            text-decoration: underline;
        }

        .emptyData {
            font-size: xx-large;
            text-align: center;
            color: blue;
        }


        .FixedHeader {
            position: absolute;
            font-weight: bold;
            width: 100%;
            display: block;
        }

        .highlightBoard {
            border: 1px blue solid;
        }

        .defaultBoard {
            border: 1px blue none;
        }

        .labelTitle {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1.1em;
        }

        .labelTitleX {
            color: forestgreen;
            font-family: Arial, sans-serif;
            font-weight: 500;
            font-size: 1em;
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
            width: 60%;
        }
        #ContentTitleLeft {
               float: left;
            display: block;
            width: 60%;
        }
        .myDomain, .myCompetency {
            display: none;
        }

     
    </style>

</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
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
                    <img class="imgRecovery" runat="server" id="imgRecovery" src="../images/recover.png" title="Recovery the Text content" visible="false" />
                    <img class="imgSignoff" runat="server" id="imgSignOff" src="../images/signature.png" title="Signed Off" visible="false" />   

                </div>
                   <div>
                   <asp:CheckBox ID="chbAllowAppraiser"   runat="server" Text="Allow appraiser to view my Evidence log" ForeColor="red" Visible="false" AutoPostBack ="true" OnCheckedChanged="ChbAllowAppraiser_CheckedChanged" />

                   </div>
            </div>
            <div class="ContentSubTitle">
                <asp:Label ID="labelSubTitle" runat="server" CssClass="labelSubTitle" Visible="false">Text Box Sub Title</asp:Label>

            </div>
            <div class="ContentMessage">
            </div>
            <br />
            <div class="ContentCompetency" runat="server">
                <ul id="ContentCompetency" runat="server">
                </ul>
            </div>

          <div style="display: block">
            <div class="Horizontal_Tab" style="margin-left: -2px;">
                <ul>
                    <li><a id="Appraiser" class="aLinkTabHS TabClass" runat="server" href="#"
                        style="min-width: 180px;">Principal  </a></li>
                    <li><a id="Appraisee" class="aLinkTabH TabClass" runat="server" href="#"
                        style="min-width: 180px;">Teacher </a></li>
                </ul>
            </div>
           
        </div>
            <div class="ContentLookForsList" runat="server" style="height:440px">
                <iframe id="IframeLookFors" name="IframeLookFors" style="height:100%; width: 99.5%"   src="iBlankPage.html" runat="server"></iframe>

            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" OnClick="BtnPrevious_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" OnClick="BtnSave_Click" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" OnClick="BtnNext_Click" />

        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>

        <div id="HelpDIV" class="bubble epahide">
            <asp:TextBox ID="HelpTextContent" runat="server"  TextMode="MultiLine"    CssClass="HelpTextBox"></asp:TextBox>
        </div>
        <div id="ActionPOPDIV" class="bubble epahide">
            <div class="editTitle" style="display: block; margin-top: 5px;">
                <div id="ActionTitle" style="display: inline; float: left; width: 96%"></div>
                <div style="display: inline; float: left;">
                    <img id="closeActionPOP" src="../images/close.ico" style="height: 25px; width: 25px; margin: -3px 0 -3px 0" />
                </div>
            </div>
            <iframe id="ActioniFramePage" name="ActioniFramePage" style="height: 425px; width: 99%"    src="iBlankPage.html" runat="server"></iframe>
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
            <asp:HiddenField ID="hfTextLength" runat="server" Value="2000" />
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" />
            <asp:HiddenField ID="hfLookForsID" runat="server" Value="1" />
            <asp:HiddenField ID="hfFirstName" runat="server" />
            <asp:HiddenField ID="hfPageReadonly" runat="server" />
            <asp:HiddenField ID="hfRubricText" runat="server" />
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" />
            <asp:HiddenField ID="hfObjRole" runat="server" />
            <asp:HiddenField ID="hfApprYear" runat="server" />
            <asp:HiddenField ID="hfApprSchool" runat="server" />
            <asp:HiddenField ID="hfApprSession" runat="server" />
            <asp:HiddenField ID="hfApprEmployeeID" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/Appr_img_title.js"></script> <script src="../Scripts/Appr_Help.js"></script>
<script src="../Scripts/Appr_textEdit.js"></script>
<script src="../Scripts/Appr_textPage.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>
<script src="../Scripts/TabMenu.js"></script>
 
<script type="text/javascript">
    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var employeeID;
    var myKey;
    var lookForsID;
    var eventCell;
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = $("#hfDomainID").val();
    var CompetencyID = $("#hfCompetencyID").val();
    var ActionRole = $("#hfAppraisalActionRole").val();
    var objRole = $("#hfObjRole").val();
    var workingItem = $("#hfCompetencyID").val();
    var allowview;
    var preTitle = "Evdiencde Log";
    var preaLinkID = objRole;

    function pageLoad(sender, args) {

        $(document).ready(function () {
            var vHeight = window.innerHeight - apprScreenH;            
            $("section").css("height", vHeight)

            Highlight_LeftMenuSelectNode();
             allowview = "0";
            if ($("#chbAllowAppraiser").prop('checked'))
            { allowview = "1"; }

            var vHeight = 440;
            if (DomainID == "1") vHeight = 390;
            if (DomainID == "3") vHeight = 390;
            if (DomainID == "5") vHeight = 480;
            $(".ContentLookForsList").css("height", vHeight); 

            if (objRole == "Appraisee")
            {
                preaLinkID = "Appraiser";
                aLinkID = "Appraisee"
                $("#" + preaLinkID).removeClass("aLinkTabHS").addClass("aLinkTabH");
                $("#" + aLinkID).removeClass("aLinkTabH").addClass("aLinkTabHS");
                preaLinkID = aLinkID;
            }
            //$("#closeActionPOP").click(function (event) {
            //    $("#ActionPOPDIV").fadeToggle("fast");
            //});

            //$(".labelTitle").dblclick(function (event) {
            //    EditPageItemTitle();
            //});
            $('.cList').each(function () {
                if ($(this)[0].id == workingItem) {
                    $(this).addClass("WorkingItem");
                    workingItem = $(this);

                }
            });

            $("#ContentCompetency a").click(function (event) {
                CompetencyID = $(this)[0].id;
                $("#hfCompetencyID").val(CompetencyID);
                if (workingItem != undefined) {
                    workingItem.removeClass("WorkingItem");
                }
                $(this).addClass("WorkingItem");
                workingItem = $(this);                              
                LoadLookForsList();
            });

            $('.TabClass').click(function (event) {
                objRole = event.target.id;
                $("#hfObjRole").val(objRole);
                LoadLookForsList()
             });
        });

    }
    function LoadLookForsList()
    {        
                var goPage = "DomainEvidenceLogLookFosList.aspx?dID=" + DomainID + "&cID=" + CompetencyID + "&vID=" + allowview + "&oID=" + objRole;
                $("#IframeLookFors").attr('src', goPage);
    }          


</script>
