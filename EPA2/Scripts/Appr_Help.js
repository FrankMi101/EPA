var helpDiv = $("#HelpDIV");
var CodeApp = "";
var vTop;
var vLeft;
var sWidth = window.innerWidth;
var sHeight = window.innerHeight;
$(".imgHelp").mouseleave(function (event) {
    closeHelp();
});
$(".imgEP").mouseleave(function (event) {
    closeHelp();
});

function closeHelp() {
 if (helpDiv.css('display') === "block") {
        helpDiv.fadeToggle("fast");
        ItemCode = $("#hfCode").val();
    }
}
$(".imgHelp").dblclick(function (event) {
   // if ($(this)[0].id !== "") { ItemCode = $(this)[0].id.replace("img_", ""); }
    EditPageItemTitle();
});


$(".imgEP").mouseenter(function (event) {
   // if ($(this)[0].id !== "") { CodeApp = $(this)[0].id.replace("img_", ""); }
    vTop = event.currentTarget.offsetTop;
    vLeft = event.currentTarget.offsetLeft;
    getHelp("EP", vTop, vLeft);
});
$(".imgHelp").mouseenter(function (event) {
    if ($(this)[0].id !== "") { CodeApp = $(this)[0].id.replace("img_", ""); }
    vTop = event.currentTarget.offsetTop;
    vLeft = event.currentTarget.offsetLeft;
    getHelp( "Help",vTop, vLeft);
});
function getHelp( type, vTop, vLeft) {
  //  if ($(this)[0].id !== "") { ItemCode = $(this)[0].id.replace("img_", ""); }
   // ItemCode = $("#hfCode").val();
    var helptext = EPA2.Models.WebService1.GetHelpContent("Read", UserID, CategoryID, AreaID, ItemCode + CodeApp, type, onSuccessHelp, onFailureHelp);

    //if (vLeft < 100) { vLeft = vLeft + 20; }
    //else {
    //    if (vLeft - 300 < 0) { vLeft = vLeft - 100; }
    //    else {
    //        vLeft = vLeft - 300;
    //    }
    //}
    //if (window.innerWidth < 481) {
    //    vLeft = (window.innerWidth - 300) / 2;
    //    vTop = (window.innerHeight - 180) / 2;
    //}
    //else {
    //    if (vTop + 180 > window.innerHeight) {
    //        vTop = vTop - 180 - 25;
    //    }
    //}
    //helpDiv.css({
    //    top: vTop + 25,
    //    left: vLeft
    //});
    //helpDiv.fadeToggle("fast");

}
function onFailureHelp() {

}
function onSuccessHelp(result) {
    // $("#textHelp").text(result);
    
    var helpBox = $(".HelpTextBox");
    try {
        $("#HelpTextContent").val(result);
    }
    catch (ex) {
        var se = "";
    }
    try { $("#textHelp").html(result); }
    catch (ex) { var ex = ""; }


    helpBox.css({
        width: "99%"
    });
    var n = result.length;

    var vHeight;
    var vWidth;

    if (n > 1250) vWidth = 550;
    else if (n > 1000) vWidth = 500;
    else if (n > 750 ) vWidth = 450;
    else if (n > 500) vWidth  = 400;
    else if (n > 250) vWidth = 350;
    else vWidth = 300;

    vHeight = vWidth - 100;
    if (vTop + vHeight > sHeight)
        vTop = vTop - vHeight - 20;
    if (vLeft - vWidth > 10)
        vLeft = vLeft - vWidth;
    else if (vLeft + vWidth > sWidth)
        vLeft = vLeft - vWidth/2;
    else   
        vLeft = vLeft + 25;
   // alert(vWidth);
    helpDiv.css({
        top: vTop + 20,
        left: vLeft,
        height: vHeight,
        width: vWidth
    });

    helpDiv.fadeToggle("fast");
    
}

function EditPageItemTitle() {

    if ($("#hfRunningModel").val() === "Design") {
        if ($("#ActionPOPDIV").css('display') === "block")             //TitleEditDIV
        {
            $("#ActionPOPDIV").fadeToggle("fast");
        }
        else {
            var pTitle = "Title and Help Conetent Edit";
            $("#ActioniFramePage").css({
                height: 490
            });
            goPage = "../Common/HelpEdit.aspx?type=" + CategoryID + "&aID=" + AreaID + "&iCode=" + ItemCode + CodeApp;
            $("#ActioniFramePage").attr('src', goPage);
            $("#ActionTitle").html(pTitle);
            $("#ActionPOPDIV").css({
                top: 50,
                left: 5,
                height: 520,
                width: 700
            });
            $("#ActionPOPDIV").fadeToggle("fast");
        }
    }
}

$(".labelTitle").dblclick(function (event) {
    ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
    EditPageItemTitle();
});
$(".labelTitleX").dblclick(function (event) {
    ItemCode = $("#hfCode").val() + $(this)[0].id.replace("labelTitle", "");
    EditPageItemTitle();
});
$("#closeActionPOP").click(function (event) {
    $("#ActionPOPDIV").hide(); // .fadeToggle("fast");
});