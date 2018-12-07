var myTopMenu = [
    {
        "display": "System Setup",
        "role": "Admin",
        "url": "#",
        "target": "",
        "ID": "1",
        "myClass": "current-menu-item",
        "subItems": [
            {
                "display": "Appraisal Category Definition",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=AppraisalCategory",
                "target": "GoList",
                "ID": "11",
                "myClass": "Level-2"

            },
            {
                "display": "Appraisal User Management",
                "role": "Admin",
                "url": "#",
                "target": "",
                "ID": "12",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "Application User Role Setup",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=ApplicationRole",
                        "target": "GoList",
                        "ID": "121",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Application User Management",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=UserManagement",
                        "target": "GoList",
                        "ID": "122",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Multiple School Work User Management",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=MultipleSchoolUser",
                        "target": "GoList",
                        "ID": "123",
                        "myClass": "Level-3"
                    }
                ]
            },
            {
                "display": "Appraisal Process Setup",
                "role": "Admin",
                "url": "#",
                "target": "",
                "ID": "13",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "Appraisal Phase Setup",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=Phase",
                        "target": "GoList",
                        "ID": "131",
                        "myClass": "Level-3"
                    },

                    {
                        "display": "Appraisal Rate Setup",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=Rate",
                        "target": "GoList",
                        "ID": "132",
                        "myClass": "Level-3"
                    },

                    {
                        "display": "Appraisal Progress",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=Progress",
                        "target": "GoList",
                        "ID": "133",
                        "myClass": "Level-3"
                    }

                ]

            },
            {
                "display": "School Management",
                "role": "Admin",
                "url": "#",
                "target": "",
                "ID": "14",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "School District Setup",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=SchoolDistrictSetup",
                        "target": "GoList",
                        "ID": "141",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "School Region Setup",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=SchoolRegionSetup",
                        "target": "GoList",
                        "ID": "142",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "School Department Management",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=SchoolManagement",
                        "target": "GoList",
                        "ID": "143",
                        "myClass": "Level-3"
                    }
                ]
            },
            {
                "display": "Appraisal Domain Definition",
                "role": "Admin",
                "url": "#",
                "target": "",
                "ID": "15",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "Domain Set up",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=Domain",
                        "target": "GoList",
                        "ID": "151",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Competency Set Up",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=Competency",
                        "target": "GoList",
                        "ID": "152",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Look Fors Set up",
                        "role": "Admin",
                        "url": "EPAsystem/Loading.aspx?pID=LookFors",
                        "target": "GoList",
                        "ID": "153",
                        "myClass": "Level-3"
                    }
                ]
            },
            {
                "display": "Email Notification Template Edit",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=EmailTemplate",
                "target": "GoList",
                "ID": "16",
                "myClass": "Level-2"
            },
            {
                "display": "System statements add",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=BoardStatements",
                "target": "GoList",
                "ID": "17",
                "myClass": "Level-2"
            },
            {
                "display": "Appraisal Staff Roll Over",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=StaffRollOver",
                "target": "GoList",
                "ID": "18",
                "myClass": "Level-2"
            }
        ]
    },
    {
        "display": "Comments Bank",
        "role": "Principal",
        "url": "#",
        "target": "",
        "ID": "2",
        "myClass": "Level-1",
        "subItems": [
            {
                "display": "Board Goal and Strategy Setup",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=BoardGoal",
                "target": "GoList",
                "ID": "21",
                "myClass": "Level-2"
            },
            {
                "display": "Board Level Comments Bank",
                "role": "Admin",
                "url": "EPAsystem/Loading.aspx?pID=BoardBank",
                "target": "GoList",
                "ID": "22",
                "myClass": "Level-2"
            },
            {
                "display": "School Level Comments Bank",
                "role": "Principal",
                "url": "EPAsystem/Loading.aspx?pID=SchoolBank",
                "target": "GoList",
                "ID": "23",
                "myClass": "Level-2"
            },
            {
                "display": "Principal Personal Comments Bank",
                "role": "Principal",
                "url": "EPAsystem/Loading.aspx?pID=PrincipalBank",
                "target": "GoList",
                "ID": "24",
                "myClass": "Level-2"
            },
            {
                "display": "School Level eMail Notice Setup",
                "role": "Principal",
                "url": "EPAsystem/Loading.aspx?pID=eMeilNotice",
                "target": "GoList",
                "ID": "25",
                "myClass": "Level-2"
            },
            {
                "display": "School Level Statements Setup",
                "role": "Principal",
                "url": "EPAsystem/Loading.aspx?pID=SchoolStatements",
                "target": "GoList",
                "ID": "26",
                "myClass": "Level-2"
            }
        ]
    },
    {
        "display": "Appraisal Process Management",
        "role": "Principal",
        "url": "#",
        "target": "",
        "ID": "3",
        "myClass": "Level-1",
        "subItems": [
            {
                "display": "School Appraisal Staff List",
                "role": "Principal",
                "url": "EPAmanage/Loading.aspx?pID=AppraisalStaffList",
                "target": "GoList",
                "ID": "31",
                "myClass": "Level-2"
            },
            {
                "display": "School Appraisal Notification",
                "role": "Principal",
                "url": "#",
                "target": "",
                "ID": "32",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "School Appraisal ALP Batch Notice",
                        "role": "Principal",
                        "url": "EPAmanage/Loading.aspx?pID=AppraisalNoticeListALP",
                        "target": "GoList",
                        "ID": "321",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "School Appraisal Batch Notice",
                        "role": "Principal",
                        "url": "EPAmanage/Loading.aspx?pID=AppraisalNoticeList",
                        "target": "GoList",
                        "ID": "322",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Classroom Observation schedualing",
                        "role": "Principal",
                        "url": "EPAmanage/Loading.aspx?pID=AppraisalNoticeListOBS",
                        "target": "GoList",
                        "ID": "323",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "All School Staff ALP Batch Print",
                        "role": "Principal",
                        "url": "EPAmanage/Loading.aspx?pID=ALPBatchPrint",
                        "target": "GoList",
                        "ID": "324",
                        "myClass": "Level-3"
                    }
                ]
            },
            {
                "display": "School Staff Management",
                "role": "Principal",
                "url": "EPAmanage/Loading.aspx?pID=ManageStaffList",
                "target": "GoList",
                "ID": "34",
                "myClass": "Level-2"
            },
            {
                "display": "PPA Appraisal History",
                "role": "Principal",
                "url": "EPAmanage/Loading.aspx?pID=AppraisalHistory",
                "target": "GoList",
                "ID": "35",
                "myClass": "Level-2"
            },
            {
                "display": "Appraisal Staff Roll Over",
                "role": "Principal",
                "url": "EPAsystem/Loading.aspx?pID=StaffRollOver",
                "target": "GoList",
                "ID": "36",
                "myClass": "Level-2"
            }
        ]
    },
    {
        "display": "Appraisal Reports",
        "role": "Principal",
        "url": "#",
        "target": "_self",
        "ID": "4",
        "myClass": "Level-1",
        "subItems": [
            {
                "display": "School Level Appraisal Report",
                "role": "Principal",
                "url": "EPAreports/Loading.aspx?pID=SchoolReport",
                "target": "GoList",
                "ID": "41",
                "myClass": "Level-2"
            },
            {
                "display": "Board Level Appraisal Report",
                "role": "Admin",
                "url": "EPAreports/Loading.aspx?pID=BoardReports",
                "target": "GoList",
                "ID": "42",
                "myClass": "Level-2"
            },
            {
                "display": "Onsis Report",
                "role": "Admin",
                "url": "EPAreports/Loading.aspx?pID=OnsisReports",
                "target": "GoList",
                "ID": "43",
                "myClass": "Level-2"
            },
            {
                "display": "Appraisal Summary Report",
                "role": "Principal",
                "url": "Loading.aspx?pID=DefaultSummary.aspx",
                "target": "GoList",
                "ID": "44",
                "myClass": "Level-2"
            }
        ]
    },
    {
        "display": "Teacher Appraisal History",
        "role": "Teacher",
        "url": "#",
        "target": "",
        "ID": "5",
        "myClass": "Level-1",
        "subItems": [
            {
                "display": "Teacher Appraisal History",
                "role": "Teacher",
                "url": "EPAmanage/Loading.aspx?pID=AppraisalHistory",
                "target": "GoList",
                "ID": "51",
                "myClass": "Level-2"
            },
            {
                "display": "Teacher Comments on Appraisal",
                "role": "Teacher",
                "url": "EPAmanage/Loading.aspx?pID=StaffComments",
                "target": "GoList",
                "ID": "42",
                "myClass": "Level-2"
            },
            {
                "display": "Teacher Personal Bank",
                "role": "Teacher",
                "url": "EPAsystem/Loading.aspx?pID=TeacherBank",
                "target": "GoList",
                "ID": "43",
                "myClass": "Level-2"
            }
        ]
    },
    {
        "display": "Documents Help and Feedback",
        "role": "All",
        "url": "",
        "target": "",
        "ID": "9",
        "myClass": "Level-1",
        "subItems": [
            {
                "display": "User Guideline",
                "role": "All",
                "url": "Documents/Loading.aspx?pID=AppUserGuideline",
                "target": "GoList",
                "ID": "91",
                "myClass": "Level-2"
            },
            {
                "display": "Ministry Guideline Documents",
                "role": "All",
                "url": "#",
                "target": "",
                "ID": "92",
                "myClass": "Level-2",
                "subItems": [
                    {
                        "display": "Experiences Teacher Guidline",
                        "role": "All",
                        "url": "Documents/Loading.aspx?pID=MinistryGuidelineE",
                        "target": "GoList",
                        "ID": "921",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "New Teacher Induction",
                        "role": "All",
                        "url": "Documents/Loading.aspx?pID=MinistryGuidelineNTIP",
                        "target": "GoList",
                        "ID": "922",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "LTO Teacher Guideline",
                        "role": "All",
                        "url": "Documents/Loading.aspx?pID=MinistryGuidelineLTO",
                        "target": "GoList",
                        "ID": "923",
                        "myClass": "Level-3"
                    },
                    {
                        "display": "Principal Appraisal Guidline",
                        "role": "All",
                        "url": "Documents/Loading.aspx?pID=MinistryGuidelinePPA",
                        "target": "GoList",
                        "ID": "924",
                        "myClass": "Level-3"
                    }
                ]
            },
            {
                "display": "Ministry Appraisal FAQ ",
                "role": "All",
                "url": "Documents/Loading.aspx?pID=MinistryAppraisalFAQ",
                "target": "GoList",
                "ID": "93",
                "myClass": "Level-2"
            },
            {
                "display": "Feed Back",
                "role": "All",
                "url": "Javascript:OpenPopPage('Feed Back');",
                "target": "_self",
                "ID": "94",
                "myClass": "Level-2"
            },
            {
                "display": "School Appraisal Summary",
                "role": "All",
                "url": "Loading.aspx?pID=AppraisalSummary",
                "target": "GoList",
                "ID": "95",
                "myClass": "Level-2"
            }
        ]
    }
];

