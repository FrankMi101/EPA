<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TPAALP10.aspx.cs" Inherits="EPA2.EPAappraisal.Tpaalp10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/TabMenu.css" rel="stylesheet" />
    <style>
        body {
            margin: 1px;
        }

        img {
            margin-bottom: 2px;
        }

        .helpImg {
            height: 25px;
            width: 25px;
            margin-bottom: -5px;
        }


        header, footer {
            display: block;
            height: 25px;
        }
        footer {
           display: block;
            height: 25px;
            margin-bottom:-10px;
        }
        section {
        height:600px;
        width:100%;
        border-top:1px solid silver;
        border-bottom:1px solid silver;
        }
        
        .ContentPageHeader {
            width: 100%;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(skyblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(skyblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(skyblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(skyblue, white); /* Standard syntax */
        }

        .pageTitle {
            font-weight: 900;
            color: #000000;
            margin-top: -5px;
            padding-left: 5px;
        }
        .saveButton {
            width:120px;
             margin-right:50px;
        }
            .saveButton:hover {
            background-color:coral;
            color:white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="ContentPageHeader" id="PageTitle" runat="server">
            </div>

        </header>
        <section>
            <div>

                <div>
                    <div style="display: inline; width: 100%; float: left; border: 1px solid lightsalmon; margin: -1px">

                        <div class="Centraldiv">
                            <div class="TitleArea">
                                <asp:Label ID="title_EPA_Summary_11" runat="server" Text="Current Appraisal Status" CssClass="Title1"></asp:Label>
                                <img id="EPA_Summary_11" src="../images/help2.png" class="helpImg" /><a href="#">Appraisal Summary  </a>
                            </div>
                            <div>
                                <h3>Appraisal Summary Page will show the selected appraisee's appraisal process </h3>
                                <asp:TreeView ID="TreeView1" runat="server" Width="100%" NodeWrap="True" ShowCheckBoxes="All">
                                </asp:TreeView>
                            </div>



                        </div>

                    </div>



                </div>



                <h1>Annual Learning Plan page 10</h1>
                <br />

                <h1>TPA ALP 10 </h1>
            </div>
        </section>


        <footer>
            <asp:Button ID="btnPrevious" runat="server" Text="<<  Previous" CssClass="saveButton" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="saveButton" />
            <asp:Button ID="btnNext" runat="server" Text="Next  >>" CssClass="saveButton" />
        </footer>
        <%--   <div class="bottom">
            &nbsp;
        </div>--%>
        <div>
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfArea" runat="server" />
            <asp:HiddenField ID="hfCode" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfParameters" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>

<script>
    
    $(document).ready(function () {
        var vHeight = screen.height -150 -110 -70;
        $("section").css("height", vHeight)
        

        $("img").mouseenter(function (event) {
            ItemCode = $(this)[0].id;
            //  $(this).css("background-color", "skyblue");
            $(this).addClass("imgOver");
        });

        $("img").mouseleave(function (event) {
            //    $(this).css("background-color", "");
            //    $("p").removeClass("myClass noClass").addClass("yourClass");
            $(this).removeClass("imgOver");
        });

        $('img').click(function (event) {
            ItemCode = $(this)[0].id;
            if (ItemCode === "imgRefresh") {
                location.reload(true);
            }
            else {
                if ($("#EditDIV").css('display') === "block") {
                    $("#EditDIV").hide();
                }
                else {

                    var titel = getTitlebyCode(ItemCode, "Title");
                    var pId = getTitlebyCode(ItemCode, "Code");

                    $("#EditTitle").val(titel);
                    var parameter = $("#hfParameters").val();
                    var goPage = "Loading.aspx?pID=" + pId + "&" + parameter;
                    var vTop = event.currentTarget.offsetTop;
                    var vLeft = event.currentTarget.offsetLeft;
                    $("#editiFrame").attr('src', goPage);
                    $("#EditDIV").css({
                        top: vTop + 30,
                        left: vLeft - 600
                    })

                    $("#EditDIV").fadeToggle("fast");
                }

            }
        });
    })
      
</script>
