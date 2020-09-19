<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridAreasLayout.aspx.cs" Inherits="EPA2.Mobile.GridAreasLayout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/DeviceMedia.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" /> 

    <link href="../Content/TopLink.css" rel="stylesheet" />
    <link href="../Content/TopNavList.css" rel="stylesheet" />
    <link href="../Content/TopNavListM.css" rel="stylesheet" /> 

    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
 
    <script src="../Scripts/NavTopList.js"></script>
    <style>

        body {
            margin: 40px;
        }

        .sidebar {
            grid-area: sidebar;
        }

        .sidebar2 {
            grid-area: sidebar2;
        }

        .content {
            grid-area: content;
        }
        .content2 {
            grid-area: content2;
        }
        .header {
            grid-area: header;
        }
        .navbar {
            grid-area: navbar;
        }
        .footer {
            grid-area: footer;
        }

        .wrapper {
            background-color: #fff;
            color: #444;
        }

        .wrapper {
            display: grid;
            grid-gap: 1em;
            grid-template-areas:
                               "header"
                               "navbar"
                               "sidebar"
                               "content"
                               "content2"
                               "sidebar2"
                               "footer"
        }

        @media only screen and (min-width: 500px)  {
            .wrapper {

                grid-template-columns: 20% auto;
                grid-template-areas:
                                   "header   header"
                                   "navbar   navbar"
                                   "sidebar  content"
                                   "content2 content2"
                                   "sidebar2 sidebar2"
                                   "footer   footer";
            }
        }

        @media only screen and (min-width: 600px)   {
            .wrapper {
                grid-gap: 20px;
                grid-template-columns: 120px auto 120px;
                grid-template-areas:
                                   "header  header  header"
                                   "navbar  navbar  navbar"
                                   "sidebar content sidebar2"
                                   "content2 content2 content2"
                                   "footer  footer  footer";
                max-width: 600px;
            }
        }
        @media only screen and (min-width: 800px)   {
            .wrapper {
                grid-gap: 20px;
                grid-template-columns: 150px auto 150px;
                grid-template-areas:
                                   "header  header  header"
                                   "navbar  navbar  navbar"
                                   "sidebar content sidebar2"
                                   ". content2 ."
                                   "footer  footer .";
                max-width: 800px;
            }
        }
        @media only screen and (min-width: 1000px)   {
            .wrapper {
                grid-gap: 20px;
                grid-template-columns: 200px auto 100px 200px;
                grid-template-areas:
                                   "header  header header header"
                                   "navbar  navbar  navbar navbar"
                                   "sidebar content content2 sidebar2"
                                   "footer  footer  footer footer";
                max-width: 1000px;
            }
        }

        .box {
            background-color: #444;
            color: #fff;
            border-radius: 5px;
            padding: 10px;
            font-size: 150%; 
        }

        .header,
        .footer {
            background-color: #999;
        }

        .sidebar2 {
            background-color: #ccc;
            color: #444;
        }
        .content2 {
            background-color: aquamarine;
        }
    </style>
</head> 
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
        <div class="box header"> Header </div>
            <div class="box navbar"> 
                <div class="TopMenubar">
                    <nav id="TopNav" class="pull-left visible-sm visible-md visible-lg">
                    </nav>

                    <div class="navbar-header pull-left visible-xs hideme">

                        <button id="MobileMenu" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsable-nav" aria-expanded="false">
                         
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <div id="collapsable-nav" class="collapse navbar-collapse" style="margin-top: -10px; margin-left: 0px; padding: 0px;">
                            <nav id="TopNavM">
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
            <div class="box sidebar">Sidebar</div>
            <div class="box sidebar2">Sidebar 2</div>
            <div class="box content">Content
                                    <br /> More content than we had before so this column is now quite tall.</div>
            <div class="box content2"> This area is Content 2 </div>
            <div class="box footer">Footer</div>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    myTopNav(myTopMenu);
    var currentY = 0;
    var currentNodeLevel1;
    var currentNodeLevel2;
</script>