function myTopNav(myMenuList) {
    //  var CurrentUserRole = $("#ctl00_hfCurrentUserRole").val();
    //  var menulist = myTopNavRecurse(myMenuList, "");
    var menulist = myTopNavLoop2(myMenuList, "N");
    $("#TopNav").html("");
    $("#TopNav").html(menulist);
    var menulistM = myTopNavLoop2(myMenuList, "M");
    $("#TopNavM").html("");
    $("#TopNavM").html(menulistM);

}
function myTopNavM(myMenuList) {
    var menulistM = myTopNavLoop2(myMenuList, "M");
    $("#TopNavM").html("");
    $("#TopNavM").html(menulistM);
}

var ctlID = "";
function myTopNavLoop(myMenuList, mobile) {
    var CurrentUserRole = $("#" + ctlID + "hfCurrentUserRole").val();
    if (myMenuList.length > 0) {
        var menulist = '<ul class="Level1" id="' + mobile + 'UA0' + '" > '; // "&nbsp |&nbsp";
        for (var i = 0; i < myMenuList.length; i++) {
            if (checkItemShowbyRole(CurrentUserRole, myMenuList[i].role) === "Show") {
                menulist += getMyALink(myMenuList, i, 'A', mobile);
                if (typeof (myMenuList[i].subItems) !== 'undefined' && myMenuList[i].subItems.length > 0) {
                    var myMenuList2 = myMenuList[i].subItems;
                    var menulist2 = '<ul class="' + getULclass("Level2", mobile, 'UA' + myMenuList[i].ID) + '" id="' + mobile + 'UA' + myMenuList[i].ID + '" > ';
                    for (var j = 0; j < myMenuList2.length; j++) {
                        if (checkItemShowbyRole(CurrentUserRole, myMenuList2[j].role) === "Show") {
                            menulist2 += getMyALink(myMenuList2, j, 'B', mobile);
                            if (typeof (myMenuList2[j].subItems) !== 'undefined' && myMenuList2[j].subItems.length > 0) {
                                var myMenuList3 = myMenuList2[j].subItems;
                                var menulist3 = '<ul class="' + getULclass("Level3", mobile, 'UA' + myMenuList2[j].ID) + '" id="' + mobile + 'UB' + myMenuList2[j].ID + '" > ';
                                for (var l = 0; l < myMenuList3.length; l++) {
                                    menulist3 += getMyALink(myMenuList3, l, 'C', mobile);
                                }
                                menulist2 += menulist3 + '</ul>' + '</li> ';
                            }
                        }
                    }
                    menulist += menulist2 + '</ul>' + '</li> ';
                }
            }
        }
        menulist += '</ul>';
    }
    return menulist;
}
function myTopNavLoop2(myMenuList1, mobile) {
    var CurrentUserRole = $("#" + ctlID + "hfCurrentUserRole").val();
    if (myMenuList1.length > 0) {
        var menulist1 = '<ul class="Level1" id="' + mobile + 'UA0' + '" > '; // "&nbsp |&nbsp";
        for (var i = 0; i < myMenuList1.length; i++) {
            if (checkItemShowbyRole(CurrentUserRole, myMenuList1[i].role) === "Show") {
                menulist1 += getMyALink(myMenuList1, i, 'A', mobile);
                if ( typeof (myMenuList1[i].subItems) !== 'undefined' && myMenuList1[i].subItems.length > 0) {
                    var myMenuList2 = myMenuList1[i].subItems;
                    var menulist2 = '<ul class="' + getULclass("Level2", mobile, 'UA' + myMenuList1[i].ID) + '" id="' + mobile + 'UA' + myMenuList1[i].ID + '" > ';
                    for (var j = 0; j < myMenuList2.length; j++) {
                        if (checkItemShowbyRole(CurrentUserRole, myMenuList2[j].role) === "Show") {
                            menulist2 += getMyALink(myMenuList2, j, 'B', mobile);
                            if (typeof (myMenuList2[j].subItems) !== 'undefined' && myMenuList2[j].subItems.length > 0  ) {
                                var myMenuList3 = myMenuList2[j].subItems;
                                var menulist3 = '<ul class="' + getULclass("Level3", mobile, 'UA' + myMenuList2[j].ID) + '" id="' + mobile + 'UB' + myMenuList2[j].ID + '" > ';
                                for (var l = 0; l < myMenuList3.length; l++) {
                                    menulist3 += getMyALink(myMenuList3, l, 'C', mobile);
                                }
                                menulist2 += menulist3 + '</ul>' + '</li> ';
                            }
                        }
                    }
                    menulist1 += menulist2 + '</ul>' + '</li> ';
                }
            }
        }
        menulist1 += '</ul>';
    }
    return menulist1;
}

