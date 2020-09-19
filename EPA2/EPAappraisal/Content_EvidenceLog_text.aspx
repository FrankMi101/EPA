<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Content_EvidenceLog_text.aspx.cs" Inherits="EPA2.EPAappraisal.ContentEvidenceLogText" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Recovery</title>
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Content/TabMenu.css" rel="stylesheet" /> 
    <style type="text/css">
        body {
            height: 99%;
            width: 99%;
            margin:auto;
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
        .selectTab {
        background-color:coral;
        }
      
        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey {
            display: none;
            width: 0px;
        }
        #tabButton {
        display:none;
        }
        .TabClass { 
          text-decoration-line:none;     
        }
            .TabClass:hover {
             background-image: url(../images/OrangeExplorerH.png);
            }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body onkeydown="if(event.keyCode==8 &amp;&amp; (!(event.srcElement.tagName=='INPUT' || event.srcElement.tagName=='TEXTAREA'))){return false}">
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
              <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />

            </Services>
        </asp:ScriptManager>
        <div>
     
                    <asp:Label ID="Label3" runat="server" Text="School Year: "></asp:Label>
                    <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                    </asp:DropDownList>
                 <div class="Horizontal_Tab" style ="margin-left:-2px;">
                        <ul>
                            <li><a id="Appraiser" class="aLinkTabHS TabClass" runat="server" href="#"
                               style="min-width: 180px;">Principal  </a></li>
                            <li><a id="Appraisee" class="aLinkTabH TabClass" runat="server" href="#"
                                 style="min-width: 180px;">Teacher </a></li>
                         </ul>
                    </div>

        </div>

        <div class="ContentTextarea">
                <asp:TextBox ID="myTextEvidenceLog" runat="server"   Height="280px" MaxLength="2000" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </div>
                 <asp:Label runat="server" Font-Size= "X-Small"  ForeColor="Red" ID="remaind22" Text="* Highlight the content, and then [Ctrl+C ] copy the content, and then [Ctrl+V] Paste the content in Comments area."> </asp:Label>
    
        <div>
           <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" /> 
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" /> 
            <asp:HiddenField ID="hfDomainID" runat="server" Value="1" />
            <asp:HiddenField ID="hfCompetencyID" runat="server" Value="1" /> 
            <asp:HiddenField ID="hfAppraisalActionRole" runat="server" Value="" /> 
            <asp:Button ID="tabButton" runat="server" Text="" OnClick="tab_chaneged" />
                <asp:HiddenField ID="hfSelectedTab" runat="server" />
                        <asp:HiddenField ID="hfSelectedTabL" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/TabMenu.js"></script>
 
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
    var UserID = $("#hfUserID").val();
    var CategoryID = $("#hfCategory").val();
    var AreaID = $("#hfArea").val();
    var ItemCode = $("#hfCode").val();
    var DomainID = $("#hfDomainID").val();
    var CompetencyID = $("#hfCompetencyID").val();
    var workingItem = $("#hfCompetencyID").val();
    var imgItem = "img_" + workingItem;
    var ActionRole = $("#hfAppraisalActionRole").val();
    var preaLinkID = "Appraiser";
    var preTitle =""
    function pageLoad(sender, args) {

        $(document).ready(function () {
            //if (preaLinkID == "")
            //{
            //    preaLinkID = "Appraiser";
            //}
            //$("#" + preaLinkID).parentNode.addClass("selectTab");

            $('.TabClass').click(function (event) {
                //$("#" + preaLinkID).parentNode.removeClass("selectTab");
                //$("#hfActionRole").val(event.target.id);
                //$("#tabButton").click();
                actionRole = event.target.id;
                //$("#" + preaLinkID).parentNode.addClass("selectTab");
                var evidencetext = EPA2.Models.WebService1.GetCompetencyEvidenceLog("Get", UserID, CategoryID, AreaID, ItemCode, DomainID, CompetencyID, actionRole, onSuccessLog, onFailure);


            });
  
        });

    }
    function onSuccessLog(result) {
        $("#myTextEvidenceLog").val(result);
    }
    function onFailure(result) {
        window.alert(result);
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