/* this is Recurse method to build menu list, but some how it does not work.*/

function myTopNavRecurse(myMenuList, menulist) {
    var CurrentUserRole = $("#" + ctlID + "hfCurrentUserRole").val();
    if (myMenuList.length > 0) {
        menulist += '<ul class="Level1" id="' + 'UA-0' + '" > '; // "&nbsp |&nbsp";
        for (var i = 0; i < myMenuList.length; i++) {
            if (checkItemShowbyRole(CurrentUserRole, myMenuList[i].role) === "Show") {
                menulist += getMyALink(myMenuList, i, 'A');
                if (typeof (myMenuList[i].subItems) === 'undefined') {
                    // menulist += '</ul>' + '</li> ';
                }
                else {
                    if (myMenuList[i].subItems.length > 0) {
                        myTopNavRecurse(myMenuList[i].subItems, menulist);
                    }
                }
            }
        }
        menulist += '</ul>';
    }
    return menulist;
}



function checkItemShowbyRole(CurrentUserRole, RoleItem) {
    var roleStr = "";
    switch (CurrentUserRole) {
        case "Admin":
            roleStr = "Access, Admin, Principal, All";
            break;
        case "Teacher":
            roleStr = "Access, Teacher, All";
            break;
        case "Principal":
            roleStr = "Access ,Principal, All";
            break;
        case "VicePrincipal":
            roleStr = "Access ,Principal, All";
            break;
        default:
            roleStr = "Access, Principal, All";
            break;
    }

    if (roleStr.indexOf(RoleItem) === -1)
    { return "Hide"; }
    else
    { return "Show"; }

}

function getMyALink(myArray, k, level, mobile) {
    var myString = ' <li> <a ' + 'id="' + level + '-' + myArray[k].ID + '" '
        + 'class="' + myArray[k].myClass + '" '
        + 'href="' + getUrl(myArray[k].url, myArray[k].subItems, mobile) + '" '
        + 'target="' + getTarget(myArray[k].target, myArray[k].subItems, mobile) + '" >'
        + myArray[k].display + '</a> ';
    //    + getStr(myArray[k].subItems, "ImgStr", "</li>", level);
    if (typeof (myArray[k].subItems) === 'undefined') {
        myString += '</li> ';
    }
    else {
        if (level === "B") {
            myString += ' <img style ="height:25px; width:30px; float:right; padding-top:-3px;" src="images/submenu.png" /> ';
        }
    }
    return myString;
}
function getTarget(target, subitem, mobile) {
    if (mobile === "M") {
        if (typeof (subitem) === "undefined") {
            target = "GoList";
        }
    }
    return target;
}
function getUrl(url, subitem, mobile) {
    var rUrl = "";
    if (mobile === "M") {
        if (typeof (subitem) === "undefined")
        { rUrl = url; }
        else {
            rUrl = "#";
        }
    }
    else { rUrl = url; }
    return rUrl;
}
function getULclass(level, mobile, id) {
    var rClass = level;
    if (mobile === "M") {
        rClass = level + " hideMenuItem";
    }
    return rClass
}

function getStr(mySubItem, sType, pValue, level) {
    var rStr = "";
    if (typeof (mySubItem) === 'undefined') {
        rStr = pValue;
    }
    else {
        if (level === "A") {
            rStr = pValue;
        }
        else {
            switch (sType) {
                case "ImgStr":
                    rStr = '  <img src="images/submenu.png" /> ' + pValue;
                    break;
                case "Href":
                    rStr = '#';
                    break;
                case "Target":
                    rStr = '_self';
                    break;
                default:
                    rStr = '_self';
                    break;
            }
        }
    }
    return rStr;
}



function OpenPopPage(goPage) {
    if (goPage === "Feed Back") {
        window.open("CommonPage/BaseFeedBack.aspx", "FormFeedBack", "width=700 height=550, top=20, left=20, toolbars=no, scrollbars=no,status=no,resizable=no");
    }
    if (goPage === "User Guildline") {
        window.open("CommonPage/LoadingDocument.aspx?dID=SS Forms Guide 2010-2011.pdf", "FormFeedBack", "width=700 height=550, top=20, left=20, toolbars=no, scrollbars=no,status=no,resizable=no");
    }
    if (goPage === "School Security") {
        var UserID = $("#" + ctlID + "hfUserID").val();
        window.open("CommonPage/PageLoading.aspx?Page=https://webapp.tcdsb.org/ssm/SecurityManage.aspx?aID=IEP%26uID=" + UserID, "FormFeedBack", "width=750 height=650, top=20, left=20, toolbars=no, scrollbars=no,status=no,resizable=no");
    }
}

$(document).ready(function () {

    try {

        $("#TopMenuItems a").hover(
            function (e) {
                var cEvantID = e.originalEvent.srcElement.id;
                var x = $("#" + cEvantID).position();
                openTopSubMenu(cEvantID, x.top, x.left);

            },
            function (e) {
                var cEvantID = e.originalEvent.srcElement.id;
                var x = $("#" + cEvantID).position();
                if (currentY > x.top)
                { $("#TopSubMenuItems").hide(); }

            }
        );

        $("#TopNavM ul li").click(function (event) {

            var cEventID = "";
            var level = "1";
            try {
                cEventID = event.currentTarget.childNodes['3'].id;    //event.currentTarget.children['1'].id;// event.originalEvent.srcElement.id;
                if (cEventID === "") {
                    cEventID = event.currentTarget.childNodes['5'].id;    //event.currentTarget.children['1'].id;// event.originalEvent.srcElement.id;
                    level = "2";
                }
                //  window.alert(cEventID + " " + level + " " + currentNodeLevel1 + " " + currentNodeLevel2);
                openTopSubMenuM(cEventID, level);

                if (event.target.target === "GoList") {
                    $("#TopNavM").hide();
                    $("#" + currentNodeLevel1).removeClass("showMenuItem").addClass("hideMenuItem");
                    $("#" + currentNodeLevel2).removeClass("showMenuItem").addClass("hideMenuItem");
                }


                event.stopPropagation();
            }
            catch (e) {
            }

            //  window.alert(event.currentTarget.childNodes['3'].className);
            //  var x = $("#" + cEventID).position();
        });


    }
    catch (ex)
    { var exm = ex; }
});


var mouse_x = 0;
var mouse_y = 0;
function getMousepoints() {
    mouse_x = event.clientX + document.body.scrollLeft;//to get client window X axis 
    mouse_y = event.clientY + document.body.scrollTop; //to get client window Y axis 
    return true;
}

function openSupportInformation(vLoading, vH, actions) {

    if ($("#ctl00_IframeSupport").attr("src") === "#")
    { $("#ctl00_IframeSupport").attr("src", vLoading); }

    $("#SupportInfoDIV").css({
        top: mouse_y + 10,
        left: mouse_x - 420,
        height: vH,
        width: 400
    });
    $("#SupportInfoDIV").fadeToggle("fast");
}
function openTopSubMenu(cEventID, eY, eX) {

    var myArray = getmyJosnArrybyID(cEventID);
    myTopSubMenuList(myArray);
    var eH = getSubMenuListCount(myArray);
    $("#TopSubMenuItems").css({
        top: eY + 26,
        left: eX - 2,
        height: eH,
        width: 300
    });
    $("#TopSubMenuItems").show();
    currentY = eY;
    //  $("#TopSubMenuItems").fadeToggle("fast");
    //if (currentY != eY) {
    //    $("#TopSubMenuItems").fadeToggle("fast");
    //}

}
function openTopSubMenuM(cEventID, Level) {

    //var cName = event.currentTarget.childNodes['3'].className;
    //cName = cName.replace("hideMenuItem", "showMenuItem")
    //event.currentTarget.childNodes['3'].className = cName;
    // window.alert(event.currentTarget.childNodes['3'].className);
    try {
        // window.alert( "F=" +currentNodeLevel1 + " S= " + currentNodeLevel2 + " Level= " + Level);
        if (Level === "1") {
            if (currentNodeLevel1 === cEventID) {
                $("#" + cEventID).removeClass("showMenuItem").addClass("hideMenuItem");
                currentNodeLevel1 = "";
            }
            else {
                if (currentNodeLevel1 !== "") {
                    $("#" + currentNodeLevel1).removeClass("showMenuItem").addClass("hideMenuItem");
                }
                $("#" + cEventID).removeClass("hideMenuItem").addClass("showMenuItem");
                currentNodeLevel1 = cEventID;
            }
        }
        else {
            if (currentNodeLevel2 === cEventID) {
                $("#" + cEventID).removeClass("showMenuItem").addClass("hideMenuItem");
                currentNodeLevel2 = "";
            }
            else {
                if (currentNodeLevel2 !== "") {
                    $("#" + currentNodeLevel2).removeClass("showMenuItem").addClass("hideMenuItem");
                }
                $("#" + cEventID).removeClass("hideMenuItem").addClass("showMenuItem");
                currentNodeLevel2 = cEventID;
            }
        }

    }
    catch (e) { }
    // window.alert(event.currentTarget.childNodes['3'].className);
    //window.alert(openObj[0].className);
    //window.alert(openObj[0].className);
    //  window.alert($("#" + cEventID)[0].className);
    //  currentY = eY;

}